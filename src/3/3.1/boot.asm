org 0x7c00

BootStack equ 0x7c00

BootStart:
; initialize segment registers and stack pointer register
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, BootStack

; set display mode to resolution: 80*25, colors: 16
    mov ax, 0003h
    int 10h

; clean up screen
    mov ax, 0600
    mov bx, 0f00h  ; 字體高亮白色不閃爍，背景黑色
    mov cx, 0      ; 左上角座標 (0 , 0)
    mov dx, 184fh   ; 右下角座標 (24, 79)
    int 10h 

; set cursor to (0, 0) at page 0
    mov ax, 0200h
    mov dx, 0
    mov bx, 0
    int 10h

; print out boot message
    mov ax, 1301h
    mov cx, nBootMessage
    mov dx, 0
    mov bx, 000fh
    mov bp, BootMessage
    int 10h

    mov bp, BootStack
    

; infinite loop
    jmp $

BootMessage: 
    db "Boot starting", 0xd, 0xa, "Hello, world"

nBootMessage equ $ - BootMessage



times 510 - ($ - $$) db 0
dw 0xaa55
