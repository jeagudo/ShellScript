#!/bin/bash
proceso="backupd"
if [ $# -eq 1 ]; then
  proceso=$1
fi
estado=$(ps -ax | grep $proceso | head -n -1 | awk '{print $3}' | head -n1)
echo $estado
if [ ${#estado} -gt 0 ]; then
  if [ $estado == "R" ]; then
   echo "Se esta ejecutando $proceso"
   echo "No se está ejecutando $proceso" | mail -s "Estado$proceso" yo@dominio.com alertas@cpd.pri
  else
    echo "No se está ejecuntando $proceso"
   echo "No se está ejecutando $proceso" | mail -s "Estado$proceso" yo@dominio.com alertas@cpd.pri

  fi
  
else
 echo "Error no existe el proceso"
fi

