	AREA RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0x40001000   ;stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	
	ALIGN
	AREA mycode, CODE, READONLY	
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0,= VAL1
	LDR R1,= VAL2
	LDR R2,= RES
	MOV R3,#4
	MOV R4,#0
	MSR xPSR,R4
BACK LDR R4,[R0],#4
	LDR R5, [R1], #4
	ADCS R6,R4,R5
 	STR R6, [R2], #4
	SUB R3, #1
	TEQ R3, #0
	BNE BACK
	ADC R9,#0
	STR R9,[R2]
STOP B STOP
VAL1 DCD 0x92345678, 0x97654321, 0x98273645, 0x95362718
VAL2 DCD 0x95362718, 0x98273645, 0x97654321, 0x92345678
	AREA data, DATA, READWRITE
RES DCD 0,0,0,0,0
	END