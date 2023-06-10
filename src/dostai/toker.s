;DOSTAI'S TOKENIZER

resettk	subroutine	;reset tokenizer
	lda #0
	ldx #0
	sta ntokes
.loop	sta ttokes,x
	sta ltokes,x
	inx
	cpx #6
	bne .loop
	rts

tokeniz	subroutine	;tokenize!
	;WRITE ME!