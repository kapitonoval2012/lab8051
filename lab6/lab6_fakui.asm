;;Num:01130718

	ORG 0000H
	AJMP MAIN
	ORG 0030H
MAIN:
	MOV	60H,#00H
	MOV	61H,#01H
	MOV	62H,#01H
	MOV	63H,#03H
	MOV	64H,#00H
	MOV	65H,#07H
	MOV	66H,#01H
	MOV	67H,#08H

	MOV P1,#00H	

LOOP:
	ACALL DISPLAY
	SJMP LOOP
	
; 01130718
; 0000 0001    0
; 0000 0011    01
; 0000 0111    011
; 0000 1111    0113
; 1111 1111    ........
DISPLAY:
	MOV	R7,#8
	MOV	R0,#67H
	MOV	R6,#80H	;
	
	MOV	DPTR,#TAB

	MOV	A,@R0	
	MOVC A,@A+DPTR
	MOV	P2,A
	MOV	P1,R6
	
	; DEC R0
	
	; MOV	A,@R0	
	; MOVC A,@A+DPTR
	; MOV	P2,A ;
	; MOV	P1,R6
	
	MOV A,R6
	RR A
	ORL A,#80H
	MOV R6,A 
	
	
	ACALL DELAY
	MOV	P1,#00H
	
	;DEC	R0
	DJNZ R7,LOOP3
	RET
	
DELAY: ; delay 200ms
	MOV B,#200
DL0:	
	MOV R3,#0FAH ; 250*4 
DL1:
	NOP
	NOP
	DJNZ R3,DL1
	DJNZ B,DL0
	RET
	
TAB:
	DB      0C0H, 0F9H, 0A4H, 0B0H  ;0, 1, 2, 3
	DB       99H,  92H,  82H, 0F8H  ;4, 5, 6, 7
	DB       80H,  90H,  88H,  83H  ;8, 9, A, B
	DB      0C6H, 0A1H,  86H,  8EH  ;C, D, E, F
	END