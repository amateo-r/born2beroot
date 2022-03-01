#!/bin/bash
echo "#Arquitecture:" $(uname -a)
echo "#CPU physical:" $(lscpu | awk ' NR==5 {print $2}')
echo "#vCPU:" $(lscpu | grep Socket\(s\) | awk '{print $2}')

free --mega | awk 'NR==2{printf "#Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "#Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
top -bn1 | grep load | awk '{printf "#CPU load: %.2f%s\n", $(NF-2), "%"}'

echo "#Last boot:" $(who -b | awk ' {print $3,$4}')
echo "#LVM use:" $(lvm pvdisplay | grep Allocatable | awk '{print $2}')
echo "#Connexions TCP :" $(ss -s | grep TCP | awk 'NR==2 {printf "%d ESTABLISHED\n", $3}')
echo "#User log:" $(who | wc -l)
echo "#Network IP:" $(hostname -I) $(ip a | grep link/ether | awk '{printf " (%s)\n", $2}')
echo "#Sudo : "$(cat /var/log/sudo/sudo.log | grep 'COMMAND' | wc -l) "cmd"
