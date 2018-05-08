#!/bin/bash
#Construir un script que:
#a) indique los nombres de los diferentes shells asignados a las cuentas de
#usuario en el archivo /etc/passwd y la cantidad de cuentas de cada uno de
#esos shells;
#b) muestre los nombres de cuentas sin shell asignado. 

#a)
echo  "Shell utilizados: "
cat /etc/passwd | awk -F":" '{print $7}' | grep . | sort | uniq -i -c | sort
echo "Usuarios sin shell: "
cat /etc/passwd | awk -F":" '{if ($7=="") print $1}'
