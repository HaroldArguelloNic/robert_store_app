import { Component,OnInit } from '@angular/core';

//import necesarios
import { Router } from '@angular/router';
import { Menu } from 'src/app/Interfaces/menu';
//servicios
import { MenuService } from 'src/app/Services/menu.service';
import { UtilidadService } from 'src/app/Reutilizable/utilidad.service';


@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.css']
})
export class LayoutComponent {

  listaMenu:Menu[]=[];
  correoUsuario:string="";
  rolUsuario:string="";

//Injectar dependencias
  constructor(
    private router:Router,
    private _menuServicio:MenuService,
    private _utilidadServicio:UtilidadService
  ) {}

  ngOnInit():void{
    const usuario=this._utilidadServicio.obtenerSesionUsuario();
    if(usuario){
      this.correoUsuario=usuario.correo;
      this.rolUsuario=usuario.rolDescripcion;
      console.log(usuario.idUsuario)
      this._menuServicio.ListaMenuUsuario(usuario.idUsuario).subscribe({
        next:(data)=>{
          if(data.status){
            this.listaMenu=data.value;
          }
        },
        error:(e)=>{}
      })

    }
    console.log(usuario)
  }
  cerrarSesion(){
    this._utilidadServicio.eliminarSesionUsuario();
    this.router.navigate(["login"]);
  }

}
