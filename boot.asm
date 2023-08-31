org 0x7C00

; Setup Stack
cli
mov ax, 0x9000
mov ss, ax
mov sp, 0xFFFF
sti

; Print Message
mov si, hello_msg
mov ah, 0x0E

print_char:
    lodsb
    test al, al
    jz hang
    int 0x10
    jmp print_char

hang:
    hlt
    jmp hang

hello_msg db "Hello, Bootloader!", 0

; Bootloader Signature
times 510-($-$$) db 0
dw 0xAA55
