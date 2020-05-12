	.include	"global.s"

	.globl	.copy_vram

	;; BANKED:	checked
	.area	_BASE

_set_bkg_data::
_set_win_data::
	LDH	A,(.LCDC)
	BIT	4,A
	JP	NZ,_set_sprite_data

	PUSH	BC

	LDA	HL,7(SP)	; Skip return address and registers
	LD	A,(HL-)		; BC = data
	LD	B, A
	LD	A,(HL-)
	LD	C, A
	LD	A,(HL-)		; E = nb_tiles
	LD	E, A
	LD	L,(HL)		; L = first_tile

	XOR	A
	OR	E		; Is nb_tiles == 0?
	JR	NZ,1$
	LD	DE,#0x1000	; DE = nb_tiles = 256
	JR	2$
1$:
;	A gets overwritten later anyways
;	DE = nb_tiles =* 16 //aka << 4
;	original code 0x00ed the upper byte
;	smaller (-1b) and faster (-10c) than original
	SWAP	E; 2c 2b
	LD	A, E; 1c 1b
	AND	A, #0x0F; 2c 2b
	LD	D, A; 1c 1b
	LD	A, E; 1c 1b
	AND	A, #0xF0; 2c 2b
	LD	E, A; 1c 1b
2$:
	; still HL = first_tile
	LD	A,L
	RLCA			; Sign extend (patterns have signed numbers)
	SBC	A
	LD	H,A
	ADD	HL,HL		; HL *= 16
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL

	PUSH	BC
	LD	BC,#0x9000
	ADD	HL,BC
	POP	BC

3$:				; Special version of '.copy_vram'
	BIT	3,H		; Bigger than 0x9800
	JR	Z,4$
	BIT	4,H
	JR	Z,4$
	RES	4,H		; Switch to 0x8800
4$:
	LDH	A,(.STAT)
	AND	#0x02
	JR	NZ,4$

	LD	A,(BC)
	LD	(HL+),A
	INC	BC
	DEC	DE
	LD	A,D
	OR	E
	JR	NZ,3$

	POP	BC
	RET

_set_sprite_data::
	PUSH	BC

	LDA	HL,7(SP)	; Skip return address and registers
	LD	A,(HL-)		; BC = data
	LD	B, A
	LD	A,(HL-)
	LD	C, A
	LD	A,(HL-)		; E = nb_tiles
	LD	E, A
	LD	L,(HL)		; L = first_tile

	XOR	A
	OR	E		; Is nb_tiles == 0?
	JR	NZ,1$
	LD	DE,#0x1000	; DE = nb_tiles = 256
	JR	2$
1$:
;	A gets overwritten later anyways
;	DE = nb_tiles =* 16 //aka << 4
;	original code 0x00ed the upper byte
;	smaller (-1b) and faster (-10c) than original
	SWAP	E; 2c 2b
	LD	A, E; 1c 1b
	AND	A, #0x0F; 2c 2b
	LD	D, A; 1c 1b
	LD	A, E; 1c 1b
	AND	A, #0xF0; 2c 2b
	LD	E, A; 1c 1b
2$:
	; still HL = first_tile
	LD	H,#0x00
	ADD	HL,HL		; HL *= 16
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL

	PUSH	BC
	LD	BC,#0x8000
	ADD	HL,BC
	POP	BC

	CALL	.copy_vram

	POP	BC
	RET
