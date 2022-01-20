#! /bin/sh
rm boot.img 2>/dev/null
nasm -o boot.bin boot.asm
bximage -mode=create -fd=1.44M boot.img -q
dd if=./boot.bin of=./boot.img bs=512 count=1 conv=notrunc
bochs -f ./.bochsrc -q
