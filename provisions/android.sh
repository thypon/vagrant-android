export DEBIAN_FRONTEND=noninteractive
# Installs Android Build Tools
## Installs JDK6
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections
sudo -E add-apt-repository -y ppa:webupd8team/java 
sudo -E apt-get update -y -q
sudo -E apt-get install -y -q oracle-java6-installer 
## Installs android build tools dependencies
sudo -E apt-get install -y -q git gnupg flex bison gperf build-essential \
  zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
  libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
  libgl1-mesa-dev g++-multilib mingw32 tofrodos \
  python-markdown libxml2-utils xsltproc zlib1g-dev:i386
## Links 32bit libGL to the expected path
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
## Installs && Set-ups CCache
sudo -E apt-get install -y -q ccache
echo 'export CCACHE_PATH="/usr/bin"                 # Tell ccache to only use compilers here
export CCACHE_DIR=/tmp/ccache             # Tell ccache to use this path to store its cache
export USE_CCACHE=1' | sudo tee --append /etc/profile.d/ccache.sh
sudo chmod +x /etc/profile.d/ccache.sh
## Installs Repo (Android meta-git manager)
curl https://storage.googleapis.com/git-repo-downloads/repo | sudo tee --append /usr/bin/repo
sudo chmod +x /usr/bin/repo
