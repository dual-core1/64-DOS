;DOSTAI'S INPUT PROCESSOR

rescp	subroutine	;reset command processor
	lda #0
	sta clength
	sta cppos
	sta agenda
	rts

gclen	subroutine	;get command length
	ldx #0
.loop	lda stdin,x
	cmp #$20	;whitespace reached
	beq .end
	cmp #$0d	;end-of-line reached
	beq .end
	inx
	jmp .loop
.end	dex	;decrement x (x is command length + 1 when whitespace/EOL is reached)
	stx clength
	rts

cmpl3	subroutine	;compare input to commands with a length of 3
	;WRITE ME!

cmpl4	subroutine	;compare input to commands with a length of 4
	;WRITE ME!