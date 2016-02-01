#! /bin/bash


dfile="/root/Desktop/Vignette"
photos=$(ls $dfile)
len=$(ls $dfile | wc -l)
s=$(./putoutrand.bash 1 $len)

    
while :
   do
   m=$(date | cut -d ":" -f 2)
   echo $m | grep ^0 &>/dev/null; [ $? -eq 0 ] && m=${m:1:1}
   #echo $m

     if [ $m -eq $1 ] 
          then 
          for i in $s
          do 
          tu=$(echo $photos | cut -d " " -f $i)
          eog $dfile"/"$tu && exit 0
          done 
          
      fi

   done
