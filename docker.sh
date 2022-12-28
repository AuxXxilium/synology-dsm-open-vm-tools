#!/usr/bin/env bash

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