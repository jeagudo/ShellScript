#/bin/bash
#Crear un script con nombre crear.sh que admita dos parámetros, el primero indicará el nombre de un fichero,
# y el segundo su tamaño. El script creará en el directorio actual un fichero con el nombre dado y el tamaño 
#dado en Kilobytes. En caso de que no se le pase el segundo parámetro, creará un fichero con 1.024 Kilobytes 
#y el nombre dado. En caso de que no se le pase ningún parámetro, creará un fichero con nombre fichero_vacio 
#y un tamaño de 1.024 Kilobytes.
#Modificar del ejercicio 
# Para que antes de crear el fichero compruebe que no exista. En caso de que
#exista avisará del hecho por pantalla y creará el fichero pero añadiéndole un 1 al final del nombre (aguado1, por ejemplo).
# Si también existe un fichero con ese nombre, lo creará con un 2 al final del nombre, así seguiremos hasta intentar el 9. 
# Si también existe un fichero con 9 al final del nombre, avisará del hecho y no creará nada.

tamanio=1024
fichero="fichero_vacio"

case $# in
0) ;;
1) fichero=$1;;
2) fichero=$1
   tamanio=$2;;
*) echo "Parametros incorrectos"
   exit 1;;
esac

if [ -f $fichero ]; then
 for ((i=1;i<10;i++))
  do
   if [ ! -f "$fichero$i" ]; then
     echo "$fichero$i"
     dd if="/dev/zero" of="$fichero$i" bs=1024 count=$tamanio
     break
   else
     if [ $i -eq 9 ]; then
       echo "No es posible crear el fichero, ni las 9 copias"
     fi
   fi
  done
else
  dd if="/dev/zero" of=$fichero bs=1024 count=$tamanio
fi
