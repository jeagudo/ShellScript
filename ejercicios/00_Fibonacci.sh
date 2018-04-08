#/bin/bash
#J. Enrique Agudo
#Sucesión de fibonacci
max=10 #Por defecto muestra los 10 primeros elementos de la serie
if [ $# -eq 1 ];then
  max=$1
fi
anterior=0
siguiente=1
echo $anterior
echo $siguiente
for (( i=0; i<max-2; i++ ))
do
  aux=$siguiente
  siguiente=$(($anterior+$siguiente))
  anterior=$aux
  echo $siguiente
done
