;---------------------------------------
;THE 64-DOS KERNEL
;Always resident in memory for as long
;as 64-DOS is running.
;---------------------------------------

;USE FORMAT 2 (RANDOM ACCESS SEGMENT) FOR OUTPUT FORMAT!!!

	processor 6502
	org $0000	;NOT $C000 because the kernel is loaded by the bootstrapper, not the C64.

;------------- INCLUDES -------------

	include "IO/io.asm"
	include "hardware/hardware.asm"

;----------- ENTRY  POINT -----------

beginKernelExecution