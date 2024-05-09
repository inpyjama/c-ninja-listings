#
# Copyright 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
#

TOOLCHAIN_PREFIX ?= riscv64-unknown-elf-

OBJCOPY           = $(TOOLCHAIN_PREFIX)objcopy
OBJDUMP           = $(TOOLCHAIN_PREFIX)objdump
LD                = $(TOOLCHAIN_PREFIX)ld
AS                = $(TOOLCHAIN_PREFIX)as
GCC               = $(TOOLCHAIN_PREFIX)gcc

asm: foo.c
	$(GCC)  -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tmain.ld foo.c -S

all: main.s foo.c
	$(GCC)  -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tmain.ld main.s foo.c -o main.elf
	$(OBJCOPY) -O binary main.elf main.bin
	$(OBJDUMP) -D -S main.elf > main.elf.lst
	xxd -e -c 4 -g 4 main.bin

debug:
	qemu-system-riscv32 -S -M virt -nographic -bios none -kernel main.elf -gdb tcp::1234

gdb:
	gdb-multiarch main.elf -ex "target remote localhost:1234" -ex "break _start" -ex "continue" -q

.PHONY: clean
clean:
	rm -rf *.o *.elf *.bin *.out .gdb_history foo.s *.elf.lst
