# Installs Android Build Tools
apt-get update -yq
apt-get install -yq openjdk-7-jdk \
	bison g++-multilib git gperf libxml2-utils make \
	python-networkx zlib1g-dev:i386 zip \
	bc schedtool unzip less
## Installs && Set-ups CCache
apt-get install -y -q ccache
echo 'export CCACHE_PATH="/usr/bin"                 # Tell ccache to only use compilers here
export CCACHE_DIR=/tmp/ccache             # Tell ccache to use this path to store its cache
export USE_CCACHE=1' | tee --append /etc/profile.d/ccache.sh
chmod +x /etc/profile.d/ccache.sh
## Installs Repo (Android meta-git manager)
curl https://storage.googleapis.com/git-repo-downloads/repo | tee --append /usr/bin/repo
chmod +x /usr/bin/repo
