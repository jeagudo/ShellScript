#/bin/bash
#J. Enrique Agudo
#Busca un usuario y muestra su información de /etc/passwd
if [ $# -ne 1 ]; then
  echo "USO: $0 usuario"
  exit 1
fi

while read linea; do 
  if echo $linea | grep $1 > /dev/null; then
    echo $linea
    echo "Nombre:" $(echo $linea | cut -d ":" -f1)
    echo "Password:" $(echo $linea | cut -d ":" -f2)
    echo "UID:" $(echo $linea | cut -d ":" -f3)
    echo "GUID:" $(echo $linea | cut -d ":" -f4)
    echo "Nombre completo:" $(echo $linea | cut -d ":" -f5)
    echo "Home:" $(echo $linea | cut -d ":" -f6)
    echo "Shell:" $(echo $linea | cut -d ":" -f7)

  fi
done < "/etc/passwd"
