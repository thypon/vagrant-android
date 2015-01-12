# Mounting External Disk
sudo mount /dev/sdb1 /mnt
sudo chown -R vagrant:vagrant /mnt
echo "LABEL=mnt /mnt ext4 defaults 0 0" | sudo tee --append /etc/fstab
