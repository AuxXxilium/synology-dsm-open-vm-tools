#!/bin/bash

sudo apt-get update
sudo apt-get install -y libelf-dev moreutils

unset DOCKER_HOST
rm -rf ~/tmp/
mkdir -p ~/tmp/
git clone https://github.com/SynoCommunity/spksrc ~/tmp/spksrc
docker pull ghcr.io/synocommunity/spksrc
git clone https://github.com/AuxXxilium/synology-dsm-open-vm-tools.git ~/tmp/open-vm-tools
cp -r ~/tmp/open-vm-tools/* ~/tmp/spksrc/
cp -r /usr/bin/sponge ~/tmp/spksrc/
cp -f docker.sh ~/tmp/spksrc/
docker run -it -v ~/tmp/spksrc:/spksrc ghcr.io/synocommunity/spksrc /spksrc/docker.sh
cp -f ~/tmp/spksrc/packages/*.spk /home/auxxxilium