#!/bin/sh
filename=$1
if [ -z $filename ]; then
   echo "Usage: ./run_erlang.sh filename.erl"
else
   if [ ! -f $filename ]; then
       	echo "File not exist."
   else
       	erlc $filename
       	name=${filename%.*}
       	erl -noshell -s $name  start -s init stop
   fi
fi
