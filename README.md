**[English](README.md) |**

From：Aigor https://xpenology.com/forum/topic/58384-almost-functional-open-vmtools-for-ds3622xs/

# VMware Tools for Synology DSM

This is a port of the [open-vm-tools](https://github.com/vmware/open-vm-tools) implementation of VMware Tools to the [Synology DSM](https://www.synology.com/en-global/dsm) platform.

Here you will find ready-built binary installable `.spk`-packages for `Synology DSM`, together with the necessary sources, should you choose to build it yourself.

**Read this in other languages: | [English](README.md) |**

## open-vm-tools

`open-vm-tools` is a set of services and modules that enable several features in `VMware` products for better management of, and seamless user interactions with, guest operating systems.

Specifically, this port enables interaction with a virtualised `Synology DSM` running as a `VMware` guest VM. A typical host runs the `VMware ESXi` hypervisor.

`open-vm-tools` is open source software released under `GPL v2` and `GPL v2` compatible licenses.

More information can be found at the official [open-vm-tools source repository](https://github.com/vmware/open-vm-tools).

## Synology DSM Package (.spk) Files

`.spk`-packages are found under the Release section. SPK releases track `open-vm-tools` versions from the upstream project.

Filenames are in the form

```
open-vm-tools_[Arch]-[DSM ver]_[open-vm-tools ver]-[build].spk
```

`[Arch]` is the CPU architecture supported by the package. Use the correct one that matches the intended `Synology` hardware model. This can be found in the official [Synology knowledge base](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have).

`[DSM ver]` is the minimum `Synology DSM` version supported by the package.

`[open-vm-tools ver]` is the `open-vm-tools` version matching the upstream releases.

`[build]` is the incremental build number. Get the latest available to benefit from more recent patches built from upstream hotfixes.

For example, to install `open-vm-tools 11.2.5` on a `Synology NAS` model `DS3615xs` (Package Arch: `Bromolow`) running `DSM 6.2`, download a package file named `open-vm-tools_bromolow-6.2_11.2.5-xx.spk` which supports `DSM` versions `6.2` and above.

## Build Tooling

Builds are created using the cross-compilation framework provided by the [spksrc project](https://github.com/SynoCommunity/spksrc) from SynoCommunity.

`spksrc` is open source software released under the `BSD` license.

More information, including instructions to build this and many other projects relying on `spksrc`, can be found at the official [SynoCommunity/spksrc source repository](https://github.com/SynoCommunity/spksrc).

## Compiling

Note: The `open-vm-tools` source data is not contained in this repository and you will not to have to download it manually as the required data will be downloaded on-the-fly while compiling.

The release builds provided here were compiled by using an `Ubuntu Desktop 20.04 LTS` VM on a `VMware Workstation Player 16` type 2 hypervisor.

If you want to compile `open-vm-tools` for `Synology DSM` by yourself, do the following on a `Ubuntu/Debian` (or similiar) system, according to the following example (`open-vm-tools 11.5.2` and `apollolake/DSM 6.2` architecture):

~~**1.** Download the desired official [open-vm-tools release](https://github.com/vmware/open-vm-tools/releases/):~~

~~`cd ~/Downloads`~~

~~`wget https://github.com/vmware/open-vm-tools/releases/download/stable-11.2.5/open-vm-tools-11.2.5-17337674.tar.gz`~~

**2.** Create a temporary working directory...

`mkdir -p ~/tmp/`

~~...and push the following three checksums of the downloaded package into a `.txt`  file (which we will use later)  by executing:~~

~~`shasum -a 1 ~/Downloads/open-vm-tools-11.2.5-17337674.tar.gz >> ~/tmp/checksums.txt`~~

~~`shasum -a 256 ~/Downloads/open-vm-tools-11.2.5-17337674.tar.gz >> ~/tmp/checksums.txt`~~

~~`md5sum ~/Downloads/open-vm-tools-11.2.5-17337674.tar.gz >> ~/tmp/checksums.txt`~~

~~Delete the `.tar.gz`-file:~~

~~`rm -rf ~/Downloads/open-vm-tools-11.2.5-17337674.tar.gz`~~

**3.** Install the following packages:

`sudo apt-get install docker.io moreutils`

**4.** Clone the official "SynoCommunity" `spksrc` Github repository:

`git clone https://github.com/SynoCommunity/spksrc ~/tmp/spksrc`

**5.** Download the official "SynoCommunity" `spksrc` docker image:

`sudo docker pull ghcr.io/synocommunity/spksrc`
(Note: do not pull `synocommunity/spksrc` as it is missing packages)

**6.** Clone the `open-vm-tools` build files:

`git clone https://github.com/tbc0309/synology-dsm-open-vm-tools.git ~/tmp/open-vm-tools`

~~**7.** Edit the following file which holds the according checksum files and replace all values with the previously generated checksums from `~/tmp/checksums.txt`:~~

~~`nano ~/tmp/open-vm-tools/cross/open-vm-tools/digests`~~

~~Save the file and quit the editor.~~

~~**8.** Edit the following file and customize the values for the variables `PKG_VERS` and `PKG_BUILD` according to the `open-vm-tools` version you want to compile:~~

~~`nano ~/tmp/open-vm-tools/cross/open-vm-tools/Makefile`~~

~~Save the file and quit the editor.~~

~~**9.** Edit the following file and customize the value for the variable `SPK_VERS` according to the `.spk`-package version you want to generate and, if you want (optional), also for the variables `MAINTAINER` and `CHANGELOG`:~~

~~`nano ~/tmp/open-vm-tools/spk/open-vm-tools/Makefile`~~

~~Save the file and quit the editor.~~

**10.** Copy the `open-vm-tools` build files into the original "SynoCommunity" `spksrc` repository:

`sudo cp -r ~/tmp/open-vm-tools/* ~/tmp/spksrc/`

add sponge

`sudo cp -r /usr/bin/sponge ~/tmp/spksrc/`

**11.** Run and prepare the `spksrc`docker image:

`sudo docker run -it -v ~/tmp/spksrc:/spksrc ghcr.io/synocommunity/spksrc /bin/bash`

`make setup`

**12.** Install missing package `sponge`

~~The official synocommunity/spksrc docker container is missing the binary sponge. You need to install that for the build to finish:
`apt update`
`apt install moreutils`
(there might be better ways to accomplish that, but this one works for me)~~

add sponge

`cp -r /spksrc/sponge /usr/bin/`

**13.** Compile:

`cd /spksrc/spk/open-vm-tools-12/ && make arch-apollolake-7.0`

Sidenote: Other common architectures could be:

`arch-bromolow-6.2` or `arch-bromolow-7.0`

or

`arch-broadwell-6.2` or `arch-broadwell-7.0`

or

`arch-x64-6.2`

Now quit the docker building environment:

`exit`

You can now find the compiled `.spk`-package here:

`~/tmp/spksrc/packages`

**14.** Install the compiled `.spk`-package on your `Synology DSM` system.

Done.
