import { Component, OnInit } from '@angular/core';
import { PublicationService } from '../services/publication.service';
import { Publication } from '../publication';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'router-outlet',
  templateUrl: './publication.component.html',
  styleUrls: ['./publication.component.css']
})
export class PublicationComponent implements OnInit {
    publications: Publication[] = [];
	selectedPublication: Publication = { nomPrenomDest: '',
    telDest: '',
    adresseDest: '',
    prixColis: '',
    fraisLivraison: '',
    etat: '',
    numColis: 0,
    poids: '',
    libelleColis: ''}
    
	constructor(private publicationService: PublicationService) {
		this.publicationService.readPublications().subscribe((publications: Publication[])=>{
		this.publications = publications;
		console.log(this.publications);
	}) }
	ngOnInit()
	{
	}
	createOrUpdatePublication(form: NgForm){
		form.value.nomPrenomDest = this.selectedPublication.nomPrenomDest;
		form.value.telDest = this.selectedPublication.telDest;
		form.value.adresseDest = this.selectedPublication.adresseDest;
    form.value.prixColis = this.selectedPublication.prixColis;
    form.value.fraisLivraison = this.selectedPublication.fraisLivraison;
    form.value.etat = this.selectedPublication.etat;
    form.value.numColis = this.selectedPublication.numColis;
    form.value.poids = this.selectedPublication.poids;
    form.value.libelleColis = this.selectedPublication.libelleColis;
		if(this.selectedPublication && this.selectedPublication.numColis){
			this.publicationService.updatePublication(form.value).subscribe((publication: Publication)=>{
			console.log("Publication mise a jour!" , publication);
			this.publicationService.readPublications().subscribe((publications: Publication[])=>{
				this.publications = publications;
			})
		});
	}
	else{
		this.publicationService.createPublication(form.value).subscribe((publication: Publication)=>{
			console.log("Publication cree, ", publication);
			this.publicationService.readPublications().subscribe((publications: Publication[])=>{
				this.publications = publications;
			})
		});
	}
}

selectPublication(publication: Publication){
	this.selectedPublication = publication;
}

deletePublication(numColis: number){
	this.publicationService.deletePublication(numColis).subscribe((publication: Publication)=>{
		console.log("Publication supprimee, ", publication);
		this.publicationService.readPublications().subscribe((publications: Publication[])=>{
			this.publications =publications;
		})
	});
}
}