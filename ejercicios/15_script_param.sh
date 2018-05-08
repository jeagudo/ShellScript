#/bin/bash
#J. Enrique Agudo
#“script_param.sh”: Considere que en el shell actual se dispone de la variable: VAR="nombre=valor1&edad=valor2&telefono=valor3" Escriba un shell-script que analice el valor de dicha variable y para cada uno de los parámetros extraiga su valor y lo imprima por pantalla. Por ejemplo, que la salida sea: Cadena analizada: nombre=valor1&edad=valor2&telefono=valor3
VAR="nombre=valor1&edad=valor2&telefono=valor3"
nombre=$(echo $VAR | cut -d"&" -f1)
edad=$(echo $VAR | cut -d"&" -f2)
telefono=$(echo $VAR | cut -d"&" -f3)
nombre=$(echo $nombre | cut -d"=" -f2)
edad=$(echo $edad | cut -d"=" -f2)
telefono=$(echo $telefono | cut -d"=" -f2)
echo $nombre
echo $edad
echo $telefono
IFS='&'
for i in $VAR; do 
  echo $(echo $i | cut -d"=" -f2)
done
unset IFS
