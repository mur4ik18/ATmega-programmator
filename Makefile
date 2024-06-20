# if you want to use Arduino toolchain
#TOOLCHAIN_PATH  = ~/Library/Arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin
#CC 		= $(TOOLCHAIN_PATH)/avr-gcc
#OBJCOPY = $(TOOLCHAIN_PATH)/avr-objcopy

# If u installed GNU AVR toolchain
TOOLCHAIN_PATH = .
CC 		= avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude

PROCESSOR_NAME = atmega2560
CPU_FREQUENCY = 16000000UL

CFLAGS += -Wall -Wextra -mmcu=$(PROCESSOR_NAME) -DF_CPU=$(CPU_FREQUENCY) -std=c99 -pedantic -Os

default:
	$(CC) $(CFLAGS) -o main.bin main.c
	$(OBJCOPY) -j .text -j .data -O ihex main.bin main.hex
	sudo $(AVRDUDE) -p atmega2560 -c stk500v2 -D -U flash:w:main.hex:i -F -P /dev/ttyACM0


clean: $(OUTPATH)
	rm -rf $^
