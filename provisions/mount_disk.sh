# Mounting External Disk
mount /dev/sdb1 /mnt
chown -R vagrant:vagrant /mnt
echo "LABEL=mnt /mnt ext4 defaults 0 0" | tee --append /etc/fstab
