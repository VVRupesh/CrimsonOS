TOOLCHAIN = D:/Github projects/CrimsonOS/gnu-arm-embedded/bin
CC      = $(TOOLCHAIN)/aarch64-none-elf-gcc
LD      = $(TOOLCHAIN)/aarch64-none-elf-ld
OBJCOPY = $(TOOLCHAIN)/aarch64-none-elf-objcopy
CFLAGS  = -Wall -O2 -ffreestanding -nostdinc -nostdlib -mcpu=cortex-a72

all: kernel8.img

vectors.o: vectors.S
	$(CC) $(CFLAGS) -c vectors.S -o vectors.o

kernel8.img: boot.o vectors.o kernel.o
	$(LD) -T link.ld boot.o vectors.o kernel.o -o kernel8.elf
	$(OBJCOPY) -O binary kernel8.elf kernel8.img

boot.o: boot.S
	$(CC) $(CFLAGS) -c boot.S -o boot.o

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

# Run in QEMU (virtual Raspberry Pi)
run: kernel8.img
	qemu-system-aarch64 -M virt -cpu cortex-a72 -smp 1 -m 128M -kernel kernel8.img -nographic -serial mon:stdio

clean:
	del *.o *.elf *.img 2>NUL