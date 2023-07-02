# Processor name
MCU = atmega2560
# Processor frequency
F_CPU = 16000000UL

default:
	avr-gcc -Wall -g -Os -mmcu=$(MCU) -DF_CPU=$(F_CPU) -o main.bin main.c
	avr-objcopy -j .text -j .data -O ihex main.bin main.hex
	sudo avrdude -p atmega2560 -c stk500v2 -D -U flash:w:main.hex:i -F -P /dev/ttyACM0
