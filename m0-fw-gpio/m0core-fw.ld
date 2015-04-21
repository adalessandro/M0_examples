ENTRY(_start)
OUTPUT_FORMAT(elf32-littlearm)
SECTIONS
{
	. = 0x0;
	.text : {
		startup.o (INT_VECTOR)
		*(.text)
	}
	.resource_table : {
		resource_table.o (RESOURCE_TABLE)
	 }
	.data : { *(.data) }
	.bss : { *(.bss) *(COMMON) }
	. = ALIGN(4);
	. = . + 0x1000; /* 4kB of stack memory */
	stack_top = .;
}
