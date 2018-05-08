#!/bin/bash
#J. Enrique Agudo 
# “script_puerto.sh”: script que reciba como argumento un número de puerto TCP (PUERTO) y comprobará si el valor es un número entero positivo en el rango “[1, 1023]”, de modo que:
# Si es así: el script analizará si los puertos TCP “PUERTO” y “PUERTO+1” del equipo local se encuentran a la escucha. Tras ello, imprimirá un mensaje indicando el estado obtenido. Para ello, puede analizar la salida del comando "netstat".
# En otro caso: imprimirá por pantalla un mensaje indicando que el valor indicado no es un puerto de sistema.
if [ $# -ne 1 ]; then
  echo "Error al menos un parámetro"
  exit 1
fi


if [ $(($1*1)) -gt 0 ] && [ $(($1*1)) -lt 1024 ]; then
  echo "En rango"
puerto1=$(netstat -putona 2> /dev/null | grep ":$1" | awk '{print $6}'| grep "ESCUCHAR")
puerto2=$(netstat -putona 2> /dev/null | grep ":$(($1+1))" | awk '{print $6}'| grep "ESCUCHAR")
if [ -n "$puerto1" ]; then
  echo $1 "Está escuchando"
else
  echo $1 "No Está escuchando"
fi
if [ -n "$puerto2" ]; then
  echo $(($1+1)) "Está escuchando"
else
  echo $(($1+1)) "No Está escuchando"
fi
else
  echo "El parámetro tiene que estar entre 1 y 1023"
  exit 1
fi

