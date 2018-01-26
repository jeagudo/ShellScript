#!/bin/bash

# Examen final shell script - 20 de Junio de 2012
# Hay que tener permisos de root para cambiar usuarios y grupos
# Autor: J. Enrique Agudo

fichero=$1

compruebaParametro()
{
  if [ $1 -ne 1 ]; then
  echo "USO: $0 nombreFichero"
  exit 1
  fi

  if [ ! -f $fichero ]; then
    echo "Error: No existe el fichero $fichero"
    exit 1
  fi
}

cambiaUsuarioPropietario()
{
echo "Nombre de Usuario nuevo: "
read nombre
if ! id $nombre > /dev/null 2>&1; then
  echo "Usuario nuevo no existe"
  exit 1
fi
chown $nombre $fichero
}
cambiaGrupoPropietario()
{
echo "Nombre del grupo nuevo: "
read grupo
if ! chgrp $grupo $fichero; then
  exit 1
fi
}


cambiaPermisos()
{
echo "Permisos a cambiar: "
read permisos
if ! chmod $permisos $fichero; then
  exit 1
fi
}


muestraMenu()
	{
#	clear
	echo
	echo "Elige una opción:"
	echo " 1) Cambiar al usuario propietario."
	echo " 2) Cambiar al grupo propietario."
	echo " 3) Cambiar los permisos."
	}


leeOpcion()
{
	read -p "Opcion: " opcion
}



procesaOpcion()

	{

	case $opcion in

	1) cambiaUsuarioPropietario;;

	2) cambiaGrupoPropietario;;

	3) cambiaPermisos;;

	*) echo "Opción INCORRECTA"

		 sleep 2;;

	esac

	}

 

#----------------------------------

# Parte principal o main del script

#----------------------------------

compruebaParametro $#

muestraMenu

leeOpcion

procesaOpcion
