TOOLCHAIN_PREFIX ?= riscv64-unknown-elf-

OBJCOPY           = $(TOOLCHAIN_PREFIX)objcopy
LD                = $(TOOLCHAIN_PREFIX)ld
AS                = $(TOOLCHAIN_PREFIX)as
GCC               = $(TOOLCHAIN_PREFIX)gcc

all: main.c
	$(GCC) -O0 -nostdlib -nostartfiles -ffreestanding -march=rv32i1 -mabi=ilp32 -S main.c

.PHONY: clean
clean:
	rm -rf *.s

