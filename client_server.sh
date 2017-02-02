#/bin/sh
#
# a shell script loop/counter example
#
#iperf3 -c %(ENV_SERVER_ADDRESS)s -i 1 -b %(ENV_BANDWIDTH)s -l %(ENV_PACKET_SIZE)s -t %(ENV_TEST_DURATION)s -P %(ENV_N_CPU)s
#iperf3 -s %(ENV_SERVER_ADDRESS)s
# UDP tests with drop packets
#iperf3 -uZVc 192.168.30.161 -b300m -t5 --get-server-output -l8192
#tcp test
#$ iperf3 -ZVc 192.168.30.161 -t5 --get-server-output -l8192
# when changing the MTU on the eth0 in the container, mtu on the bridge needs to be changed as well
#ExecStart=/usr/bin/dockerd --storage-driver=btrfs --graph=/mnt/docker --mtu=9000 --bip=172.24.0.1/16 --ipv6 --fixed-cidr-v6="2001:db8:0001:0124::/64" -H fd:// -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock

count=201
while [ $count -lt 401 ]
do
  #filename="node${count}.shtml"
  #echo "Redirect 301 /java/java_oo/${filename} http://www.devdaily.com/java/java_oo/"

  docker run -dt --privileged --name server_$count net-testing bash -c "ifconfig eth0 mtu 9000; iperf3 -s"
  ip=$(docker inspect --format '{{ .NetworkSettings.GlobalIPv6Address }}' server_$count)
  docker run -td --privileged --name client_$count net-testing bash -c "ifconfig eth0 mtu 9000; iperf3 -ZVc ${ip} -b10G -l9000 -i10 -t86400  --get-server-output"
  echo Chain $count started!!!!!
  count=`expr $count + 1`
done
