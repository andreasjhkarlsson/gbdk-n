	.include	"global.s"

	;; BANKED:	checked, imperfect
	.area	_BASE

	;; Move sprite number C at XY = DE
.scroll_sprite::
	LD	HL,#.OAM	; Calculate origin of sprite info
	SLA	C		; Multiply C by 4
	SLA	C
	LD	B,#0x00
	ADD	HL,BC

	LD	A,(HL)
	ADD	E		; Set Y
	LD	(HL+),A

	LD	A,(HL)
	ADD	D		; Set X
	LD	(HL+),A
	RET

_scroll_sprite::
	PUSH	BC

	LDA	HL,4(SP)	; Skip return address and registers
	LD	A,(HL+)		; C = nb
	LD	C, A
	LD	A,(HL+)		; D = x
	LD	D, A
	LD	E,(HL)		; E = y

	CALL	.scroll_sprite	; trashes A anyways

	POP	BC
	RET
