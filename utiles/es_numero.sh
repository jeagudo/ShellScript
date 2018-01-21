#!/bin/bash
# J. Enrique Agudo
# Ejemplos para comprobar que un parámetro es un numero
#Metodo 1 es entero
es_numero='[0-9]+$'
if ! [[ $1 =~ $es_numero ]]; then
  echo  "No es un numero 1" $1
else
  echo "Es numero 1" $1
fi

#Metodo 2 es entero
if [ $1 -eq $1 ] 2>/dev/null; then
  echo "Es numero 2" $1
else
  echo "No es numero 2" $1
fi

#Metodo 3 es un numero
if [[ $1 = *[[:digit:]]* ]]; then
  echo "Es numero" $1
else
  echo "No es numero" $1
fi
