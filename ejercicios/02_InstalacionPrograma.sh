#!/bin/bash
#Los creadores del programa maravil necesitan un script de
#instalación, llamado instalar.sh. Debe realizar estas tareas:
#1) presentar como pantalla de bienvenida el archivo bienvenida.txt, que
#ocupa menos de una pantalla; el usuario deberá digitar Enter para
#continuar.
#2) presentar una pantalla con la licencia, el archivo licencia.txt, también
#menor de una pantalla; el usuario deberá digitar la tecla S para aceptar la
#licencia, si no la acepta el programa avisa y termina con código de error
#1.
#3) inicializar una variable DIRINSTAL con el nombre del directorio de
#instalación por defecto, /usr/local/maravil.
#4) preguntar al usuario el directorio de instalación, mostrando el nombre
#sugerido (variable DIRINSTAL); el usuario podrá digitar un nombre de
#directorio o Enter para aceptar el directorio sugerido. En cualquier caso,
#el nombre del directorio de instalación deberá quedar en la variable
#DIRINSTAL.
#5) verificar si existe ya el directorio de instalación; es así, continúa la
#instalación, y si no, deberá pedir autorización al usuario, crearlo y
#verificar la creación exitosa. Si el usuario no autoriza la creación del
#directorio, el programa termina con error 2; si no se pudo crear el
#directorio el programa termina con error 3. En todos los casos se informa
#lo realizado.
#6) copiar los archivos maravil.py, LEAME y manual.txt hacia el directorio
#de instalación.  Si la copia no da error, se informa la terminación exitosa
#de la instalación; en otro caso, se informa el error y se borra el
#directorio de instalación y todo su contenido.  
cat "bienvenida.txt"
echo "Pulsa enter para continuar..."
read -s -n 1 tecla
if [ "$tecla" = "" ]; then
  echo  "Intro"
else
  echo "No has pulsado intro, adios"
  exit 0
fi

