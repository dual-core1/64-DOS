;DOSTAI'S TOKENIZER
;Was never finished.

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
	ldx #0
	ldy #0
.loop	lda stdin,x
	cmp #$20	;space reached
	beq .hwspce
	cmp #$0d	;end-of-line reached
	beq .heol
	inx
	iny
	jmp .loop
.hwspce	lda ntokes	;handle whitespace
	cmp #0
	