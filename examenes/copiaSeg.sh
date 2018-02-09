#/bin/bash
#J. Enrique Agudo
# Examen 2010
# USO copiaSeg.sh [-u usuario]
#Realizar un script llamado copiaSeg para gestionar el sistema centralizado de copias de seguridad de un servidor.
#El script sin parámetros hará una copia de segundad de todos los usuarios del sistema, y con el parámetro -u usuario hará una copia de seguridad de la información del usuario pasado como parámetro. Este script sólo podrá ser ejecutado por root. La sintaxis del script será:
#copiaSeg [-u usuario ]
#Los usuarios podrán utilizar el sistema de copias automatizado creando en su directorio de trabajo un fichero oculto, llamado copiaSeg.dat con el siguiente contenido:
#Copias que se desean mantener
#numeroCopias=2
#Contenido de la copia, único obligatorio
#contenidoCopia=dir1:dir2:fichero1:fichero2,,.
#En caso de que no exista alguno de los campos configurables anteriores, se usarán los valores por defecto, definidos en el propio script. El único campo obligatorio es el campo contenidoCopia,que contendrá todos los ficheros y directorios que se desean incluir en la copia.
#Si dicho campo no estuviese definido, no se copiaría nada para ese usuario.
#El sistema creará un directorio /copiaSeg y dentro un directorio por usuario, si no existiese, que sólo podrá ser accesible por su dueño. En el interior de este directorio se almacenarán tantas copias de seguridad copiaSeg_hhmmDDMMYYYY.tgz como defina numeroCopias. Paraque un fichero o directorio sea añadido a la copia debe ser de su propiedad.
#El script borrará las copias más antiguas manteniendo en el sistema sólo las que se indiquen en el fichero de configuración copiaSeg.dat y, si no está definido numeroCopias, lo que marque el valor por defecto.

fichero=".copiaSeg.dat"
numeroCopias=2
contenidoCopia="/home/quique/"

#Muestra los errores
error(){
  case $1 in
     1) echo "El usuario $(whoami) no es root";;
     2) echo  "USO: $0 [-u usuario]";;
     3) echo "No existe el fichero de configuración no podemos hacer la copia de seguridad";;
     4) echo "Fichero no contiene las carpetas a copiar";;
     5) echo "No existe el usuario a copiar";; 
     *) echo "Error no esperado";;
   esac
   exit 1
}
#Comprobamos que el usuario es root
if [ $(whoami) != "root" ]; then
  error 1
fi
# Si no tiene 0 o 2 parámetros error
if [ $# -ne 0 ] && [ $# -ne 2 ]; then
  error 2
fi

#Si hay 2 parámetros y el primero no es -u error
if [ $# -eq 2 ] && [ $1 != "-u" ]; then
  error 2
fi

#Si el fichero no existe
if ! [ -f $fichero ]; then
 error 3
fi

#Comprobamos que existe contenidoCopia
dirs=$(cat $fichero | grep "contenidoCopia")
if [ ${#dirs} = 0 ]; then
  error 4
fi

#Obtenemos el valor de contenidoCopia
contenido=$(echo $dirs | cut -d"=" -f2)
#Obtenemos el número de copias
copias=$(cat $fichero | grep "numeroCopias")
if [ ${#copias} > 0 ]; then
  numeroCopias=$(echo $copias | cut -d"=" -f2)
fi
#comprobamos que el usario existe
if [ $# = 2 ]; then
  usuario=$(cat /etc/passwd | cut -d: -f1 | grep $2)
  if [ ${#usuario} -eq 0 ] ; then
   error 5
  fi
fi
#Mostrar resumen de lo que se va a hacer
echo "--------------- Copia de Seguridad -------------------"
echo "Contenido a copiar: "$contenido
echo "Nº de copias: "$numeroCopias
if [ $# = 2 ]; then
  echo  "Usuario: "$2
else
  echo "Todos los usuarios"
fi
#Solo para un usuario
#Comprobamos que existe la carpeta copiaSeg
if [ ! -d "/copiaSeg" ]; then
  echo "Creando carpeta de copias de seguridad..."
  mkdir /copiaSeg
fi

#Realizando copia de seguridad
fecha=$(date +%H%M%d%m%Y)
contenido=$(echo $contenido | awk -d":" '{gsub(":"," ");print}') # Separamos el contenido de la copia por espacios para pasarselos al tar

if [ $# = 2 ]; then
  usuarios=$2 # Un solo usuario
else
  usuarios=$(ls "/home") #Todos los usuarios que tengan home
fi

for usu in $usuarios;
do
  echo "------------------- $usu --------------------"
  if [ ! -d "/copiaSeg/"$usu"" ]; then
    echo "Creando carpeta para las copias de seguridad de usuario $usu"
    mkdir /copiaSeg/$usu
    chown $usu /copiaSeg/$usu
 #   chgrp $usu /copiaSeg/$usu
    chmod 444 /copiaSeg/$usu
  fi
  #Creamos copia de seguridad
  tar -zcf /copiaSeg/$usu/copiaSeg_$fecha.tgz $contenido 2> /dev/null
  chown $usu /copiaSeg/$usu/copiaSeg_$fecha.tgz
  echo "Copia de seguridad realizada: $usu"
#  chgrp $usu /copiaSeg/$usu/copiaSeg_$fecha.tgz
  #Comprobando # de copias de seguridad
  nfich=$(ls  /copiaSeg/$usu/ | wc -l)
  if [ $nfich -gt $numeroCopias ]; then
    nBorrar=$(($nfich-$numeroCopias)) #Número de ficheros a borrar (Los más antiguos)
    borrar=$(ls -tr /copiaSeg/$usu/ | head -n$nBorrar )
    for i in $borrar; #Borramos copias antiguas
    do
      rm "/copiaSeg/$usu/$i"
    done
  fi
done


