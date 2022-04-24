import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PaiementAdminComponent } from './paiement-admin.component';

describe('PaiementAdminComponent', () => {
  let component: PaiementAdminComponent;
  let fixture: ComponentFixture<PaiementAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PaiementAdminComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PaiementAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
