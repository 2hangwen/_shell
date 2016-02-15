more print.bash

?#! /bin/bash 

#定义一个函数必须要这样的格式，否则报错不知道为什么时候

show(){   

echo -n "*" 

}

for i in $(seq $1); do show; done ;  #使用 {1..$1} 会报错

echo 











./print.bash 5  #打印5颗星，换行



./print.bash 30 #打印30颗?

