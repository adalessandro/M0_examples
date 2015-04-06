ENTRY(_Reset)
SECTIONS
{
	. = 0x28700000;
	.text : {
		startup.o (INT_VECTOR)
		*(.text)
	}
	.data : { *(.data) }
	.bss : { *(.bss COMMON) }
	. = ALIGN(4);
	. = . + 0x1000; /* 4kB of stack memory */
	stack_top = .;
}
