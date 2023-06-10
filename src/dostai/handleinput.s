;DOSTAI INPUT HANDLING

hinput	subroutine
	ldy #0
.loop	jsr $ffcf
	sta stdin,y
	iny
	cmp #0d
	bne .loop
	rts
