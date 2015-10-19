set -e
set -x

if [ -f /etc/disk_added_date ]
then
   echo "disk already added so exiting."
   exit 0
fi

fdisk -u /dev/sdb <<EOF
n
p
1


t
8e
w
EOF

mkfs.ext4 /dev/sdb1
e2label /dev/sdb1 mnt

date > /etc/disk_added_date
