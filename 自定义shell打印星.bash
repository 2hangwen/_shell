more print.bash

?#! /bin/bash 

#����һ����������Ҫ�����ĸ�ʽ�����򱨴�֪��Ϊʲôʱ��

show(){   

echo -n "*" 

}

for i in $(seq $1); do show; done ;  #ʹ�� {1..$1} �ᱨ��

echo 











./print.bash 5  #��ӡ5���ǣ�����



./print.bash 30 #��ӡ30��?

