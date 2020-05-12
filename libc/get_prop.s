	.include	"global.s"
	;; BANKED:	checked, imperfect
	.area	_BASE

	;; Get properties of sprite number C
.get_sprite_prop::
	LD	HL,#.OAM+3	; Calculate origin of sprite info

	ADD	A, A		; Multiply C by 4
	ADD	A, A
	LD	C, A
	LD	B,#0x00
	ADD	HL,BC

	LD	A,(HL)		; Get sprite properties
	LD	E,A
	RET

_get_sprite_prop::
	PUSH	BC

	LDA	HL,4(SP)	; Skip return address and registers
	LD	A,(HL)		; C = nb

	CALL	.get_sprite_prop

	POP	BC
	RET
