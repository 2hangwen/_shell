
#! /bin/bash

#取昨天的日期
day=$(date -d last-day +%Y%m%d)

#下载dapenti主页，并且用昨天的日期来查找是否出了图挂
wget http://dapenti.com/blog/index.asp -O dapenti.html && grep $day dapenti.html     > key.txt

#去掉汉字
LANG=C sed -i 's/[\x81-\xfe][\x40-\xfe]//g' key.txt

#去掉img标签的头和尾，留下src部分
sed -i 's/.*href=//' key.txt
sed -i 's/title.*//' key.txt

#统计行数
c=$(cat key.txt | wc -l)

#行数如果为2
if [ $c = 2 ]; then
  
  #取文件的第一行
   url=$(head -n 1 key.txt)

  #补全网址
   www=http://dapenti.com/blog/$url

    #下载图挂,并且查找img标签存起来
   wget $www -O tugua.html && grep "<img.*/>" tugua.html > jpg_url.txt

  #替换（去掉）img标签的头和尾
   sed -i 's/.*http/http/' jpg_url.txt && sed -i 's/jpg.*/jpg/' jpg_url.txt

  #遍历文件内容
   while read line
   do
    mkdir $day

   #basename取一个文件绝对路径的文件名
    jpgname=$(basename $line)

   #下载图片后存另存为
    wget $line -O ./$day/$jpgname
   done < jpg_url.txt
fi
