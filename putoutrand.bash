#! /bin/bash

while :
do
  mod=$(($2/10))
  len=${#mod}
  ((++len)) 
  i=${RANDOM:1:$len}
  if [ $i -gt $1 ] && [ $i -lt $2 ] 
      then
        ((--len))
        echo $i
        for n in $(seq $len)
        do
          echo $i | grep ^0 ; [ $? -eq 0 ] && i=${i#*0}
        done
        echo $i   
         break
   fi
done
