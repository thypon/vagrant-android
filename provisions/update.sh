export DEBIAN_FRONTEND=noninteractive
# Upgrade Ubuntu
## Update the debian packages database
sudo -E apt-get update -q -y
## Upgrade the new packages
sudo -E apt-get dist-upgrade -q -y
## (HACK) Reinstalling Virtualbox modules
sudo -E apt-get install -q -y virtualbox-guest-additions virtualbox-guest-dkms python-software-properties
