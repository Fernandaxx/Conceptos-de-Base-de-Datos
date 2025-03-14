

{Crear un procedimiento que reciba como parámetro el archivo del punto 2,  y
genere un archivo de texto con el contenido del mismo.}

Program Ejercicio4;

Type 
  archivoBinario = file Of integer;

Procedure ConvertirArchivo(Var archivoBin: archivoBinario; nombreArchivoText: String);

Var 
  archivoTexto: Text;
  info: integer;
Begin
  assign(archivoTexto, nombreArchivoText + '.txt');
  rewrite(archivoTexto);

  While Not eof(archivoBin) Do
    Begin
      read(archivoBin, info);
      writeln(archivoTexto, info);
    End;

  close(archivoTexto);
End;

Var 
  nombreArchivoBin, nombreArchivoText: string;
  archivoBin: archivoBinario;
Begin
  writeln('Ingrese nombre del archivo binario:');
  readln(nombreArchivoBin);

  assign(archivoBin, nombreArchivoBin);
  reset(archivoBin);


  writeln('Ingrese nombre del archivo de texto:');
  readln(nombreArchivoText);

  ConvertirArchivo(archivoBin, nombreArchivoText);
  writeln('Archivo de texto creado exitosamente.');

  close(archivoBin);
End.
