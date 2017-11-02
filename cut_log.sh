#!/bin/sh
log_dir=/usr/local/tomcat/logs/
#log_dir=/home/mojunye/logs/
monitor_file=$1 #tomcat目录下的catalina.out文件的绝对路径
file_size=`du  -m $monitor_file | awk '{print $1}'`
cd $log_dir
if [ $file_size -ge  100 ]
then
        if [ ! -d $log_dir ]
        then
                mkdir /usr/local/tomcat/logs/    #创建保存切割文件目录,这个路径可以自行修改，保存到你想要的目录
        fi
        cp $1 /usr/local/tomcat/logs/$1-`date +%Y-%m-%d-%H%M%S`.log   #保存日志文件
        tar -zcvf  $1-`date +%Y-%m-%d-%H:%M:%S`.tar.gz  /usr/local/tomcat/logs/$1-`date +%Y-%m-%d-%H%M%S`.log
#":文件切割"  >>/home/mojunye/logs/split.log  #记录切割日志
        echo "" > $1    #清空tomcat的log/catalina.out文件内容
fi
