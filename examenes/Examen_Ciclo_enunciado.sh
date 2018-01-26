#!/bin/bash

# Examen final shell script - 20 de Junio de 2012

# Alumno: <Indica aquí tu nombre completo>

 

fichero=$1

 

compruebaParametro()

	{

 

	}

 

cambiaUsuarioPropietario()

	{

 

	}

 

cambiaGrupoPropietario()

	{

 

	}

 

cambiaPermisos()

	{

 

	}

 

muestraMenu()

	{

	clear

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

compruebaParametro

muestraMenu

leeOpcion

procesaOpcion
