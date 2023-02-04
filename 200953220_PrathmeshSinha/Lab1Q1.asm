	AREA RESET , DATA , READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10000100
	DCD Reset_Handler
	ALIGN
	AREA MyCode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0, = Src
	LDR R1, = Dst
	
	LDR R2, [R0,#12]
	LDR R3, [R0,#8]
	LDR R4, [R0,#4]
	LDR R5, [R0]
	
	STR R2, [R1]
	STR R3, [R1,#4]
	STR R4, [R1,#8]
	STR R5, [R1,#12]
	
STOP B STOP
Src DCD	0x78563412,0x12345678,0x18273645,0xABCDEF12
	AREA MyData, DATA, READWRITE
Dst DCD 0,0,0,0
	END	