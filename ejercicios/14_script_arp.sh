#/bin/bash
#J. Enrique Agudo
#“script_arp.sh”: script que reciba como argumento un número entero, guardándolo en la variable "POS_ARP". El script comprobará si el valor de la variable “POS_ARP” es un número entero positivo, de modo que:
# Si es así: el script calculará el número de entradas que actualmente tiene la caché ARP del equipo, guardándolo en la variable “NENTRADAS”. Si el valor de “POS_ARP” es mayor que “NENTRADAS”, imprimirá por pantalla un mensaje tal como: “Ninguna entrada ARP en la posición valor_POS_ARP”. En caso de que “POS_ARP” sea menor o igual que “NENTRADAS”, imprimirá por pantalla un mensaje con la posición de la entrada ARP “POS_ARP”, seguido del contenido de dicha entrada ARP, e.g.: “Entrada valor_POS_ARP de la caché ARP: 172.16.17.254 ether 00:13:f7:0a:18:8b C eth0 “.
# En otro caso: Imprimirá por pantalla un mensaje indicando que el valor indicado no es un número entero: “Posición de entrada ARP no válida”

if [ $# -ne 1 ]; then
  echo "USO: $0 numero"
  exit 1
fi
POS_ARP=$1
if [ $(($1*1)) -lt 1 ]; then
  echo "No es numero entero positivo"
  exit
fi
cont=0
encontrado=0
# Opcion 1
arp > "temp.txt"
while read linea
do
  if [ $cont -eq $POS_ARP ]; then
   
    echo "Entrada valor $POS_ARP de la cache ARP: $linea"
    encontrado=1
  fi
  cont=$(($cont+1))
done < "temp.txt"
if [ $encontrado -eq 0 ]; then
  echo "Posición de entrada ARP no válida"
fi

# Opcion 2
linea2=$(arp | awk -v pos=$POS_ARP '{if (NR==pos+1) print $n}')
echo "Entrada valor $POS_ARP de la cache ARP: $linea2"

