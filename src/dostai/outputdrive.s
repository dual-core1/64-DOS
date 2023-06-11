;OUTPUT DRIVE NAMES
;(This was originally in main, but was cluttering it up.)

outD1	subroutine	;output name of drive 1
	ldx #0
.loop	lda drive1,x
	beq .exit
	jsr $ffd2
	inx
	jmp .loop
.exit	jmp wait

outD2	subroutine	;output name of drive 2
	ldx #0
.loop	lda drive2,x
	beq .exit
	jsr $ffd2
	inx
	jmp .loop
.exit	jmp wait

outD3	subroutine	;output name of drive 3
	ldx #0
.loop	lda drive3,x
	beq .exit
	jsr $ffd2
	inx
	jmp .loop
.exit	jmp wait

outD4	subroutine	;output name of drive 4
	ldx #0
.loop	lda drive4,x
	beq .exit
	jsr $ffd2
	inx
	jmp .loop
.exit	jmp wait