
#/bin/bash
#J. Enrique Agudo
#
cadena="Entenguerengue"
#1 Tamaño de la cadena
echo 1 ${#cadena}
#2 A minúsculas
cadena="ENTENGUERENGUE"
echo 2 ${cadena,,}
#3 Solo la primera a minísculas
echo 3 ${cadena,}
#4 A mayúsculas
cadena="entenguerengue"
echo 4 ${cadena^^}
#5 A mayúsculas solo la primera
echo 5 ${cadena^}
#6 Subcadenas
echo 6 ${cadena:4} ${cadena:1:2} ${cadena:(-2)}
#7 Sustituir
echo 7 ${cadena/e/i} ${cadena//e/i} ${cadena//e}
#8 Eliminar parte
echo 8 ${cadena#*u} ${cadena##*u} ${cadena%u*} ${cadena%%u*} 
