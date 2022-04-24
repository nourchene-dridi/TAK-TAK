import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModifPubComponent } from './modif-pub.component';

describe('ModifPubComponent', () => {
  let component: ModifPubComponent;
  let fixture: ComponentFixture<ModifPubComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModifPubComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModifPubComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
  
});
