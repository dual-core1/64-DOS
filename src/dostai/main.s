; THE 64-DISK OPERATING SYSTEM TERMINAL AND INTERPRETER
; Provides the command-line interface for 64-DOS.

	processor 6502
;------- Simplified Executable (SE) header -------

	byte "SE"	;signature
	byte $00	;number of pages (a page is 256 bytes)
	byte $00	;entry point low byte
	byte $00	;entry point high byte
	
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
	
wait	jsr hinput	;handle input
	jsr gclen	;get command length
	lda clength	;read command length
	cmp #0
	beq main	;if clength = 0 then goto main
	cmp #3
	beq cmpl3	;if clength = 3 then goto cmpl3
	cmp #4
	beq cmpl4	;if clength = 4 then goto cmpl4

;	jsr resettk	;reset tokenizer
;	jsr tokeniz	;tokenize
;	jsr resetps	;reset parser
;	jsr parse	;parse
	jsr cstdin	;clear stdin
	jmp main

	include "handleinput.s"
	include "clearstdin.s"
	include "process.s"
	include "outputdrive.s"
;	include "toker.s"
;	include "parser.s"
	
;------- Data Segment -------
	seg data
	include "greet.s"
	include "commands.s"
	include "values.s"