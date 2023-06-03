;This file was never finished and became IO/file.asm, don't use it.

;--------------------------------------
;FILEOUT
;Streamlines file output operations.
;Part of the 64-DOS kernel.
;--------------------------------------

;SETLFS variables
LN
DN
SA

;SETNAM variables
NL
LP
HP

;Parameters:
;A: pointer to file name (must be zero-terminated)
;X: device number

fileOut
	subroutine
	