#!/bin/bash
# J. Enrique Agudo
Fichero="banco.txt"
error (){
echo "USO $0 [-a]|[-s][-l]"
exit 1
}

if [ $# -ne 1 -a $# -ne 2 -a $# -ne 4]; then
  error
fi

case $1 in
  "-a"|"-add")
  if [ $# -ne 4]; then
   error
  fi
  echo $2 $3 $4 >> $Fichero;;
  "-s"|"-search");;
  "-l"|"-list");;
   *)error;;
esac
