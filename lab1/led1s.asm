PUBLIC _DELAY1S
DE SEGMENT CODE
RSEG DE
_DELAY1S:	NOP

DELAY1S:
		MOV B,#64H
DL1S:	MOV R0,#0AH
DL01S:	MOV R1,#0FAH
DL11S:
	NOP
	NOP
	DJNZ R1,DL11S
	DJNZ R0,DL01S
	DJNZ B,DL1S
	DJNZ R7,DELAY1S
EXIT:		RET
		END
