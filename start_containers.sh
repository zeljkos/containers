#!/bin/sh
#
# a shell script loop/counter example
#
count=1
while [ $count -lt 2300 ]
do
  #filename="node${count}.shtml"
  #echo "Redirect 301 /java/java_oo/${filename} http://www.devdaily.com/java/java_oo/"

  docker run -d --name=C_$count busybox sleep 999999999
  echo Container $count started!!!!!
  count=`expr $count + 1`
done
