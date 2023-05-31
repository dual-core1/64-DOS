;--------------------------------------
;1541
;Controls the 1541 disk drive.
;Part of the 64-DOS kernel.
;--------------------------------------

;THIS FILE RELIES ON SWITCHIO.ASM, MAKE SURE IT'S INCLUDED WITH IT

secondaryAddressPtr equ $00b9

;---- some kernel routines ----

UNLSTN equ $edfe
LISTEN equ $ed06
LSTNSA equ $edb9
IECIN equ $ee13
IECOUT equ $eddd

;The prepareToCommand1541 subroutine sets everything up for
;64-DOS to send commands to the 1541. The accumulator must
;contain the drive number. Drive #1 is device #8, #2 is #9,
;so use the drive number, not the device number.

prepareToCommand1541
	subroutine
	tax                            ; we'll need the accumulator's value later, so transfer to X
	cmp #1
	beq .prepD1
	cmp #2
	beq .prepD2
	cmp #3
	beq .prepD3
	cmp #4
	beq .prepD4
	rts                            ;if it's not one of these numbers, do nothing
.prepD1
	jsr switchOutputToDrive1
	jmp .ptc1541Done
.prepD2
	jsr switchOutputToDrive2
	jmp .ptc1541Done
.prepD3
	jsr switchOutputToDrive3
	jmp .ptc1541Done
.prepD4
	jsr switchOutputToDrive4
	jmp .ptc1541Done
.ptc1541Done
	lda #$f
	sta secondaryAddressPtr
	txa                            ;put parameter back into accumulator
	adc #7                         ;add 7
	jsr LISTEN                     ;tell the drive to listen up!
	lda secondaryAddressPtr        ;we need the secondary address
	jsr LSTNSA                     ;send secondary address to serial bus
	rts

;stopCommand1541 stops commanding the 1541. It also
;switches output back to the screen. Once again, use
;the drive number, not the device number.

stopCommand1541
	subroutine
	adc #7
	jsr UNLSTN
	jsr switchOutputToScreen
	rts

;TODO: write functions for sending commands. I can't wait!