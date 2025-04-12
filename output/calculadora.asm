.global main
main:
    ldi r16, 103 ; UBRR0L = 103
    out 0x0A, r16,
    ldi r16, 0x08 ; (1<<TXEN0)
    out 0x0A, r16
    ldi r16, 0x06 ; (1<<UCSZ01)|(1<<UCSZ00)
    sts 0xC2, r16 ; UCSR0C
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Empilha 4.0000 (0x4400)
    ldi r24, 0x00
    ldi r25, 0x44
    call envia_uart
    ; Operando A (0x4200)
    ldi r20, 0x00
    ldi r21, 0x42
    ; Operando B (0x4400)
    ldi r22, 0x00
    ldi r23, 0x44
    call add_avr
    call envia_uart

    rjmp .
    ; Empilha 5.0000 (0x4500)
    ldi r24, 0x00
    ldi r25, 0x45
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Operando A (0x4500)
    ldi r20, 0x00
    ldi r21, 0x45
    ; Operando B (0x4000)
    ldi r22, 0x00
    ldi r23, 0x40
    call sub_avr
    call envia_uart
    ; Empilha 6.0000 (0x4600)
    ldi r24, 0x00
    ldi r25, 0x46
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Operando A (0x4600)
    ldi r20, 0x00
    ldi r21, 0x46
    ; Operando B (0x4000)
    ldi r22, 0x00
    ldi r23, 0x40
    call mul_avr
    call envia_uart
    ; Empilha 8.0000 (0x4800)
    ldi r24, 0x00
    ldi r25, 0x48
    call envia_uart
    ; Empilha 4.0000 (0x4400)
    ldi r24, 0x00
    ldi r25, 0x44
    call envia_uart
    ; Operando A (0x4800)
    ldi r20, 0x00
    ldi r21, 0x48
    ; Operando B (0x4400)
    ldi r22, 0x00
    ldi r23, 0x44
    call div_avr
    call envia_uart
    ; Empilha 9.0000 (0x4880)
    ldi r24, 0x80
    ldi r25, 0x48
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x4880)
    ldi r20, 0x80
    ldi r21, 0x48
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call pow_avr
    call envia_uart
    ; Empilha 4.0000 (0x4400)
    ldi r24, 0x00
    ldi r25, 0x44
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 10.0000 (0x4900)
    ldi r24, 0x00
    ldi r25, 0x49
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x4900)
    ldi r20, 0x00
    ldi r21, 0x49
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call mod_avr
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Empilha 7.0000 (0x4700)
    ldi r24, 0x00
    ldi r25, 0x47
    call envia_uart
    ; Operando A (0x4000)
    ldi r20, 0x00
    ldi r21, 0x40
    ; Operando B (0x4700)
    ldi r22, 0x00
    ldi r23, 0x47
    call mul_avr
    call envia_uart
    ; Empilha 4.0000 (0x4400)
    ldi r24, 0x00
    ldi r25, 0x44
    call envia_uart
    ; Operando A (0x4B00)
    ldi r20, 0x00
    ldi r21, 0x4B
    ; Operando B (0x4400)
    ldi r22, 0x00
    ldi r23, 0x44
    call add_avr
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x0000)
    ldi r20, 0x00
    ldi r21, 0x00
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call add_avr
    call envia_uart
    ; Empilha 7.0000 (0x4700)
    ldi r24, 0x00
    ldi r25, 0x47
    call envia_uart
    ; Operando A (0x4200)
    ldi r20, 0x00
    ldi r21, 0x42
    ; Operando B (0x4700)
    ldi r22, 0x00
    ldi r23, 0x47
    call mul_avr
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 9.0000 (0x4880)
    ldi r24, 0x80
    ldi r25, 0x48
    call envia_uart
    ; Operando A (0x0000)
    ldi r20, 0x00
    ldi r21, 0x00
    ; Operando B (0x4880)
    ldi r22, 0x80
    ldi r23, 0x48
    call add_avr
    call envia_uart
    ; Empilha 15.0000 (0x4B80)
    ldi r24, 0x80
    ldi r25, 0x4B
    call envia_uart
    ; Empilha 7.0000 (0x4700)
    ldi r24, 0x00
    ldi r25, 0x47
    call envia_uart
    ; Operando A (0x4B80)
    ldi r20, 0x80
    ldi r21, 0x4B
    ; Operando B (0x4700)
    ldi r22, 0x00
    ldi r23, 0x47
    call sub_avr
    call envia_uart
    ; Empilha 8.0000 (0x4800)
    ldi r24, 0x00
    ldi r25, 0x48
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Operando A (0x4800)
    ldi r20, 0x00
    ldi r21, 0x48
    ; Operando B (0x4000)
    ldi r22, 0x00
    ldi r23, 0x40
    call div_avr
    call envia_uart
    ; Empilha 9.0000 (0x4880)
    ldi r24, 0x80
    ldi r25, 0x48
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x4880)
    ldi r20, 0x80
    ldi r21, 0x48
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call pow_avr
    call envia_uart
    ; Empilha 5.0000 (0x4500)
    ldi r24, 0x00
    ldi r25, 0x45
    call envia_uart
    ; Empilha 6.0000 (0x4600)
    ldi r24, 0x00
    ldi r25, 0x46
    call envia_uart
    ; Operando A (0x4500)
    ldi r20, 0x00
    ldi r21, 0x45
    ; Operando B (0x4600)
    ldi r22, 0x00
    ldi r23, 0x46
    call mul_avr
    call envia_uart
    ; Empilha 25.0000 (0x4E40)
    ldi r24, 0x40
    ldi r25, 0x4E
    call envia_uart
    ; Empilha 5.0000 (0x4500)
    ldi r24, 0x00
    ldi r25, 0x45
    call envia_uart
    ; Operando A (0x4E40)
    ldi r20, 0x40
    ldi r21, 0x4E
    ; Operando B (0x4500)
    ldi r22, 0x00
    ldi r23, 0x45
    call div_avr
    call envia_uart
    ; Empilha 16.0000 (0x4C00)
    ldi r24, 0x00
    ldi r25, 0x4C
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Operando A (0x4C00)
    ldi r20, 0x00
    ldi r21, 0x4C
    ; Operando B (0x4000)
    ldi r22, 0x00
    ldi r23, 0x40
    call mul_avr
    call envia_uart
    ; Empilha 5.0000 (0x4500)
    ldi r24, 0x00
    ldi r25, 0x45
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x4500)
    ldi r20, 0x00
    ldi r21, 0x45
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call add_avr
    call envia_uart
    ; Empilha 7.0000 (0x4700)
    ldi r24, 0x00
    ldi r25, 0x47
    call envia_uart
    ; Empilha 6.0000 (0x4600)
    ldi r24, 0x00
    ldi r25, 0x46
    call envia_uart
    ; Operando A (0x4700)
    ldi r20, 0x00
    ldi r21, 0x47
    ; Operando B (0x4600)
    ldi r22, 0x00
    ldi r23, 0x46
    call mul_avr
    call envia_uart
    ; Empilha 8.0000 (0x4800)
    ldi r24, 0x00
    ldi r25, 0x48
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Operando A (0x4800)
    ldi r20, 0x00
    ldi r21, 0x48
    ; Operando B (0x4000)
    ldi r22, 0x00
    ldi r23, 0x40
    call mod_avr
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Operando A (0x0000)
    ldi r20, 0x00
    ldi r21, 0x00
    ; Operando B (0x0000)
    ldi r22, 0x00
    ldi r23, 0x00
    call pow_avr
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Operando A (0x3C00)
    ldi r20, 0x00
    ldi r21, 0x3C
    ; Operando B (0x4000)
    ldi r22, 0x00
    ldi r23, 0x40
    call add_avr
    call envia_uart
    ; Empilha 10.0000 (0x4900)
    ldi r24, 0x00
    ldi r25, 0x49
    call envia_uart
    ; Empilha 5.0000 (0x4500)
    ldi r24, 0x00
    ldi r25, 0x45
    call envia_uart
    ; Operando A (0x4900)
    ldi r20, 0x00
    ldi r21, 0x49
    ; Operando B (0x4500)
    ldi r22, 0x00
    ldi r23, 0x45
    call add_avr
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x4200)
    ldi r20, 0x00
    ldi r21, 0x42
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call mul_avr
    call envia_uart
    ; Empilha 4.0000 (0x4400)
    ldi r24, 0x00
    ldi r25, 0x44
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Operando A (0x4400)
    ldi r20, 0x00
    ldi r21, 0x44
    ; Operando B (0x4000)
    ldi r22, 0x00
    ldi r23, 0x40
    call pow_avr
    call envia_uart
    ; Empilha 12.0000 (0x4A00)
    ldi r24, 0x00
    ldi r25, 0x4A
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x4A00)
    ldi r20, 0x00
    ldi r21, 0x4A
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call div_avr
    call envia_uart
    ; Empilha 16.0000 (0x4C00)
    ldi r24, 0x00
    ldi r25, 0x4C
    call envia_uart
    ; Empilha 4.0000 (0x4400)
    ldi r24, 0x00
    ldi r25, 0x44
    call envia_uart
    ; Operando A (0x4C00)
    ldi r20, 0x00
    ldi r21, 0x4C
    ; Operando B (0x4400)
    ldi r22, 0x00
    ldi r23, 0x44
    call mod_avr
    call envia_uart
    ; Empilha 25.0000 (0x4E40)
    ldi r24, 0x40
    ldi r25, 0x4E
    call envia_uart
    ; Empilha 6.0000 (0x4600)
    ldi r24, 0x00
    ldi r25, 0x46
    call envia_uart
    ; Operando A (0x4E40)
    ldi r20, 0x40
    ldi r21, 0x4E
    ; Operando B (0x4600)
    ldi r22, 0x00
    ldi r23, 0x46
    call add_avr
    call envia_uart
    ; Empilha 2.0000 (0x4000)
    ldi r24, 0x00
    ldi r25, 0x40
    call envia_uart
    ; Empilha 8.0000 (0x4800)
    ldi r24, 0x00
    ldi r25, 0x48
    call envia_uart
    ; Operando A (0x4000)
    ldi r20, 0x00
    ldi r21, 0x40
    ; Operando B (0x4800)
    ldi r22, 0x00
    ldi r23, 0x48
    call mul_avr
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x0000)
    ldi r20, 0x00
    ldi r21, 0x00
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call add_avr
    call envia_uart
    ; Empilha 7.0000 (0x4700)
    ldi r24, 0x00
    ldi r25, 0x47
    call envia_uart
    ; Operando A (0x4200)
    ldi r20, 0x00
    ldi r21, 0x42
    ; Operando B (0x4700)
    ldi r22, 0x00
    ldi r23, 0x47
    call mul_avr
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 5.0000 (0x4500)
    ldi r24, 0x00
    ldi r25, 0x45
    call envia_uart
    ; Empilha 3.0000 (0x4200)
    ldi r24, 0x00
    ldi r25, 0x42
    call envia_uart
    ; Operando A (0x4500)
    ldi r20, 0x00
    ldi r21, 0x45
    ; Operando B (0x4200)
    ldi r22, 0x00
    ldi r23, 0x42
    call mul_avr
    call envia_uart
    ; Operando A (0x0000)
    ldi r20, 0x00
    ldi r21, 0x00
    ; Operando B (0x4B80)
    ldi r22, 0x80
    ldi r23, 0x4B
    call add_avr
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Empilha 0.0000 (0x0000)
    ldi r24, 0x00
    ldi r25, 0x00
    call envia_uart
    ; Operando A (0x0000)
    ldi r20, 0x00
    ldi r21, 0x00
    ; Operando B (0x0000)
    ldi r22, 0x00
    ldi r23, 0x00
    call div_avr
    call envia_uart
    ; Empilha 9.0000 (0x4880)
    ldi r24, 0x80
    ldi r25, 0x48
    call envia_uart
    ; Operando A (0x7C00)
    ldi r20, 0x00
    ldi r21, 0x7C
    ; Operando B (0x4880)
    ldi r22, 0x80
    ldi r23, 0x48
    call mul_avr
    call envia_uart
