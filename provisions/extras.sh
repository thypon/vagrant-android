export DEBIAN_FRONTEND=noninteractive
# Prepare Extras
## Installs Utilities
sudo -E apt-get install -q -y htop dtach tig libxi6 libswt-gtk-3-java device-tree-compiler
mkdir -p /home/vagrant/.swt/lib/linux/x86_64/
ln -s /usr/lib/jni/libswt-* /home/vagrant/.swt/lib/linux/x86_64/
