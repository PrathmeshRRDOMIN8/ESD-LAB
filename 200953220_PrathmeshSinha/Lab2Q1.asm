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
	MOV R4,#10
	MOV R5,#0
	MOV R6,#0
	LDR R2,= SRC
	LDR R9,= RES
BACK LDR R1,[R2],#4
	ADDS R5,R1
	ADC R6, #0
	SUBS R4, #1
	BNE BACK
	STR R5,[R9], #4
	STR R6,[R9]
STOP B STOP
SRC DCD 0xFFFFFFFF,0x4,0x6,0x8,0x10,0xFFFFFFFF,0x14,0x16,0x18,0x20
	AREA data, DATA, READWRITE
RES DCD 0,0
	END

	