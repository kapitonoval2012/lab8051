	ORG 0000H
	AJMP MAIN
	ORG 0030H
	
MAIN:
	MOV P1,#01H 
	MOV P2,#0FFH
LOOP:	
	MOV R0,#00H
	MOV DPTR,#TAB

DISPLAY:

	MOV A,R0
	MOVC A,@A+DPTR
	MOV P2,A
	
	CJNE R0,#10H,NEXT ; R0 < 16
	MOV R0,#00H
	SJMP DISPLAY
NEXT:
	JB P3.2,DISPLAY
	ACALL DELAY
	JB P3.2,DISPLAY
	INC R0
	
	SJMP DISPLAY     
	SJMP $	
DELAY:
		MOV B,#100
DL0:	MOV R1,#0FAH ; 250*4 
DL1:
	NOP
	NOP
	DJNZ R1,DL1
	DJNZ B,DL0
	RET	
	ORG 0100H
TAB:
        DB      0C0H, 0F9H, 0A4H, 0B0H  ;0, 1, 2, 3
        DB       99H,  92H,  82H, 0F8H  ;4, 5, 6, 7
        DB       80H,  90H,  88H,  83H  ;8, 9, A, B
        DB      0C6H, 0A1H,  86H,  8EH  ;C, D, E, F	
	END