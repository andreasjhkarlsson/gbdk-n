	.include	"global.s"

	;; BANKED:	checked, imperfect
	.area	_BASE

	;; Set sprite number C to tile D
.set_sprite_tile::
	LD	HL,#.OAM+2	; Calculate origin of sprite info

	ADD	A, A		; Multiply C by 4
	ADD	A, A
	LD	C, A
	LD	B,#0x00
	ADD	HL,BC

	LD	A,D		; Set sprite number
	LD	(HL),A
	RET

_set_sprite_tile::
	PUSH	BC

	LDA	HL,4(SP)	; Skip return address and registers
	LD	A,(HL+)		; C = nb
	LD	D,(HL)		; D = tile

	CALL	.set_sprite_tile

	POP	BC
	RET
