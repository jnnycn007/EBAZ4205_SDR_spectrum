# PetaLinux project
 
## Description

This PetaLinux project is to build and put together:
* the Linux kernel
* the root file system (rootfs)
* the programs (colorbars, sdr-app, wsjtx, jt9 etc)
to run the main "EBAZ4205 SDR and Spectrum" project

## Getting Started with this PetaLinux project

### build PetaLinux Image

Of course you need to have PetaLinux 2022.2 installed on Ubuntu 20.04 LTS or 22.04 LTS (don't do it on 23.04)
Git or download this folder to your PC
then:

cd to the PetaLinux folder
```
cd  /home/guido/EBAZ4205_SDR_spectrum/PetaLinux/ 
```
soource PetaLinux there, so that the petalinux command can be launched
```
source /tools/PetaLinux/2022.2/bin/settings.sh 
```

Build the project. The very first time it will take a lot of time (more than one hour on my Intel i9 12900H 32GB RAM)
```
petalinux-build
```


### build PetaLinux sysroot and get (cross)compilers

If you want to build Linux applications for PetaLinux using your host PC (with Ubuntu) you need a sysroot. E.g. Qt Creator installed on Ubuntu can build applications for the PetaLinux version installed in the Zynq7010 of your EBAZ4205, but it needs a special compiler and linker which, running on Ubuntu, can build Cortex A9 32 bits executables for PetaLinux, using the proper shared libraries and their include files. 

1. cd to the PetaLinux folder
```
cd  /home/guido/EBAZ4205_SDR_spectrum/PetaLinux/ 
```
2. source PetaLinux there, so that the petalinux commands can be launched
```
source /tools/PetaLinux/2022.2/bin/settings.sh 
```

3. Temporarily exclude "openssh-sftp-server" from building (because of a PetaLinux bug, the sysroot cannot be created with it!)
```
petalinux-config -c rootfs 
```
4. Navigate to "Filesystem Packages  → console  → network  → openssh"
5. Uncheck [ ] openssh-sftp-server 
6. exit saving

7. Build the sysroot
```
petalinux-build -s
```
At the end, you'll find the SDK installer in ...PetaLinux/images/linux/sdk.sh

8. Execute sdk.sh to explode the sysroot

cd to the PetaLinux/images/linux
```
cd  /home/guido/EBAZ4205_SDR_spectrum/PetaLinux/images/linux
```
9. Run sdk.sh. The default destination directory is: /opt/PetaLinux/2022.2/
```
./sdk.sh
```
10. Revert what you did at step 3 re-including "openssh-sftp-server" in building
```
petalinux-config -c rootfs 
```
11. Navigate to "Filesystem Packages  → console  → network  → openssh"
12. Check [X] openssh-sftp-server 
13. exit saving