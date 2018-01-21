#/bin/bash
#J. Enrique Agudo
# Verificar que un proceso está activo
if [ $# -ne 1 ]; then
  echo "USO: $0 nombre_proceso"
fi
#Método 1
procesos=$(ps -ax | grep -v $0 | grep -v grep | grep $1) 
# Añado grep -v para que el propio script y el comando grep no aparezcan
if [ ${#procesos} -eq 0 ]; then
  echo "El proceso $1 no está activo 1"
else
  echo "El proceso $1 está activo 1"
fi
#Método 2
if ps -ax | grep -v $0 | grep -v grep | grep $1 > /dev/null; then
  echo "El proceso $1 está activo 2"
else
  echo "El proceso $1 no está activo 2"
fi
