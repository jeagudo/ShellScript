#!/bin/bash
#J. Enrique Agudo
  exam1=0
  exam2=0
  exam3=0
  media=0
  mediaFinal=0.0
  cont=0
  aptos=0
  echo "+---------------------------------------+-------+-------+"
  echo "+ Nombre	EX1	EX2	EX3	+  MED  + APTO  +"
  echo "+---------------------------------------+-------+-------+"
while read linea;do
  cont=$((cont + 1))
  nota1=$(echo $linea | awk '{print $2}')
  nota2=$(echo $linea | awk '{print $3}')
  nota3=$(echo $linea | awk '{print $4}')
  exam1=$(echo "scale=1;$exam1 + $nota1" | bc)
  exam2=$(echo "scale=1;$exam2 + $nota3" | bc)
  exam3=$(echo "scale=1;$exam3 + $nota3" | bc)
  media=$(echo "scale=1;($nota1 + $nota2 + $nota3)/3" | bc)
  mediaFinal=$(echo "scale=1;$mediaFinal + $media" | bc)
  echo -n "+ "
  echo -n $(echo $linea | awk '{print $1}')
  echo -n -e "\t"$nota1
  echo -n -e "\t"$nota2
  echo -n -e "\t"$nota3
  echo -n -e "\t+  "$media
  mediaEntera=$(echo "scale=0;$media/1" | bc)
  if [ $mediaEntera -ge 5 ]; then
    echo -n -e "\t+  SI"
    aptos=$((aptos + 1))
  else
    echo -n -e "\t+  NO"
  fi
  echo -e "\t+" 
done < "notas.csv"

  echo "+---------------------------------------+-------+-------+"
  echo -n "+ TOTAL" 
  echo  -n -e "\t\t"$(echo "scale=1;$exam1/$cont" | bc)
  echo  -n -e "\t"$(echo "scale=1;$exam2/$cont" | bc)
  echo  -n -e "\t"$(echo "scale=1;$exam3/$cont" | bc)
  echo  -n -e "\t+ "$(echo "scale=1;$mediaFinal/$cont" | bc)
  echo -e "\t+  "$aptos"\t+"
  echo "+---------------------------------------+-------+-------+"
