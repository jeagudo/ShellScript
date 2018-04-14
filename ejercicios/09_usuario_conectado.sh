#!/bin/bash
# J. Enrique Agudo

function ayuda() {
cat << DESCRIPCION_AYUDA
SYNOPSIS
    $0 Nombre_usuario
DESCRIPCION
  Devuelve:
	SI si NOMBRE_USUARIO coincide con algún usuario conectado o
	NO si NOMBRE_USUARIO no coincide con ningún usuario conectado
CÓDIGOS DE RETORNO
  1 Si el número de parámetros es distinto de 1
DESCRIPCION_AYUDA
}
if [ $# -ne 1 ]; then
  ayuda
fi

CONECTADO=$(who | grep $1)
if [ -z "$CONECTADO" ]; then
 echo "No"
else
 echo "SI"
fi
