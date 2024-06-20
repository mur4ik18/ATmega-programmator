# if you want to use Arduino toolchain
#TOOLCHAIN_PATH = ~/Library/Arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin
#CC 			= $(TOOLCHAIN_PATH)/avr-gcc
#OBJCOPY 		= $(TOOLCHAIN_PATH)/avr-objcopy

# If u installed GNU AVR toolchain
CC 				= avr-gcc
OBJCOPY 		= avr-objcopy
AVRDUDE			= avrdude

TTY 			= /dev/ttyACM0
PROCESSOR_NAME 	= atmega2560
CPU_FREQUENCY 	= 16000000UL

MKDIR_P = mkdir -p

SRCPATH = ./src
OUTPATH = ./out

OUTNAME = main

OUTBIN = $(OUTPATH)/$(OUTNAME).bin
OUTHEX = $(OUTPATH)/$(OUTNAME).hex

SRCS = $(wildcard $(SRCPATH)/*.c)
OBJS = $(patsubst $(SRCPATH)/%.c, $(OUTPATH)/%.o, $(SRCS))

CFLAGS += -Wall -Wextra -mmcu=$(PROCESSOR_NAME) -DF_CPU=$(CPU_FREQUENCY) -std=c99 -pedantic -Os

all: $(OUTPATH) $(OUTHEX)

$(OUTPATH):
	$(MKDIR_P) $@

$(OUTPATH)/%.o: $(SRCPATH)/%.c
	$(CC) -c $< -o $@ $(CFLAGS)

$(OUTBIN): $(OBJS)
	$(CC) $(CFLAGS) -c $(SRCPATH)/$(OUTNAME).c -o $(OUTPATH)/$(OUTNAME).o -Wall
# add $^ if need to to link library
	$(CC) $(CFLAGS) -o $@ $(OUTPATH)/$(OUTNAME).o 

$(OUTHEX): $(OUTBIN)
	$(OBJCOPY) -j .text -j .data -O ihex $^ $@

flash: 
	sudo $(AVRDUDE) -p atmega2560 -c stk500v2 -D -U flash:w:main.hex:i -F -P $(TTY)


.PHONY: connect
connect:
	sudo putty $(TTY) -serial -sercfg 9600

clean: $(OUTPATH)
	rm -rf $^

