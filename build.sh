#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y libelf-dev docker.io moreutils

rm -rf ~/tmp/
mkdir -p ~/tmp/
git clone https://github.com/SynoCommunity/spksrc ~/tmp/spksrc
sudo docker pull ghcr.io/synocommunity/spksrc
git clone https://github.com/AuxXxilium/synology-dsm-open-vm-tools.git ~/tmp/open-vm-tools
sudo cp -r ~/tmp/open-vm-tools/* ~/tmp/spksrc/
sudo cp -r /usr/bin/sponge ~/tmp/spksrc/
screen -AmdS docker dockerd
sudo docker run -it -v ~/tmp/spksrc:/spksrc ghcr.io/synocommunity/spksrc /bin/bash
make setup
cp -r /spksrc/sponge /usr/bin/
cd /spksrc/spk/open-vm-tools-12/
make arch-apollolake-7.1
make arch-broadwell-7.1
make arch-broadwellnk-7.1
make arch-denverton-7.1
make arch-geminilake-7.1
make arch-r1000-7.1
make arch-v1000-7.1
exit
cp -f ~/tmp/spksrc/packages/*.spk /tmp