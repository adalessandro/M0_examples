    .section RESOURCE_TABLE

	@resource_table
    .word 0x1	@ver
    .word 0x1	@num
    .word 0x0	@reserved[0]
    .word 0x0	@reserved[1]
    .word 0x14	@offset[0]
	
	@fw_rsc_hdr[0]

.if MEM_TYPE == 0
	.word 0x0			@type: RSC_CARVEOUT
	@rsc
	.word 0x0			@da: device address
	.word 0x0			@pa: physical address
	.word 0x10000		@len: length (in bytes)
	.word 0x0			@flags
	.word 0x0			@reserved: reserved (must be zero)
.else
	.word 0x4			@type: RSC_INTMEM
	@rsc
	.word 0x1			@version
	.word 0x0			@da: device address
	.word 0x10000000	@pa: physical address
	.word 0x10000		@len: length (in bytes)
	.word 0x0			@reserved: reserved (must be zero)
.endif

	@rsc->data
	.byte 0x43			@name[32]: human-readable name of the requested memory region
	.byte 0x49
	.byte 0x41
	.byte 0x41
	.byte 0x20
	.byte 0x69
	.byte 0x73
	.byte 0x20
	.byte 0x6e
	.byte 0x6f
	.byte 0x74
	.byte 0x20
	.byte 0x43
	.byte 0x49
	.byte 0x41
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
	.byte 0x0
