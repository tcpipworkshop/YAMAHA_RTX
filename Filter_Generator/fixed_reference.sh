#!/bin/bash

alpha0=A
alpha1=B
alpha2=C
alpha3=D
alpha4=E
alpha5=F
alpha6=G
alpha7=H
alpha8=I
alpha9=J

for num in `seq -w 0 9`; do
	num1t=${num}
	num2t=`expr ${num1t} + 10`
	oddnum=`expr ${num2t} % 2`
	num1t=`printf "%02d\n" ${num1t}`
	num2t=`printf "%02d\n" ${num2t}`
	if [ "${oddnum}" = "1" ]; then
		sheetname1="${sheetname1} ${num1t}+${num2t}"
		sheetname2="${sheetname2} ${num1t}+${num2t}"
	elif [ "${oddnum}" = "0" ]; then
		sheetname1="${sheetname1} ${num1t}"
		sheetname2="${sheetname2} ${num2t}"

	fi
done

echo -e "\
#\t\
command\t\
number\t\
action\t\
source_addr\t\
dest_addr\t\
protocol\t\
source_port\t\
dest_port"

sleep 5

for sheet in ${sheetname1}${sheetname2}; do
	str_check=`echo ${sheet} | egrep -v '\+'`
	if [ "${str_check}" != "" ]; then
		intager=1
		overten=`expr ${str_check} / 10`
	else
		intager=0
	fi
	if [ "${intager}" = "0" ]; then
		if [ "${overten}" = "1" ]; then
			n_begin=116
			n_end=215
		fi
	else
		n_begin=8
		n_end=107
	fi

for line in `seq ${n_begin} ${n_end}`; do
echo -e "\
=IF('${sheet}'!\$${alpha1}\$${line}=\"\",\"\",'${sheet}'!\$${alpha1}\$${line})\t\
=IF('${sheet}'!\$${alpha2}\$${line}=\"\",\"\",'${sheet}'!\$${alpha2}\$${line})\t\
=IF('${sheet}'!\$${alpha3}\$${line}=\"\",\"\",'${sheet}'!\$${alpha3}\$${line})\t\
=IF('${sheet}'!\$${alpha4}\$${line}=\"\",\"\",'${sheet}'!\$${alpha4}\$${line})\t\
=IF('${sheet}'!\$${alpha5}\$${line}=\"\",\"\",'${sheet}'!\$${alpha5}\$${line})\t\
=IF('${sheet}'!\$${alpha6}\$${line}=\"\",\"\",'${sheet}'!\$${alpha6}\$${line})\t\
=IF('${sheet}'!\$${alpha7}\$${line}=\"\",\"\",'${sheet}'!\$${alpha7}\$${line})\t\
=IF('${sheet}'!\$${alpha8}\$${line}=\"\",\"\",'${sheet}'!\$${alpha8}\$${line})\t\
=IF('${sheet}'!\$${alpha9}\$${line}=\"\",\"\",'${sheet}'!\$${alpha9}\$${line})"
done
done