

{Realizar un programa que permita crear un archivo conteniendo información de
nombres de materiales de construcción, el archivo no es ordenado. Efectúe la
declaración de tipos correspondiente y luego realice un programa que permita la
carga del archivo con datos ingresados por el usuario. El nombre del archivo debe
ser proporcionado por el usuario. La carga finaliza al procesar el nombre ‘cemento’
que debe incorporarse al archivo.}

Program Ejercicio1;

Const 
  fin = 'cemento';

Type 
  materiales = Record
    nombre: string[20];
  End;
  tArchivo = file Of materiales;


Var 
  nombreArch, nombreMat: string;
  arch: tArchivo;
  registro: materiales;
Begin

  writeln('Ingrese nombre archivo');
  readln(nombreArch);

  assign(arch,nombreArch);
  Rewrite(arch);
  Repeat
    writeln('Ingrese nombre material');
    readln(nombreMat);
    registro.nombre := nombreMat;

    Write(arch,registro);
  Until (nombreMat = fin);

  close(arch);
  writeln('Contenido del archivo: ');
  reset(arch);
  While (Not eof(arch)) Do
    Begin
      read(arch, registro);
      writeln(registro.nombre);
    End;
  close(arch);
End.
