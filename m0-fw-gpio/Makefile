CROSS_COMPILE=arm-cortexm3-uclinuxeabi-
CPU=cortex-m0
CC=gcc
AS=as
LD=ld
OBJCOPY=objcopy
XXD=xxd

FW_NAME=m0core-fw

#Select either using or not registers variables to achieve optimum performance
USE_REGS=1
#Select RAM type where to load firmware. 0: SDRAM, 1: local SRAM
MEM_TYPE=1

simple_c_gpio: $(FW_NAME).ld startup.o simple_c_gpio.o resource_table.o
	$(CROSS_COMPILE)$(LD) -T $^ -o $(FW_NAME).elf -pie

resource_table.o: resource_table.s
	$(CROSS_COMPILE)$(AS) -mcpu=$(CPU) $^ -o $@ -k --defsym MEM_TYPE=$(MEM_TYPE)

startup.o: startup.s
	$(CROSS_COMPILE)$(AS) -mcpu=$(CPU) $^ -o $@ -k

simple_c_gpio.o: simple_c_gpio.c
	$(CROSS_COMPILE)$(CC) -c -mcpu=$(CPU) $^ -o $@ -pie -DUSE_REGS=$(USE_REGS)

clean:
	$(RM) *.o *.elf *.h *.bin
