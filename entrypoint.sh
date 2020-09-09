#!/bin/bash

#fix ownership
chown -R backup:backup /etc/proxmox-backup
chmod -R 700 /etc/proxmox-backup
#switch user for run

#Fix user accounts
chsh -s /bin/bash backup
usermod -a -G backup root
echo root:$ROOT_PASSWD | chpasswd

# Start the first process
/bin/su backup -c /usr/lib/x86_64-linux-gnu/proxmox-backup/proxmox-backup-api
sleep 10
# Start the second process
/bin/su backup -c /usr/lib/x86_64-linux-gnu/proxmox-backup/proxmox-backup-proxy

while /bin/true; do
  sleep 60
done
