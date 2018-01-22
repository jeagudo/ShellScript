#/bin/bash
#J. Enrique Agudo
#
#Elabora un Shell script que nos permitirá gestionar las copias de seguridad
#de un determinado directorio, que se recibirá por parámetro.
#Admitirá como argumento dos parámetros, el primero deberá ser Backup o
#Restore, y el segundo el nombre de un directorio.
#Si el primer parámetro es Backup, el Shell realizará una copia de seguridad
#(backup), para todos los usuarios del sistema, en el directorio pasado como
#segundo argumento.
#Si el primer parámetro es Restore, el Shell deberá restaurar todas las
#copias de seguridad guardadas en el directorio pasado como segundo
#parámetro. Se supone que restaura en el home.

destino="/home/"$(whoami) #por defecto restaura en HOME
seguridad="seguridad" #Nombre de la copia de seguridad

#Error si los parametros son incorrectos
error() {
  echo "USO: $0 backup|restore directorio"
  exit 1
}
#Realiza la copia de seguridad
#$1 carpeta a realizar la copia de seguridad
copiar() {
if  [ -d $1 ]; then #Realizamos la copia si existe el directorio
  nombre=${1//"/"/""} #Quitamos las barras
  tar -cf $nombre".tar" $1
else
  echo "No existe el directorio"
  exit 1
fi
}

#Restaura la copia
#$1 carpeta donde se encuentran las copias de seguridad
#$2 carpeta donde se van a restaurar
restaurar() {
  tar -xf $1/*.tar -C $2 
}



if [ $# -ne 2 ]; then # Si no hay dos parámetros error
  error
fi


case $1 in #Seleccionamos la opción
  "backup")  
     copiar $2;;
  "restore") 
     restaurar $2 $destino;;
   *) echo "Tipo de copia de seguridad no válido" 
      exit 1
      ;;
esac

