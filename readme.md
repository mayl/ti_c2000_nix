# ti-c2000 flake

A nixos flake which downloads the c2000 toolchain from TI and installs it for [nixos](nixos).

The toolchain seems like it works, but to be fully useful you also need the device header files from [c2000ware](https://dr-download.ti.com/secure/software-development/software-development-kit-sdk/MD-xwaqzaqOcB/4.02.00.00/C2000Ware_4_02_00_00_setup.run?__gda__=1673032135_37c7b3b3b7d35a32404ee0519eed103c) which requires login to download.  I need to set something up where I can privately re-host this file so that I can download it as part of this flake I guess...
