#! /bin/sh
rm boot.img 2>/dev/null
nasm -o boot.bin boot.asm
bximage -mode=create -fd=1.44M boot.img -q
dd if=./boot.bin of=./boot.img bs=512 count=1 conv=notrunc

nasm -o ./loader.bin ./loader.asm
mkdir test
# mount boot.img to ./test and move loader.bin into it
sudo mount ./boot.img ./test -t vfat -o loop
sudo mv ./loader.bin ./test
sync
sudo umount ./test

rm -r test
sudo chmod 666 boot.img

bochs -f ./.bochsrc -q
