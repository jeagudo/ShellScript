#/bin/bash

roles=$(cat "roles.csv" | awk -F':' '{print $2}' | awk -F',' 'BEGIN {OFS=" "} {for (i=1;i<=NF;i++) print $i}' | sort | uniq)
echo $roles
for i in $roles
do
  echo $i
  echo "->" $(cat "roles.csv" | grep $i | awk '-F:' '{print $1}')
done
