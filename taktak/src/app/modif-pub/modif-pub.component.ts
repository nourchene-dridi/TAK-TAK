import { Component, OnInit } from '@angular/core';
import { PublicationService } from '../services/publication.service';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-modif-pub',
  templateUrl: './modif-pub.component.html',
  styleUrls: ['./modif-pub.component.css']
})
export class ModifPubComponent implements OnInit {
  nomPrenomDest: string = '';
  telDest: string = '';
  emailDest: string = '';
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

  setPublication(formValue: NgForm){
    console.log(formValue.value);
  }
}
