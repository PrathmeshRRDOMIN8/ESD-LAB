	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x10000100  ;stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA mycode, CODE, READONLY	
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0,= VAL
	LDR R3,= RES
	LDR R1,[R0]
	MLA R2,R1,R1,R1
	ADD R2,#0x1
	ASR R2,#0x1
	STR R2,[R3]
STOP B STOP
VAL DCD 0xB
	AREA data, DATA, READWRITE
RES DCD 0
	END