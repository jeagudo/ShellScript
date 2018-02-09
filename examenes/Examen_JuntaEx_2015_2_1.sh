#!/bin/bash
#Examen cuerpo técnico de la Junta de Extremadura
#2.1. Codificar un Shell script para que compruebe si un cierto número de puerto TCP que sa ha
#pasado como parámetro está en estado de escucha (LISTENING). El shell script sacará por
#pantalla información indicando si el puerto está en dicho estado o no. El shell script
#tiene que acaptar como parámetro un número entre 1 y 1024, en caso contrario sacara un
#mensaje de error y finalizará.

# Comprobamos que hay 1 parámetro
if  [ $# -ne 1 ]; then
  echo "USO: $0 puerto"
  exit 1
fi
#Comprobamos que está entre 1 y 1024
if [ $1 -lt 1 ] || [ $1 -gt 1024 ]; then
  echo "Error, el puerto tiene que estar entre 1 y 1024"
  exit 1
fi
#Ejecutamos el comando y comprobamos que está ejecutando
resultado=$(netstat -lt | grep $1)
if [ ${#resultado} -gt 0 ]; then
  echo "Escuchando $1"
else
  echo "No escuchando $1"
fi
