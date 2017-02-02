#/bin/sh
docker run -dt --name server_$count netcont iperf3 -s
