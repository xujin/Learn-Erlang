#!/bin/sh
filename=$1
if [ -z $filename ]; then
   echo "用法: ./run_erlang.sh filename.erl"
else
   if [ ! -f $filename ]; then
       	echo "文件不存在，请重新输入."
   else
       	erlc $filename
       	name=${filename%.*}
       	erl -noshell -s $name  start -s init stop
   fi
fi
