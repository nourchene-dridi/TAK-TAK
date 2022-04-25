import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Publication } from '../publication';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PublicationService {
	PHP_API_SERVER = "http://localhost:92/TAK-TAK/taktak/api";
	constructor(private httpClient: HttpClient) {}
	readPublications(): Observable<Publication[]>{
		return this.httpClient.get<Publication[]>(`${this.PHP_API_SERVER}/index.php`);
	}
	createPublication(publication: Publication): Observable<Publication>{
		return this.httpClient.post<Publication>(`${this.PHP_API_SERVER}/create_publication.php`, publication);
	}
	updatePublication(publication: Publication){
		return this.httpClient.put<Publication>(`${this.PHP_API_SERVER}/update_publication.php`, publication);
	}
	deletePublication(numColis: number){
		return this.httpClient.delete<Publication>(`${this.PHP_API_SERVER}/delete_publication.php/?numColis=${numColis}`);
	}
}
