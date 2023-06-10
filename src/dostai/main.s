; THE 64-DISK OPERATING SYSTEM TERMINAL AND INTERPRETER
; Provides the command-line interface for 64-DOS.

	processor 6502
;------- Simplified Executable (SE) header -------

	byte "SE"	;signature
	byte $14	;number of pages
	;entry point low byte
	;entry point high byte
	
;------- Code Segment -------
	seg code
	
hello	subroutine	;greet the user
	ldx #0
.loop	lda greet,x
	beq .exit
	jsr $ffd2
	inx
	jmp .loop
.exit

main	lda _echo	;if echo on, output prompt
	cmp 1
	bne wait
	lda drive
	cmp 1
	beq outD1
	cmp 2
	beq outD2
	cmp 3
	beq outD3
	cmp 4
	beq outD4
	
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

wait	jsr hinput	;handle input
	jsr resettk	;reset tokenizer
	jsr tokeniz	;tokenize

	include "handleinput.s"
	include "clearstdin.s"
	include "toker.s"
	
;------- Data Segment -------
	seg data
	include "greet.s"
	include "commands.s"
	include "values.s"