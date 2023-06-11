;DOSTAI's VALUES

;environment variables
_echo	ds 1,1
drive	ds 1,1

;drive names
drive1	byte "A:> ",0
drive2	byte "B:> ",0
drive3	byte "C:> ",0
drive4	byte "D:> ",0

;command processor values
clength	ds 1,0	;length of command
cppos	ds 1,0	;command processor position

;tokenizer values
;ttokes	ds 6,0	;types of tokens	(6 tokens maximum)
;ltokes	ds 6,0	;lengths of tokens
;ntokes	ds 1,0	;number of tokens	(6 tokens maximum)

;parser values
agenda	ds 1,0	;current agenda
;tparsed	ds 1,0	;tokens parsed

;standard input
stdin	ds 128,0