;---------------------------------------
;SERIAL BUS INTERFACE
;Facilitates serial bus access.
;Part of the 64-DOS kernel.
;---------------------------------------

;Unless stated otherwise, functions that return a value return it with the X register.
;In this file, HIGH is 1 and LOW is 0. This may not reflect actual usage. However, what
;matters is that a 1 is returned when a specific bit is 1, and the same for a 0.

serialPtr equ $dd00

readTXD
	lda #%00000100
	and serialPtr
	cmp #%00000100
	beq resultHigh
	bne resultLow
	rts

readATNOut
	lda #%00001000
	and serialPtr
	cmp #%00001000
	beq resultHigh
	bne resultLow
	rts

readClockOut
	lda #%00010000
	and serialPtr
	cmp #%00010000
	beq resultHigh
	bne resultLow
	rts

readDataOut
	lda #%00100000
	and serialPtr
	cmp #%00100000
	beq resultHigh
	bne resultLow
	rts

readClockIn
	lda #%01000000
	and serialPtr
	cmp #%01000000
	beq resultHigh
	bne resultLow
	rts

readDataIn
	lda #%10000000
	and serialPtr
	cmp #%10000000
	beq resultHigh
	bne resultLow
	rts
	
resultHigh
	ldx #1
	rts

resultLow
	ldx #0
	rts