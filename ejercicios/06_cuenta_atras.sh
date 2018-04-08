#/bin/bash
#Crear un script llamado cuenta_atras.sh que nos pida dos números cualesquiera, 
#deberá mostrar por pantalla todos los números entre el mayor de los dos introducidos y el menor. 
#(Así si introducimos 20 1 nos mostrará los números del 20 al 1, si introducimos 56 89 nos mostrará 
#los números del 89 al 56).
if [ $# -ne 2 ]; then
  echo "USO: $0 numero1 numero2"
fi
if [ $1 -gt $2 ]; then
  for ((i=$1;i>=$2;i--))
   do
    echo $i
   done
else
  for ((i=$2;i>=$1;i--))
   do
    echo $i
   done
fi
