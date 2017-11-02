#!/bin/bash

cd /data/
unzip $1  -d /data/test_mimidai
cd /data/test_mimidai/WEB-INF/classes
rm -f  ./*
dir_num=`ls |wc -l`
if [ $dir_num -eq 2 ];then
    cp /var/www/mimidai-cms/WEB-INF/classes/*  ./
else:
    exit 1
fi
mv  /var/www/mimidai-cms  /var/www/mimidai-cms-$(date +%Y%m%d-%H%M%S)
mv /data/test_mimidai /var/www/mimidai-cms



sdffsdfsdfsfs
