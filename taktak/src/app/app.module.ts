import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { PaiementAdminComponent } from './paiement-admin/paiement-admin.component';
import { WithNavBarComponent } from './with-nav-bar/with-nav-bar.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { InscriComponent } from './inscri/inscri.component';
import { DemandeComponent } from './demande/demande.component';
import { ProfilComponent } from './profil/profil.component';
import { PublicationComponent } from './publication/publication.component';
import { HomeComponent } from './home/home.component';
import { AjouterPubComponent } from './ajouter-pub/ajouter-pub.component';
import { EditProfileComponent } from './edit-profile/edit-profile.component';
import { ModifPubComponent } from './modif-pub/modif-pub.component';


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    SidebarComponent,
    PaiementAdminComponent,
    WithNavBarComponent,
    LoginPageComponent,
    InscriComponent,
    DemandeComponent,
    ProfilComponent,
    PublicationComponent,
    HomeComponent,
    AjouterPubComponent,
    EditProfileComponent,
    ModifPubComponent,
   
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
