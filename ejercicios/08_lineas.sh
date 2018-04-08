#!/bin/bash
#lineas.sh. Script que aceptará tres parámetros, el primero será un carácter cualquiera, 
#el segundo un número entre 1 y 60 y el tercero un número entre 1 y 10. El script debe dibujar
#por pantalla tantas líneas como indique el parámetro 3, cada línea formada por tantos caracteres
#del tipo parámetro 1 como indique el número indicado en parámetro 2. El script debe controlar que
#no se le pase alguno de los parámetros y que los números no estén comprendidos entre los límites indicados. 
#Ejemplo: ./líneas.sh k 20 5 (escribirá 5 líneas, cada una de ellas formadas por 20 letras k.

if [ $# -ne 3 ]; then
  echo "USO: $0 caracter numero lineas"
  exit 1
fi

if [ ${#1} -ne 1 ]; then
  echo "El primer parámetro es solo un carácter"
  exit 1
fi

if [ $2 -gt 60 ] || [ $2 -lt 1 ]; then
  echo "El número de carácteres tiene que estar entre 1 y 60"
  exit 1
fi

if [ $3 -gt 10 ] || [ $3 -lt 1 ]; then
  echo "El número de líneas tiene que estar entre 1 y 10"
  exit 1
fi

for ((i=0;i<$3;i++))
do
for ((j=0;j<$2;j++))
do
echo -n $1
done
echo ""
done
