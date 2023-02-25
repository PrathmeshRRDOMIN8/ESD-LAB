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
	LDR R0,=N1
	LDR R1,=N2
	LDR R3,[R0]
	LDR R4,[R1]
UP CMP R3,R4
	BEQ EXIT
	SUBHI R3,R4
	SUBLO R4,R3
	B UP
EXIT LDR R2,=RES
	STR R0,[R2]
STOP B STOP
N1 DCD 0x9
N2 DCD 0x3
	AREA data, DATA, READWRITE
RES DCD 0
	END