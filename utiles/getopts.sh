#!/bin/bash
#J. Enrique Agudo

while getopts "hs:p:" option ; do
  echo $option
  case "$option" in
    h) echo "ayuda" ;;
    s) echo $OPTARG  ;;
    p) echo $OPTARG ;;
    *) echo "Invalid" ; exit 1 ;;
  esac
done
