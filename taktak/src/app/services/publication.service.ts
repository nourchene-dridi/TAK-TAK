import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Publication } from './publication';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PublicationService { 
  baseURL: string = "./api/publication.php";
  constructor(private http: HttpClient) { }

  getPublis(): Observable<Publication[]> {
    console.log('getPublis '+this.baseURL + 'publis')
    return this.http.get<Publication[]>(this.baseURL + 'publis')
  }
 
  addPubli(publication:Publication): Observable<any> {
    const headers = { 'content-type': 'application/json'}  
    const body=JSON.stringify(publication);
    console.log(body)
    return this.http.post(this.baseURL + 'people', body,{'headers':headers})
  }
}
