import { Component, OnInit } from '@angular/core';
import { PublicationService } from '../services/publication.service';
import { Publication } from '../services/publication';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-ajouter-pub',
  templateUrl: './ajouter-pub.component.html',
  styleUrls: ['./ajouter-pub.component.css']
})
export class AjouterPubComponent implements OnInit {

  nomPrenomDest: string = '';
  telDest: string = '';
  adresseDest:string = '';
  prixColis: string = '';
  fraisLivraison:string = '';
  etat:string = '';
  numColis:string = '';
  poids:string = '';
  libelleColis:string = '';

  
  constructor(private publicationService: PublicationService) { }

  ngOnInit(): void {
  }

  addPublication(formValue: NgForm){
    console.log(formValue.value);
    const postBody = {
      numColis: formValue.value.numColis,
      libelleColis: formValue.value.libelleColis,
      prixColis: formValue.value.prixColis,
      fraisLivraison: formValue.value.fraisLivraison,
      poids: formValue.value.poids,
      etat: formValue.value.etat,
      nomPrenomDest: formValue.value.nomPrenomDest,
      telDest: formValue.value.telDest,
      adresseDest: formValue.value.adresseDest
    }
   
    this.publicationService.addPubli(postBody).subscribe(data => {
      console.log(data);
    }, (err)=>{
      console.log("Impossible d'ajouter une publication! " + err); 
    })
  }
}
