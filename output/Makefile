MCU=atmega328p
PROGRAMMER = arduino
F_CPU=16000000UL
BAUD=115200
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
AVRDUDE_FLAGS=-c arduino -p m328p -P $(PORT) -b 115200

all: $(HEX)

$(OBJ): $(SRC)
	$(AS) $(ASFLAGS) -o $@ $<

$(ELF): $(OBJ)
	$(LD) -o $@ $<

$(HEX): $(ELF)
	$(OBJCOPY) -O ihex -R .eeprom $< $@

upload:
	avrdude -c arduino -p atmega328p -P $(PORT) -b 115200 -U flash:w:calculadora.hex:i

monitor:
	cmd /C type COM5

clean:
	powershell -Command "Remove-Item -Force -ErrorAction SilentlyContinue *.o, *.elf, *.hex"