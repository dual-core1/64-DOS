;---------------------------------------
;SwitchIO
;Switches input/output devices.
;Part of the 64-DOS kernel.
;---------------------------------------

;pointers to memory locations

currentInputPtr equ $0099
currentOutputPtr equ $009A

;device numbers

dKeyboard equ #$00
dScreen equ #$03
dDrive1 equ #$08
dDrive2 equ #$09
dDrive3 equ #$0a
dDrive4 equ #$0b

;switching functions

;SWITCH INPUT

SwitchInputToKeyboard
	lda dKeyboard
	sta currentInputPtr
	rts

SwitchInputToDrive1
	lda dDrive1
	sta currentInputPtr
	rts

SwitchInputToDrive2
	lda dDrive2
	sta currentInputPtr
	rts

SwitchInputToDrive3
	lda dDrive3
	sta currentInputPtr
	rts

SwitchInputToDrive4
	lda dDrive4
	sta currentInputPtr
	rts

;SWITCH OUTPUT

SwitchOutputToScreen
	lda dScreen
	sta currentOutputPtr
	rts

SwitchOutputToDrive1
	lda dDrive1
	sta currentOutputPtr
	rts

SwitchOutputToDrive2
	lda dDrive2
	sta currentOutputPtr
	rts

SwitchOutputToDrive3
	lda dDrive3
	sta currentOutputPtr
	rts

SwitchOutputToDrive4
	lda dDrive4
	sta currentOutputPtr
	rts