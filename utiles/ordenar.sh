#!/bin/bash
#J. Enrique Agudo
#1. Ordenad el fichero /etc/passwd por orden alfabético.
#2. Ordenadlo en sentido inverso.
#3. Ordenadlo ignorando mayúsculas.
#4. Ordenadlo según el tercer campo.
#5. Ordenadlo según el tercer campo en orden numérico.
#6. Ordenadlo según el cuarto campo en orden numérico y eliminando repeticiones.

echo "1. Ordenad el fichero /etc/passwd por orden alfabético."
echo "2. Ordenadlo en sentido inverso."
echo "3. Ordenadlo ignorando mayúsculas."
echo "4. Ordenadlo según el tercer campo."
echo "5. Ordenadlo según el tercer campo en orden numérico."
echo "6. Ordenadlo según el cuarto campo en orden numérico y eliminando repeticiones."
echo "Selecciona una opción..."
read opcion

case $opcion in
  1) cat /etc/passwd | sort;;
  2) cat /etc/passwd | sort -r;;
  3) cat /etc/passwd | sort -f;;
  4) cat /etc/passwd | sort -t: -k3;;
  5) cat /etc/passwd | sort -t: -k3 -n;;
  6) cat /etc/passwd | sort -t: -k4 -n -u;;
  *)echo "Error, opción no es correcta";;
esac
