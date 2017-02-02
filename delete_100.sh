/bin/sh
#
# a shell script loop/counter example
#
#iperf3 -c %(ENV_SERVER_ADDRESS)s -i 1 -b %(ENV_BANDWIDTH)s -l %(ENV_PACKET_SIZE)s -t %(ENV_TEST_DURATION)s -P %(ENV_N_CPU)s
#iperf3 -s %(ENV_SERVER_ADDRESS)s
set -xv

count=51
while [ $count -lt 101 ]
do
  #filename="node${count}.shtml"
  #echo "Redirect 301 /java/java_oo/${filename} http://www.devdaily.com/java/java_oo/"
  docker rm -f client_$count
  docker rm -f server_$count
  count=`expr $count + 1`
done
