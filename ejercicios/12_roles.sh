#/bing/bash
roles=$(cat "roles.csv" | cut -d: -f2| sed 's/,/\n/g'| sort | uniq)


for i in $roles
do
  echo $i
  echo "-> " $(cat "roles.csv" | grep $i | cut -d: -f1)
done

