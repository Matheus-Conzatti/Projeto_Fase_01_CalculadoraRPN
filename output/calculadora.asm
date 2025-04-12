.global main
main:
    ldi r16, 103 ; UBRR0L = 103
    out 0x0A, r16,
    ldi r16, 0x08 ; (1<<TXEN0)
    out 0x0A, r16
    ldi r16, 0x06 ; (1<<UCSZ01)|(1<<UCSZ00)
    sts 0xC2, r16 ; UCSR0C
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x42
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x44
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    call uart_send_result
end:
    rjmp end
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x45
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x40
    call sub_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x46
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x40
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x48
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x44
    call div_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x80
    ldi r17, 0x48
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call pow_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x49
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call mod_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x40
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x47
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x4B
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x44
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x00
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x42
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x47
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x00
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x80
    ldi r19, 0x48
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x80
    ldi r17, 0x4B
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x47
    call sub_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x48
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x40
    call div_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x80
    ldi r17, 0x48
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call pow_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x45
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x46
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x40
    ldi r17, 0x4E
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x45
    call div_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x4C
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x40
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x45
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x47
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x46
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x48
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x40
    call mod_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x00
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x00
    call pow_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x3C
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x40
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x49
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x45
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x42
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x44
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x40
    call pow_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x4A
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call div_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x4C
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x44
    call mod_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x40
    ldi r17, 0x4E
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x46
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x40
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x48
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x00
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x42
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x47
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x45
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x42
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x00
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x80
    ldi r19, 0x4B
    call add_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x00
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x00
    ldi r19, 0x00
    call div_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
    ; Carrega A em r16 (LSB) e r17 (MSB)
    ldi r16, 0x00
    ldi r17, 0x7C
    ; Carrega B em r18 (LSB) e r19 (MSB)
    ldi r18, 0x80
    ldi r19, 0x48
    call mul_avr
    ; Envia resultado via UART (em hexadecimal)
    mov r30, r20 ; LSB -> r30
    mov r31, r21 ; MSB -> r31
    call print_hex
