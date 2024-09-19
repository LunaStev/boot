[org 0]
[bits 16]

    jmp 07c0h:start

start:
    mov ax, cs
    mov ds, ax

    mov ax, 0xb800
    mov es, ax
    mov di, 0
    mov ax, word [msgBack]
    mov cx, 0x7ff


paint:
    mov word [es:di], ax
    add di , 2
    dec cx
    jnz paint

    mov edi, 0
    mov byte [es:edi], '0'
    inc edi
    mov byte [es:edi], 0x06
    inc edi
    mov byte [es:edi], '1'
    inc edi
    mov byte [es:edi], 0x06
    inc edi
    mov byte [es:edi], 'i'
    inc edi
    mov byte [es:edi], 0x06
    inc edi
    mov byte [es:edi], 'g'
    inc edi
    mov byte [es:edi], 0x06
    inc edi
    mov byte [es:edi], 'o'
    inc edi
    mov byte [es:edi], 0x06

    jmp $

    msgBack db '.', 0x67

    times 510-($-$$) db 0
    dw 0xAA55