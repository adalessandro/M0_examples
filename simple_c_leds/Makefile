CROSS_COMPILE=arm-cortexm3-uclinuxeabi-
CPU=cortex-m0
CC=gcc
AS=as
LD=ld
OBJCOPY=objcopy
XXD=xxd

m0prog.h: m0prog.bin
	$(XXD) --include $^ > $@

m0prog.bin: test.elf
	$(CROSS_COMPILE)$(OBJCOPY) -O binary $^ $@

test.elf: test.ld startup.o test.o
	$(CROSS_COMPILE)$(LD) -T $^ -o $@

startup.o: startup.s
	$(CROSS_COMPILE)$(AS) -mcpu=$(CPU) $^ -o $@

test.o: test.c
	$(CROSS_COMPILE)$(CC) -c -mcpu=$(CPU) $^ -o $@

clean:
	$(RM) *.o *.elf *.h *.bin
