#/bin/bash
#J. Enrique Agudo
#Ejemplo de como procesar un archivo línea a línea
if [ $# -ne 1 ]; then
  echo "USO: $0 nombre_archivo"
  exit 1
fi

while read linea; do 
  echo $linea
done < $1
