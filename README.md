# gbdk-n

#### Background

The Gameboy Development Kit (GBDK) is an SDK for developing applications/games for the gameboy platform. The library bundles a custom version of the Small Device C Compiler (SDCC), libraries & examples.

The latest update of GBDK was a long time ago (mid 2002). Since then the SDCC compiler has gotten native support for compiling and linking fully functional gameboy roms. 

However GBDK is still useful since it contains libraries for developing applications for the gameboy family. This project aims to update the libraries to be compatible with new versions of SDCC and provide helpers for building roms.

The GBDK libraries are copied from the latest source release on sourceforge: http://sourceforge.net/projects/gbdk/files/gbdk/2.96/

#### Usage

##### Building the library:
`$ make`

##### Building the examples:
`$ make examples`

##### Building custom ROMs:
NOTE: All commands listed below are simply wrappers to SDCC, see the SDCC documentation for flags and general usage.

* Compile / assemble .c files and .asm files into .rel files using the gbdk-n-compile.sh and gbdk-n-assemble.sh commands respectively.
* Link together one or more .rel files into an .ihx file using the gbdk-n-link.sh command.
* Create a ready to use .gb rom file from the .ihx file with the gbdk-n-make-rom.sh command.

For exact commands, please see the Makefiles for the example programs.
