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
	MOV R3,#4
	LDR R0,=Src
	LDR R2,=Dst
BACK LDR R1,[R0], #4
	STR R1, [R2], #4
	SUBS R3, #1
	BNE BACK ;z=0
STOP B STOP
	AREA MyData, DATA, READWRITE
Src DCD	0x11111111
Dst DCD 0,0,0,0
	END