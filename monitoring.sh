#!/bin/bash
echo "#Arquitectura:" $(uname -a)
echo "#CPU física:" $(lscpu | awk ' NR==5 {print $2}')
echo "#CPU virtual:" $(lscpu | grep Socket\(s\) | awk '{print $2}')

free --mega | awk 'NR==2{printf "#Memoria: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "#Disco: %d/%dGB (%s)\n", $3,$2,$5}'
top -bn1 | grep load | awk '{printf "#Carga CPU: %.2f%s\n", $(NF-2), "%"}'

echo "#Último boot:" $(who -b | awk ' {print $3,$4}')
echo "#LVM:" $(lvm pvdisplay | grep Allocatable | awk '{print $2}')
echo "#Conexiones TCP :" $(ss -s | grep TCP | awk 'NR==2 {printf "%d ESTABLISHED\n", $3}')
echo "#User log:" $(who | wc -l)
echo "#Network IP:" $(hostname -I) $(ip a | grep link/ether | awk '{printf " (%s)\n", $2}')
echo "#Sudo : "$(cat /var/log/sudo/sudo.log | grep 'COMMAND' | wc -l) "cmd"



https://github.com/adrihamel/Born2beRoot_42cursus/blob/master/apuntes.txt