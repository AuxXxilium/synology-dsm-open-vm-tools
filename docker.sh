#!/bin/bash

make setup
cp -r /spksrc/sponge /usr/bin/
cd /spksrc/spk/open-vm-tools/ && make arch-apollolake-7.2
cd /spksrc/spk/open-vm-tools/ && make arch-broadwell-7.2
cd /spksrc/spk/open-vm-tools/ && make arch-broadwellnk-7.2
cd /spksrc/spk/open-vm-tools/ && make arch-denverton-7.2
cd /spksrc/spk/open-vm-tools/ && make arch-geminilake-7.2
cd /spksrc/spk/open-vm-tools/ && make arch-r1000-7.2
cd /spksrc/spk/open-vm-tools/ && make arch-v1000-7.2
exit