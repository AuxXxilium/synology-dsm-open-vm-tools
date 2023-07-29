#!/bin/bash

make setup
cp -r /spksrc/sponge /usr/bin/
cd /spksrc/spk/open-vm-tools/ && make arch-apollolake-7.1
cd /spksrc/spk/open-vm-tools/ && make arch-broadwell-7.1
cd /spksrc/spk/open-vm-tools/ && make arch-broadwellnk-7.1
cd /spksrc/spk/open-vm-tools/ && make arch-denverton-7.1
cd /spksrc/spk/open-vm-tools/ && make arch-geminilake-7.1
cd /spksrc/spk/open-vm-tools/ && make arch-r1000-7.1
cd /spksrc/spk/open-vm-tools/ && make arch-v1000-7.1
exit