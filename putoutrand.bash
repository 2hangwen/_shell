#! /bin/bash

while :
do
  mod=$(($2/10))
  len=${#mod}
  ((++len)) 
  #参数2也就是最大的数字为几位数
  i=${RANDOM:1:$len}
  #产生随机数
  if [ $i -gt $1 ] && [ $i -lt $2 ] 
  #大于参数1，小于参数2
      then
        ((--len))
        echo $i
        for n in $(seq $len)
        do
          echo $i | grep ^0 ; [ $? -eq 0 ] && i=${i#*0}
          #将数字前的"0"去掉
        done
        echo $i   
         break
   fi
done
