#! /bin/bash

filename=$1
cap=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
low=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

if [ $2 ]
then
echo "Only single word or text file allowed. Try Again."
exit
fi

if [ ! -f "$filename" ]
then
 for ((i=1; i<=26; i++))
 do
  str=$(echo $1 | tr [:upper:] [${cap:${i}:26}] | tr [:lower:] [${low:${i}:26}])
  printf "Rot$(( $i - 1 )): " 
  echo ${str}
 done
 exit
fi

for ((i=0; i<26; i++))
do
printf "Rot:${i}:"
while read -n1 c; do
   if [[ $c =~ [A-Za-z] ]]
   then
   printf $(echo $c | tr "${cap:0:26}" "${cap:${i}:26}" | tr "${low:0:26}" "${low:${i}:26}")
   else
   printf " "
   fi
done <$filename 
echo ""
done
