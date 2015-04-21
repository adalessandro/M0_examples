    .syntax unified
    .thumb
    .global _start
    .section INT_VECTOR

_start:
    .word stack_top
    .word Reset_Handler + 1

	.section .text

Reset_Handler:
    BL c_entry
    B .
