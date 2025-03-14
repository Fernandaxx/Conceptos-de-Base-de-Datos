
{Desarrollar un programa que permita la apertura de un archivo de números enteros
no ordenados. La información del archivo corresponde a la cantidad de votantes
de cada ciudad de la Provincia de Buenos Aires en una elección presidencial.
Recorriendo el archivo una única vez, informe por pantalla la cantidad mínima y
máxima de votantes. Además durante el recorrido, el programa deberá listar el
contenido del archivo en pantalla. El nombre del archivo a procesar debe ser
proporcionado por el usuario}

Program Ejercicio2;

Type 
  tArchivo = file Of integer;

Var 
  max,min : integer;
  num: integer;
  nomArch: string;
  ArchVotos: tArchivo;



Begin
  max := -1;
  min := 999999;
  writeln('ingrese nombre del archivo de votos:');
  readln(nomArch);
  assign(ArchVotos,nomArch);
  Reset(ArchVotos);
  While (Not eof(ArchVotos)) Do
    Begin
      read(ArchVotos,num);
      writeln(num);
      If (num > max) Then
        max := num;
      If (num < min ) Then
        min := num;
    End;

  writeln('Maximo: ', max);
  writeln('Minimo: ', min);
  close(ArchVotos);


End.
