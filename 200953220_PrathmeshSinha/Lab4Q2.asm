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
	LDR R0,= num
	LDR R3,= res
	MOV R7, #0xA
	MOV R8, #0x1
	MOV R5, #0x0
	LDRB R1,[R0]
	AND R2,R1,#0xF
	MUL R5,R2,R8
	AND R4,R1,#0xF0
	LSR R4,#0x4
	MUL R6,R4,R7
	ADD R5,R6
	STR R5,[R3]
STOP B STOP
num DCD 0x64
	AREA data, DATA, READWRITE
res DCD 0
	END