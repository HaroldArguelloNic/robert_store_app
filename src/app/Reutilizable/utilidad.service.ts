import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Sesion } from '../Interfaces/sesion';


@Injectable({
  providedIn: 'root'
})
export class UtilidadService {

  constructor(private _snackBar:MatSnackBar) { }

  mostrarAlerta(mensaje:string,tipo:string){
    this._snackBar.open(mensaje,tipo,{
      horizontalPosition:"end",
      verticalPosition:"top",
      duration:3000
    })
  }


 guardarSesionUsuario(usuarioSesion: Sesion): void {
  if (usuarioSesion) {
    sessionStorage.setItem("usuario", JSON.stringify(usuarioSesion));
  } else {
    console.log("Usuario Null");
  }
}

obtenerSesionUsuario(): Sesion | null {
  const dataCadena = sessionStorage.getItem("usuario");
  if (dataCadena) {
    return JSON.parse(dataCadena!);
  }
  return null;
}

eliminarSesionUsuario(): void {
  sessionStorage.removeItem("usuario");
}


}
