import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WithNavBarComponent } from './with-nav-bar.component';

describe('WithNavBarComponent', () => {
  let component: WithNavBarComponent;
  let fixture: ComponentFixture<WithNavBarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ WithNavBarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(WithNavBarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
