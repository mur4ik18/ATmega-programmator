#include <avr/io.h>
#include <util/delay.h>
#define F_CPU 16000000UL //16MHz
#define LED_PIN PB7

int main() {
    DDRB  |= 1<<LED_PIN;
    PORTB &= ~1<<LED_PIN;
    while(1) {
        PORTB |= 1<<LED_PIN;
        _delay_ms(500);
        PORTB &= ~1<<LED_PIN;
        _delay_ms(500);
    }
}
