org 0x10000

mov ax, cs
mov es, ax
mov ds, ax
mov ax, 0
mov ss, ax
mov sp, 7c00h

mov ax, 1301h
mov cx, nLoaderStartMessage
mov dx, 0100h
mov bp, LoaderStartMessage
mov bx, 000ah
int 10h

jmp $





LoaderStartMessage: db "Start loader"
nLoaderStartMessage equ $ - LoaderStartMessage
