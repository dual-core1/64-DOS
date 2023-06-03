;--------------------------------------
;FILE
;Streamlines file access operations.
;Part of the 64-DOS kernel.
;--------------------------------------

;SETLFS variables
DN	;device number

;SETNAM variables
NL	;name length
LP	;lo-byte pointer to filename
HP	;hi-byte pointer to filename

;ADDITIONAL
AM	;access mode

;Parameters:
;A: 0 for reading, 1 for writing
;Once used, use CHRIN to read a byte from it.
accessFile
	sta AM
	lda #1
	ldx DN
	ldy #0
	jsr SETLFS
	lda NL
	ldx LP
	ldy HP
	jsr SETNAM
	jsr OPEN
	if AM = 0
		ldx #1
		jsr CHKIN
	else
		ldx #1
		jsr CHKOUT
	endif
	rts

;Takes no parameters. ALWAYS call when done with a file.
closeFile
	lda #1
	jsr CLOSE
	jsr CLRCHN
	rts