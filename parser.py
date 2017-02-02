#!/usr/bin/python

sum=0;
num=0;
cnt=0;
order=0;

# Open a file
f = open("log.txt", "rw+")
for line in f.readlines():
	values = line.split();
	cnt = float(values[0]);
	order = values[1].split("/");
	if order[0] == 'Gbits':
		cnt = cnt*1024;
	sum = cnt + sum;
	num = num + 1;


print "Sum: ", sum, "Avg: ", sum/num  #, " Lost packets avg: ", lost/received*100,  "%"

	


#print "Name of the file: ", fo.name
#line = fo.readline()
#print "Read Line: %s" % (line)

#new = fo.readline(5)
#print "Read Line: %s" % (new)

f.close()

