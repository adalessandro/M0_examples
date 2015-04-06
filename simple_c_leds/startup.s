    .syntax unified
    .thumb
    .global _Reset
    .section INT_VECTOR

_Reset:
    .word stack_top
    .word Reset_Handler + 1


	.section .text
Reset_Handler:
    LDR r0, GPIOON
    LDR r1, BLUELED
    STR r1, [r0, 0x0]

    BL c_entry
    
    B .

    .align 4
GPIOON:
    .word 0x400f629c    @gpio port on 7 register
BLUELED:
    .word 0x100         @led bit offsets: (r,g,b) = (5,6,8)
GREENLED:
    .word 0x40          @led bit offsets: (r,g,b) = (5,6,8)
REDLED:
    .word 0x20          @led bit offsets: (r,g,b) = (5,6,8)
