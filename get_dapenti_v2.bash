url="http://www.dapenti.com/blog/index.asp"
today=$(date +%Y%m%d)

href=$(curl $url | grep -m1 $today | sed "s/\(.*\)href=//g" | cut -d " " -f 1)
#echo $href

if [[ $href != "" ]]
then
    www=$(echo $url | sed "s/ind.*//g")

    for i in $(curl -s -N $www$href | grep -E 'yupoo|ptimg')
    do  
      echo $i | grep jpg | sed "s/src=//g" | xargs wget -P ./$today/
      #sed -i "s/http.*\///" ./$today/dapenti$today.html
    done

    if [ ! -d $today ];then
        mkdir ./$today
    fi
    #wget $www$href -O ./$today/dapenti$today.html
   curl -s -N $www$href | awk '{gsub(/http.*[a-z0-9A-Z]\//,"")}1' > ./$today/dapenti$today.html && echo $www$href

     
#curl -s -N $www$href | grep yupoo |awk '{gsub(/http.*com/,"."$today)}1' >> ./$today/dapenti$today.html

else
    echo ""
    echo ""
    echo "..........waiting......."
fi
