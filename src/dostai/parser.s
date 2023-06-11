;DOSTAI'S PARSER
;Was never finished.

resetps	subroutine	;reset parser
	lda #0
	sta agenda
	sta tparsed
	rts

parse	subroutine	;parse!