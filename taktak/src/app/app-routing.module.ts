import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PaiementAdminComponent } from './paiement-admin/paiement-admin.component';
import { WithNavBarComponent } from './with-nav-bar/with-nav-bar.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { InscriComponent } from './inscri/inscri.component';
import { DemandeComponent } from './demande/demande.component';
import { ProfilComponent } from './profil/profil.component';
import { HomeComponent } from './home/home.component';
import { PublicationComponent } from './publication/publication.component';
import { AjouterPubComponent } from './ajouter-pub/ajouter-pub.component';
import { EditProfileComponent } from './edit-profile/edit-profile.component';
import { ModifPubComponent } from './modif-pub/modif-pub.component';
const routes: Routes = [
  { path: '', component: WithNavBarComponent ,children:[
    { path: 'paiement', component: PaiementAdminComponent },
    { path:'profil', component: ProfilComponent},
    {path:'',component:HomeComponent},
    {path:'publication',component:PublicationComponent},
    {path:'ajouter-publication',component:AjouterPubComponent},
    {path:'edit-profile',component:EditProfileComponent},
    {path:'modif-pub',component:ModifPubComponent}

  ] },
  
  { path: 'login', component: LoginPageComponent },
  { path:'inscri', component:InscriComponent},
  { path:'demande', component:DemandeComponent}


 
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)], 
exports: [RouterModule]
})
export class AppRoutingModule { }
