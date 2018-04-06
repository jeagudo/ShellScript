#!/bin/bash
# Se desea sumar el espacio ocupado por un usuario en un
#directorio y todos sus subdirectorios. Para ello, deben sumarse los tamaños
#de todos los archivos de ese usuario en esa rama de directorios.
#El script recibirá como parámetros el nombre del usuario y el nombre del
#directorio.
#Validará que el usuario pertenezca al sistema, y que el nombre de
#directorio recibido sea efectivamente un directorio.
#Presentará el resultado total en bytes, Kbytes y Mbytes enteros.
# *Sugerencia:* usar el comando find con listado largo; el tamaño de archivo
#en el listado largo está entre las columnas 47 y 56.  
if [ $# -ne 2 ];then
  echo "USO $0 usuario directorio"
  exit 1
fi
existe=$(cat "/etc/passwd" | awk -F":" '{print $1}' | grep $1)
if [ "$existe" = "" ]; then
  echo "Error: No existe el usuario $1 en el sistema"
  exit 1
fi
if [ ! -d $2 ]; then
  echo "Error: $2 no es un directorio"
  exit 1
fi

total=$(find $2 -user $1 -exec ls -l {} \; | awk '{total=total+$5}END {print total}')
echo "$total bytes"
kbytes=$(($total/1024))
if [ $kbytes -gt 0 ]; then
  echo "$kbytes KB"
fi
mbytes=$(($kbytes/1024))
if [ $mbytes -gt 0 ]; then
  echo "$mbytes MB"
fi
