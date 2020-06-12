#! /bin/bash
#jchen 06/12/2020

filename=$1
cap=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
low=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

if [ ! -f "$filename" ];
then
 for ((i=1; i<=26; i++))
 do
  str=$(echo $1 | tr [:upper:] [${cap:${i}:26}] | tr [:lower:] [${low:${i}:26}])
  printf "Rot$(( $i - 1 )): " 
  echo ${str}
 done
 exit
fi

while read line; do
 for ((i=0; i<26; i++))
 do
  if [[ $line =~ [A-Za-z] ]]
  then
    cyphered=$(echo $line | tr [:upper:] "${cap:${i}:26}" | tr [:lower:] "${low:${i}:26}")
  fi
  printf "Rot$i: "
  echo ${cyphered}
 done
done <$filename
