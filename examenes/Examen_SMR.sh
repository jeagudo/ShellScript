#!/bin/bash
#J. Enrique Agudo
#En el siguiente script se ofrece la solución al siguiente enunciado de examen (Nivel: 2º de ciclo de grado medio en Sistemas Microinformáticos y Redes).
#Enunciado:
#Perteneces al cuerpo de Técnicos de Asistencia Tecnológica del Ministerio de Defensa, hace unas horas se ha producido un terremoto en el que se contabilizan numerosas pérdidas humanas y materiales. Junto a un hospital de campaña, se han instalado unas carpas provisionales donde un equipo de 25 técnicos informáticos van a llevar a cabo las labores de recogida de datos de los damnificados, con objeto de realizar una valoración adecuada de los daños físicos y materiales que hayan sufrido. Eres el Coordinador de operaciones tecnológicas y debes crear un servidor Linux contra el que van a trabajar los 25 técnicos a través de sus portátiles, cada uno con su cuenta de usuario Linux en él.

#Apartado 2 (1p):
#Realiza un script que cumpla los siguientes requisitos:
#Antes de nada, el script debe crear automáticamente en el home de tu usuario un archivo de texto llamado
#técnicos_preparados.txt y establecer los permisos 744 para este.
#Debe mostrar por pantalla un menú con las siguientes opciones:
#1) Crear grupos de técnicos
#2) Crear usuarios técnicos
#3) Añadir técnico a un grupo
#4) Crear árbol de datos
#5) Visualizar técnicos preparados
#6) Realizar salvaguarda de datos
#7) Salir
#El menú debe estar construido y controlado con las estructuras adecuadas.
#Cada una de las opciones debe llevar a cabo:
#Apartado 3 (2p): Opción 1:Se solicitará al usuario que introduzca el nombre del grupo a crear. Hay que comprobar que el usuario ha introducido algo, si no indicamos error y volvemos al menú. Con el nombre del grupo, comprobamos si éste existe en el sistema, si no existe lo creamos. Si existe, lo indicamos y volvemos al menú.
#Apartado 4 (2p): Opción 2:
#Se solicitará al usuario que introduzca el nombre del usuario a crear. Hay que comprobar que el usuario ha introducido algo, si no indicamos error y volvemos al menú. Con el nombre del usuario, comprobamos si éste existe en el sistema, si no existe lo creamos. Si existe, lo indicamos y volvemos al menú. El nuevo usuario debe ser integrado en el grupo que se creó en la Opción 1.
#Apartado 5 (3p): Opción 3:Se solicitará el nombre del usuario y el nombre del grupo en el que queremos insertar dicho usuario. Se han de comprobar ambos valores para ver si el usuario ha metido algo por teclado o no. Si el usuario y el grupo existen en el sistema, se lanzará la orden para integrar al usuario en dicho grupo. Si alguno de los dos no existe, indicaremos error y volveremos al menú.
#Apartado 6 (2p): Opción 4:Se solicitará el nombre del usuario al que hay que crearle el árbol de directorios. Si existe en el sistema, crearemos en su /home las siguientes carpetas:
#· Empresas_afectadas
#· Familias_afectadas
#· Patrimonio_afectado
#· Decesos
#Una vez comprobada la creación de dichas carpetas para ese usuario, se irá añadiendo al archivo de texto llamado técnicos_preparados.txt los nombres de cada uno de los usuarios a los que les estemos haciendo este tratamiento.
#Apartado 7 (1p): Opción 5:Se accederá al archivo técnicos_preparados.txt y se visualizará en pantalla su contenido, de este modo podremos saber a qué usuarios se les ha creado el árbol de datos. El programa debe detenerse hasta que el usuario pulse una tecla para continuar.
#Entonces, volverá al menú.
#Apartado 8 (2p): Opción 6:
#Para esta opción, hay que crear una carpeta dentro de la carpeta /root cuyo nombre será el mismo nombre de tu usuario y dentro de ella, otra con nombre salvaguarda_datos, en la que se volcará todo el contenido del /home de tu usuario.
#Opción 7:
#Salida del Script.
mostrarMenu(){
echo "1. Crear Grupos de técnicos"
echo "2. Crear usuarios técnicos"
echo "3. Añadir técnico a un grupo"
echo "4. Crear árbol de datos"
echo "5. Visualizar técnicos preparados"
echo "6. Realizar salvaguarda de datos"
echo "7. Salir"
}
crearFichero(){
touch "/home/"$(whoami)"/técnicos_preparados.txt"
chmod 744 "/home/"$(whoami)"/técnicos_preparados.txt"
}

elegirOpcion(){
case $1 in
  1)crearGrupo;;
  2)crearUsuarios;;
  3)aniadirTecnicoGrupo;;
  4)crearArbol;;
  5)visualizarTecnicos;;
  6)salvaguarda;;
  7)echo "Saliendo"
    exit 1;;
  *)echo "Opción no válida";;
esac
}

crearGrupo(){
echo "Introduce el nombre del grupo: "
read grupo
if [ ${#grupo} -eq 0 ];then
 echo "Error: No ha introducido nada"
else
  existe=$(cat "/etc/group" | awk -F":" '{print $1}' | grep $grupo)
  if [ ${#existe} -eq 0 ]; then
    addgroup $grupo
  else
    echo "Error: Ya existe el grupo"
  fi
fi
}

crearUsuarios(){
echo "Introduce el nombre del usuario: "
read usuario
if [ ${#usuario} -eq 0 ];then
 echo "Error: No ha introducido nada"
else
  existe=$(cat "/etc/passwd" | awk -F":" '{print $1}' | grep $usuario)
  if [ ${#existe} -eq 0 ]; then
    useradd $usuario
  else
    echo "Error: Ya existe el usuario"
  fi
fi
}

aniadirTecnicoGrupo(){
echo "Introduce el nombre del usuario: "
read usuario
if [ ${#usuario} -eq 0 ];then
 echo "Error: No ha introducido nada"
else
  existe=$(cat "/etc/passwd" | awk -F":" '{print $1}' | grep $usuario)
  if [ ${#existe} -ne 0 ]; then
    echo "Introduce el nombre del grupo: "
    read grupo
    if [ ${#grupo} -eq 0 ];then
      echo "Error: No ha introducido nada"
    else
      existe=$(cat "/etc/group" | awk -F":" '{print $1}' | grep $grupo)
      if [ ${#existe} -ne 0 ]; then
       # Existen usuario y grupo
        echo "Añadiendo"
        addgroup $usuario $grupo
      else
        echo "Error: NO  existe el grupo"
      fi
fi
  else
    echo "Error: No existe el usuario"
  fi
fi
}

crearArbol(){
echo "Introduce el nombre del usuario: "
read usuario
if [ ${#usuario} -eq 0 ];then
 echo "Error: No ha introducido nada"
else
  existe=$(cat "/etc/passwd" | awk -F":" '{print $1}' | grep $usuario)
  if [ ${#existe} -eq 0 ]; then
    echo "Error: No existe el usuario"
  else
    echo "si existe"
     mkdir "/home/"$usuario"/Empresas_afectadas"
     mkdir "/home/"$usuario"/Familias_afectadas"
     mkdir "/home/"$usuario"/Patrimonio_afectado"
     mkdir "/home/"$usuario"/Decesos"
     chown $usuario:$usuario "/home/"$usuario"/Empresas_afectadas"
     chown $usuario:$usuario "/home/"$usuario"/Familias_afectadas"
     chown $usuario:$usuario "/home/"$usuario"/Patrimonio_afectado"
     chown $usuario:$usuario "/home/"$usuario"/Decesos"
     echo $usuario >> tecnicos_preparados.txt
      #Comprobar directorios??
  fi
fi
}

visualizarTecnicos(){
cat tecnicos_preparados.txt
echo "Pulsa tecla para seguir..."
read tecla

}

salvaguarda(){
echo ""
}
# Programa principal
crearFichero
while true
do
#  clear
  mostrarMenu
  read opcion
  elegirOpcion $opcion
done

echo "hola"
