set -e
set -x

if [ -f /etc/disk_added_date ]
then
   echo "disk already added so exiting."
   exit 0
fi

sudo fdisk -u /dev/sdb <<EOF
n
p
1


t
8e
w
EOF

sudo mkfs.ext4 /dev/sdb1
sudo e2label /dev/sdb1 source
sudo mkdir /home/vagrant/android

date > /etc/disk_added_date
