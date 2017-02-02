#!/bin/sh
#
#
rm -f log.txt
count=1
while [ $count -lt 345 ];
do
  (docker logs server_$count | tail -1 | awk '{ print $7 " " $8}') >> log.txt
  count=`expr $count + 1`;
done
./parser.py
