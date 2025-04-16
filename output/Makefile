.PHONY: monitor

MCU=atmega328p
PROGRAMMER = arduino
F_CPU=16000000UL
BAUD=9600
PORT=COM5

AS=avr-as
LD=avr-ld
OBJCOPY=avr-objcopy
AVRDUDE=avrdude

SRC=calculadora.asm
OBJ=calculadora.o
ELF=calculadora.elf
HEX=calculadora.hex

ASFLAGS=-mmcu=$(MCU)
LDFLAGS=
AVRDUDE_FLAGS=-c arduino -p m328p -P $(PORT) -b 9600

all: $(HEX)

$(OBJ): $(SRC)
	$(AS) $(ASFLAGS) -o $@ $<

$(ELF): $(OBJ)
	$(LD) -o $@ $<

$(HEX): $(ELF)
	$(OBJCOPY) -O ihex -R .eeprom $< $@

upload:
	$(AVRDUDE) -c arduino -p atmega328p -P $(PORT) -b <span class="math-inline">\(BAUD\) \-U flash\:w\:</span>(HEX):i

monitor:
	"C:\Program Files\PuTTY\putty.exe" -serial $(PORT) -sercfg $(BAUD),8,n,1

clean:
	powershell -Command "Remove-Item -Force -ErrorAction SilentlyContinue *.o, *.elf, *.hex"