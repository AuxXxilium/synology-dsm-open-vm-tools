#!/bin/bash

make setup
cp -r /spksrc/sponge /usr/bin/
cd /spksrc/spk/open-vm-tools-12/ && make arch-apollolake-7.2
cd /spksrc/spk/open-vm-tools-12/ && make arch-broadwell-7.2
cd /spksrc/spk/open-vm-tools-12/ && make arch-broadwellnk-7.2
cd /spksrc/spk/open-vm-tools-12/ && make arch-denverton-7.2
cd /spksrc/spk/open-vm-tools-12/ && make arch-geminilake-7.2
cd /spksrc/spk/open-vm-tools-12/ && make arch-r1000-7.2
cd /spksrc/spk/open-vm-tools-12/ && make arch-v1000-7.2
exit