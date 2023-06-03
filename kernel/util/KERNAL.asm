;--------------------------------------
;C64 KERNAL ROUTINES
;Defines pointers to KERNAL routines.
;Part of the 64-DOS (correctly spelled) kernel.
;--------------------------------------

SCINIT equ $ff81
IOINIT equ $ff84
RAMTAS equ $ff87
RESTOR equ $ff8a
VECTOR equ $ff8d
SETMSG equ $ff90
LSTNSA equ $ff93
TALKSA equ $ff96
MEMBOT equ $ff99
MEMTOP equ $ff9c
SCNKEY equ $ff9f
SETTMO equ $ffa2 ;I don't know what the hell this does
IECIN  equ $ffa5
IECOUT equ $ffa8
UNTALK equ $ffab
UNLSTN equ $ffae
LISTEN equ $ffb1
TALK   equ $ffb4
READST equ $ffb7
SETLFS equ $ffba
SETNAM equ $ffbd
OPEN   equ $ffc0
CLOSE  equ $ffc3
CHKIN  equ $ffc6
CHKOUT equ $ffc9
CLRCHN equ $ffcc
CHRIN  equ $ffcf
CHROUT equ $ffd2
LOAD   equ $ffd5
SAVE   equ $ffd8
SETTIM equ $ffdb
RDTIM  equ $ffde
STOP   equ $ffe1
GETIN  equ $ffe4
CLALL  equ $ffe7
UDTIM  equ $ffea
SCREEN equ $ffed
PLOT   equ $fff0
IOBASE equ $fff3