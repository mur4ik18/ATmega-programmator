<h1 align="center">
  <br>
  ATmega-programmator
  <br>
</h1>
<p align="center">
  <img alt="Github language" src="https://img.shields.io/github/languages/top/mur4ik18/ATmega-programmator?color=success">
  <img alt="Repository size" src="https://img.shields.io/github/repo-size/mur4ik18/ATmega-programmator?color=success">
</p>


If you like me use mac with Apple silicon, you need to install [GNU ARC Toolchain](https://github.com/osx-cross/homebrew-avr) or you can install Arduino IDE (Don't worry you don't need to use Arduino IDE, you only need AVR toolchain.) and uncommit this code
```
  #TOOLCHAIN_PATH = ~/Library/Arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin
  #CC 			= $(TOOLCHAIN_PATH)/avr-gcc
  #OBJCOPY 		= $(TOOLCHAIN_PATH)/avr-objcopy
```
## How to use

1. Clone this repo:
```
git clone https://github.com/mur4ik18/ATmega-programmator
```
2. Put your code in ./src
3. run code:
```
make clean
make MAINFILENAME
make flash
```
4. star this repo

If you need to connect to COM port :
```
make connect
```



## Thanks

My friend who helped me with Makefile's:

-   [remimimimimi]

  
[remimimimimi]: https://github.com/remimimimimi
