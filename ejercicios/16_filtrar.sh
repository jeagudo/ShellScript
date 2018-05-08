#/bin/bash
#J. Enrique Agudo
#Ejecuta un mandato que te permita hacer la siguiente función: listar los contenidos de un directorio, filtrar sólo los directorios, y para cada directorio mostrar el mensaje:
#“El directorio ” nombre “ con permisos ” lista permisos “ y con ” número de ficheros y directorios en su interior “ ficheros y directorios en su interior pertenece a : ” propietario
#Prueba a ejecutarlo en la carpeta “/etc”.
#ls -l "/etc/" | awk '/^d/ {var=system("ls /etc/"$9" | wc -l");print "El directorio "$9" con permisos "$1" y con múmero de ficheros y directorios " var " pertenece a " $3 }' 
ls -l "/etc/" | awk '/^d/ {var=system("ls /etc/"$9" | wc -l");print var}' 

