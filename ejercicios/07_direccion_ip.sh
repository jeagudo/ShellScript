#/bin/bash
#Script que nos diga por pantalla: Nuestra dirección IP es : xxx.xxx.xxx.xxx
ip=$(ifconfig | grep "inet" | head -n1 | awk '{print $2}' | awk -F":" '{print $2}' )
echo "Nuestra dirección IP es: " $ip
