#!/bin/bash
#Escriba un shell script que se ejecute de esta manera y cumpla con las condiciones
#detalladas a continuación: 
#./miScript.sh -u username -p path -t tipo_archivos
#Donde
#username
# es el nombre de usuarios que debe buscar. Por defecto deberá de ser el 
#usuario que invoca al shell script.
#path
#es  la ruta a partir de la que tiene que buscar. Por defecto deberá de ser el 
#directorio casa  del usuario que ejecuto el script.
#tipo_archivos
# es el tipo de archivos que debe buscar. Por defecto deberán de ser 
#archivos de tipo texto.
#Si se introduce el comando erróneamente o de la siguiente manera, el archivo deberá 
#de mostrar la ayuda:
# (notese que es un “menos menos HELP”)
#./miScript.sh –-help
#El resultado de ejecutar el shell script sera que presentara en pantalla un listado de 
#los archivos que cumplan las características solicitadas
#El script deberá de tener los comentarios necesarios para entenderlo adecuadamente. 
#Si el programa crea algún archivo temporal, deberá de borrarlo al finalizarse.
#El orden de las banderas no deberá de influir en la ejecución del escript. Así mismo, al 
#final de la ejecución, se deberán de borrar todas la variables y archivos temporales.
username=""
path=""
tipo=""
#Muestra mensajes de error
error() 
{
 case $1 in
    1)echo "Error, parámetros incorrectos";;
    2)echo "Error, Opción incorrecta";;
    *)echo "Error no especificado";;
 esac
}
#Muestra el uso del script
uso()
{
  echo "USO: $0 [-u username -p path -t tipo_archivos]"
  exit 1
}
#Dados dos parametros extrae su valor
extraerParametros(){
case $1 in
 "-u")username=$2;;
 "-p")path=$2;;
 "-t")tipo=$2;;
  *) error 2;;
esac
}
#comprobamos los parámetros
case $# in
  0);; # No hay ningún parametro
  1)if [ $1 = "--help" ]; then
     uso
    else
     error 1
     uso
    fi;;
  2)extraerParametros $1 $2;;
  4)extraerParametros $1 $2
    extraerParametros $3 $4;;
  6)extraerParametros $1 $2
    extraerParametros $3 $4
    extraerParametros $5 $6;;
  *)error 1
    uso;;
esac
#Comprobamos valores, si no están asignados se los asignamos por defecto
if [ -z $username ]; then
  username=$(whoami)
fi
if [ -z $path ]; then
  path="/home/"$username
fi
if [ -z $tipo ]; then
  tipo="txt"
fi
echo "--------------Resultado de la búsqueda----------------"
#Realizamos la búsqueda
find $path -type f -user $username -name "*$tipo"
