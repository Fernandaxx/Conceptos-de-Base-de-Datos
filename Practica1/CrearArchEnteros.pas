

Program Ejercicio2;

Type 
  tVotosCiudad = Record
    cantidad: integer;
  End;

  tArchivo = file Of tVotosCiudad;

Var 
  archivoEnteros: tArchivo;
  cant: integer;
  reg: tVotosCiudad;

Begin
  assign(archivoEnteros,'Votantes');
  Rewrite(archivoEnteros);

  writeln('ingrese num');
  readln(cant);

  While (cant <> -1) Do
    Begin
      reg.cantidad := cant;
      write(archivoEnteros,reg);
      writeln('ingrese num');
      readln(cant);
    End;

  writeln('Contenido del archivo: ');
  reset(archivoEnteros);
  While (Not eof(archivoEnteros)) Do
    Begin
      read(archivoEnteros, reg);
      writeln(reg.cantidad);
    End;
  close(archivoEnteros);


End.
