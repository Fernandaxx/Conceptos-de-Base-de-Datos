
{Realizar un programa que permita crear un archivo de texto. El archivo se debe
cargar con la información ingresada mediante teclado. La información a cargar
representa los tipos de dinosaurios que habitaron en Sudamérica. La carga finaliza
al procesar el nombre ‘zzz’ que no debe incorporarse al archivo.}

Program Ejercicio3;

Const 
  fin = 'zzz';


Var 
  archivoDino : Text;
  nombreArchivo: string;

Procedure crear_archivo(Var archivo: Text; Var nombreArchivo:String);
Begin
  writeln('Ingrese nombre del archivo');
  readln(nombreArchivo);
  assign(archivo, nombreArchivo);
  rewrite(archivo);
End;

Procedure cargar_info(Var archivo: Text);

Var nombreDino: string;
Begin
  writeln('Ingrese nombre del dino');
  readln(nombreDino);
  While (nombreDino <> fin) Do
    Begin
      writeln(archivo, nombreDino);
      writeln('Ingrese nombre del dino');
      readln(nombreDino);
    End;
End;

Begin
  crear_archivo(archivoDino,nombreArchivo);
  cargar_info(archivoDino);
  close(archivoDino);


End.
