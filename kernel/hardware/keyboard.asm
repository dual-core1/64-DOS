;---------------------------------------
;KEYBOARD DRIVER
;Facilitates reading of the keyboard.
;Part of the 64-DOS kernel
;---------------------------------------

;Unless stated otherwise, functions that return a value return it with the X register.

kbBuffer equ $0277
lenKBuff equ $00c6
SCNKEY equ $ea87

clearKeyboardBuffer
	subroutine
	lda #$0
	ldx #$0
.ckCont
	sta kbBuffer,x
	cpx #$0a
	beq .ckEnd
	inx
	jmp .ckCont
.ckEnd
	sta $00c6
	rts

getKey
	subroutine
	jsr clearKeyboardBuffer
	jsr SCNKEY
	ldx kbBuffer	;load X register with keyboard buffer
	rts	;then, return

checkKeyDown
	subroutine
	jsr getKey
	cmp kbBuffer ;compare parameter (stored in accumulator) to keyboard buffer
	beq .isDown
	bne .notDown
.isDown
	ldx #1
	rts
.notDown
	ldx #0
	rts