;CLEAR STDIN

cstdin	subroutine
	lda #0
	ldx #0
.loop	sta stdin,x
	cpx #127
	beq .exit
	jmp .loop
.exit	rts
