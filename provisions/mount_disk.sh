# Mounting External Disk
sudo mount /dev/sdb1 /home/vagrant/android
sudo chown -R vagrant:vagrant /home/vagrant/android
echo "LABEL=source /home/vagrant/android ext4 defaults 0 0" | sudo tee --append /etc/fstab
