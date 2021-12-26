#!/bin/bash

# Define Variables
output=$HOME/research/sys_info.txt

# Define Lists to be used later in script
files=('/etc/shadow' '/etc/passwd')

# Check for research directory. Create if needed.
if [ ! -d ~/research ]; then
mkdir ~/research
fi

# Check for output file. Remove if needed.
if [ -f $output ]; then
rm $output
fi

##################################################################################

#Start Script

echo "System Info Audit" > $output
date >> $output
echo "" >> $output

#Display Machine Type
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output

#Display uname
echo -e "Uname info: $(uname -a) \n" >> $output

#Display IP Address info
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n" >> $output

#Display Hostname
echo -e "Hostname: $(hostname -s)" >> $output

#Display DNS Server info
echo "DNS Servers: " >> $output
cat /stc/resolv.conf >> $output

#Display Memory usage
echo -e "\nMemory Info:" >> $output
free >> $output

#Display CPU usage
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output

#Display Disk usage
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

#Display who is logged in
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output

#List exec files
echo -e "\nExec Files:" >> $output
find /home -type f -perm 777 >> $output

#List top 10 processes
echo -e "\nTop 10 Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output

#Checks the permissions on files
echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
for file in ${files[@]}
do
   ls -l $file >> $output
done