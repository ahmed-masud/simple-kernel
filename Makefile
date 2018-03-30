NASM=nasm

kernel: kernel.asm kernel.c kernel.ld
	$(CC) -m32 -c kernel.c -o kc.o
	$(NASM) -f elf32 kernel.asm -o kasm.o
	$(LD) -m elf_i386 -T kernel.ld -o kernel kc.o kasm.o

clean:
	$(RM) *.o kernel
