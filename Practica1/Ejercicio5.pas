

{Realizar un programa, con la declaración de tipos correspondientes que permita
crear un archivo de registros no ordenados con información de especies de flores
originarias de América. La información será suministrada mediante teclado. De
cada especie se registra: número de especie, altura máxima, nombre científico,
nombre vulgar, color y altura máxima que alcanza. La carga del archivo debe
finalizar cuando se reciba como nombre científico: ’zzz’.
Además se deberá contar con opciones del programa que posibiliten:
    a) Reportar en pantalla la cantidad total de especies y la especie de menor y de
    mayor altura a alcanzar.
    b) Listar todo el contenido del archivo de a una especie por línea.
    c) Modificar el nombre científico de la especie flores cargada como: Victoria
    amazonia a: Victoria amazónica.
    d) Añadir una o más especies al final del archivo con sus datos obtenidos por
    teclado. La carga finaliza al recibir especie “zzz”.
    e) Listar todo el contenido del archivo, en un archivo de texto llamado “flores.txt”.
    El archivo de texto se tiene que poder reutilizar.
    f) ¿Qué cambiaría en la escritura del archivo de texto si no fuera necesario
    utilizarlo?
}

Program Ejercicio5;

Const 
  fin = 'zzz';

Type 
  tflor = Record
    numEspecie: integer;
    alturaMax: real;
    nombreCientifico: string[30];
    nombreVulgar: string[30];
    color: string[30];
  End;
  tarchivoFlor = file Of tflor;

Procedure crearArchivo(Var archivoLogico:tarchivoFlor);

Var 
  nombreArchivo: string;
Begin
  writeln('Ingrese nombre del archivo');
  readln(nombreArchivo);
  assign(archivoLogico,nombreArchivo);
  rewrite(archivoLogico);
  close(archivoLogico);
End;

Procedure cargarArchivo(Var archivoLogico:tarchivoFlor);

Var 
  data: tflor;
Begin
  reset(archivoLogico);
  seek(archivoLogico, filesize(archivoLogico));
  writeln('Ingrese datos de la especie: ');
  writeln('Ingrese nombre cientifico: ');
  readln(data.nombreCientifico);

  While (data.nombreCientifico <> fin) Do
    Begin
      writeln('Ingrese nombre vulgar: ');
      readln(data.nombreVulgar);

      writeln('Ingrese numero de especie: ');
      readln(data.numEspecie);

      writeln('Ingrese altura maxima: ');
      readln(data.alturaMax);

      writeln('Ingrese color de la flor');
      readln(data.color);

      write(archivoLogico, data);

      writeln('Ingrese nombre cientifico: ');
      readln(data.nombreCientifico);

    End;
  close(archivoLogico);
End;


Procedure a_reporte(Var archivoLogico: tarchivoFlor);

Var 
  alturaMin, alturaMax: real;
  especieMax, especieMin: string;
  cantidadEspecies: integer;
  data: tflor;
Begin
  alturaMin := 99999;
  alturaMax := -1;
  reset(archivoLogico);
  cantidadEspecies := 0;
  While (Not eof(archivoLogico)) Do
    Begin
      cantidadEspecies := cantidadEspecies + 1;
      read(archivoLogico,data);
      If (data.alturaMax > alturaMax) Then
        Begin
          alturaMax := data.alturaMax;
          especieMax := data.nombreVulgar;
        End
      Else
        If (data.alturaMax < alturaMin ) Then
          Begin
            alturaMin := data.alturaMax;
            especieMin := data.nombreVulgar;
          End;
    End;
  close(archivoLogico);
  If (cantidadEspecies = 0 ) Then
    Begin
      writeln('No hay especies cargadas');
    End
  Else
    Begin
      writeln('Cantidad de especies: ', cantidadEspecies);
      writeln('Planta de altura Maxima: ', especieMax);
      writeln('Planta de altura Minima: ', especieMin);
    End;
End;

Procedure b_listar(Var archivoLogico:tarchivoFlor);

Var 
  data: tflor;
Begin
  reset(archivoLogico);
  While (Not eof(archivoLogico)) Do
    Begin
      read(archivoLogico,data);
      writeln('Numero de Especie: ', data.numEspecie , 'nombre cientifico: ', data.nombreCientifico
              , 'nombre comun: ', data.nombreVulgar , 'altura maxima: ', data.alturaMax , 'color: ',
              data.color);
    End;
  close(archivoLogico);
End;

Procedure c_cambiarNombre(Var archivoLogico: tarchivoFlor);

Var 
  nombreCient: string;
  encontre: boolean;
  data: tflor;
Begin
  reset(archivoLogico);
  encontre := false;
  writeln('Ingrese nombre de la especie a modificar: ');
  readln(nombreCient);
  While Not (eof(archivoLogico) Or encontre) Do
    Begin
      read(archivoLogico,data);
      If (data.nombreCientifico = nombreCient) Then
        Begin
          encontre := true;
          writeln('flor encontrada, ingrese nuevo nombre: ');
          readln(data.nombreCientifico);
          seek(archivoLogico, filepos(archivoLogico) - 1);
          write(archivoLogico, data);
        End;
    End;
  If (Not encontre) Then
    writeln('flor no encontrada');
  close(archivoLogico);
End;

Procedure e_Listar(Var archivoLogico:tarchivoFlor);

Var 
  archivoTexto: text;
  nombreArchivo: string;
  data: tflor;
Begin
  reset(archivoLogico);
  writeln('Ingrese nombre del archivo de texto: ');
  readln(nombreArchivo);
  assign(archivoTexto,nombreArchivo);
  rewrite(archivoTexto);
  While (Not eof(archivoLogico)) Do
    Begin
      read(archivoLogico, data);
      writeln(archivoTexto, '-----------------');
      writeln(archivoTexto, 'Nombre científico: ', data.nombreCientifico);
      writeln(archivoTexto, 'Nombre vulgar: ', data.nombreVulgar);
      writeln(archivoTexto, 'Color: ', data.color);
      writeln(archivoTexto, 'Número de especie: ', data.numEspecie);
      writeln(archivoTexto, 'Altura máxima: ', data.alturaMax);
      writeln(archivoTexto, '-----------------');
    End;
  close(archivoTexto);
  close(archivoLogico);
End;

Var 
  archivoFlores: tarchivoFlor;
  opcion: char;
Begin

  While True Do
    Begin
      writeln();
      writeln('Elija una opcion');
      writeln('0) Crear/recrear archivo');
      writeln('a) Reportar en pantalla la cantidad especies y la especie de menor y mayor altura');
      writeln('b) Listar todo el contenido del archivo de a una especie por linea.');
      writeln('c) Modificar el nombre cientifico de una especie flores cargada');
      writeln('d) agregar una o mas especies al final del archivo');
      writeln('e) Listar todo el contenido del archivo, en un archivo de texto');
      writeln('z) Salir');
      writeln();
      readln(opcion);
      Case opcion Of 
        '0': crearArchivo(archivoFlores);
        'a': a_reporte(archivoFlores);
        'b': b_listar(archivoFlores);
        'c': c_cambiarNombre(archivoFlores);
        'd': cargarArchivo(archivoFlores);
        'e': e_Listar(archivoFlores);
        'z': break;
        Else writeln('Opcion no valida');
      End;
    End;

End.
