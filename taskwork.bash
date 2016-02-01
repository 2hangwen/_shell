#! /bin/bash


dfile="/root/Desktop/Vignette"
#这个文件夹下保存着图片文件
photos=$(ls $dfile)
#让图片文件名产生一个数组
len=$(ls $dfile | wc -l)
#计算图片的个数
s=$(./putoutrand.bash 1 $len)
#在图片最大个数的范围内产生随机数
    
while :
   do
   m=$(date | cut -d ":" -f 2)
   #获取当前时间之分钟
   echo $m | grep ^0 &>/dev/null; [ $? -eq 0 ] && m=${m:1:1}
   #去掉变量前边的"0"
   #echo $m

     if [ $m -eq $1 ] 
    #与参数1进行比较    
          then 
          for i in $s
          #此时$s只是一个int，for也只会运行一次
          do 
          tu=$(echo $photos | cut -d " " -f $i)
          #在数组里把此随机图片名字切割出来
          eog $dfile"/"$tu && exit 0
          #eog为自带的看图软件
          done 
          
      fi

   done
