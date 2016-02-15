方法1:

 more  shell.bash

#!/bin/bash

a=0

txt=$(cat ./readme.txt)   #将文件读入变量

len=${#txt}   #计算字符串中含字符个数

?

for i in $(seq $len)  #seq产生一个数组

do 

  ch=$(echo ${txt:$i-1:1})  #字符串中的每个字符

    if [ -z $ch ]    #判断是否为空格

         then

            ((++a))  #计算空格的个数，c++风格

            echo $i

            echo $txt | cut -d" " -f$a  #显示以空格为标记的第一个变量，

     ?fi

?done

?

echo  -e "\n\n空格个数:  "  $a





more readme.txt

侠客行

赵客缦胡缨，吴钩霜雪明。

银鞍照白马，飒沓如流星。

十步杀一人，千里不留行。

事了拂衣去，深藏身与名。

闲过信陵饮，脱剑膝前横。

将炙啖朱亥，持觞劝侯嬴。

三杯吐然诺，五岳倒为轻。

眼花耳热后，意气素霓生。

救赵挥金锤，邯郸先震惊。

千秋二壮士，烜赫大梁城。

纵死侠骨香，不惭世上英。

谁能书阁下，白首太玄经。 



?方法2:

for i in $(cat readme.txt);do echo $i; done?



计算空格的个数

?more readme.txt  |  grep -c " "

