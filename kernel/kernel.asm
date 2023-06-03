;---------------------------------------
;THE 64-DOS KERNEL
;Always resident in memory for as long
;as 64-DOS is running.
;---------------------------------------

;USE FORMAT 3 (RAW DATA) FOR OUTPUT FORMAT!!!

	processor 6502
	org $0000	;NOT $C000 because the kernel is loaded by the bootstrapper, not the C64.

;------------- INCLUDES -------------

	include "hardware/hardware.asm"
	include "util/KERNAL.asm"
	include "IO/file.asm"

;----------- ENTRY  POINT -----------

beginKernelExecution