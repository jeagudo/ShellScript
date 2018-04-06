#!/bin/bash
#*Ejercicio 8.* Se desea saber qué páginas de un servidor web son más
#accedidas. El archivo /var/log/apache/access.log contiene líneas del
#siguiente formato:
#127.0.0.1 - - [25/Jul/2002:20:21:51 -0300] "GET
#/fabmelo/version7/modif_clave.php?nombre=pa232&clave=madrid HTTP/1.1" 200
#1609
#127.0.0.1 - - [25/Jul/2002:20:21:58 -0300] "POST /fabmelo/version7/menu.php
#HTTP/1.1" 200 1012
#127.0.0.1 - - [25/Jul/2002:20:22:00 -0300] "GET
#/fabmelo/version7/presupuestos2.php?nombre=pa232&clave=belice HTTP/1.1" 200
#642
#Los accesos contienen la palabra GET, los nombres de las páginas terminan
#en espacio o en "?". Listar los nombres de páginas de las 5 más accedidas. 
