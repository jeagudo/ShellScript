#!/bin/bash
#J. Enrique Agudo
#Como comprobar si existe o no un parámetro o una variable
#Util para si no existe darle otro valor
#Nota: También podríamos comprobar el número de parámetros
a=${1:-"NO"}
if [ $a == "NO" ]; then
echo "no hay parametro 1"
else
echo "si hay parametro 1"
variable="hola"
fi

b=${variable-"NO"}
if [ $b == "NO" ]; then
echo "No existe variable"
else
echo "Si existe variable"
fi
