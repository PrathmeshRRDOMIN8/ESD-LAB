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
	LDR R0,=Hex
	LDR R0,[R0]
	
	LDR R8,=res
	LDR R8,[R8]
	
	MOV R3,#0xA
	MOV R6,#0x0
	
	CMP R0,#0xA
	BLO EXIT
BACK BL DIVIDE
	CMP R0,#0xA
EXIT BHS BACK
STOP B STOP
Hex DCD 0xA1
DIVIDE MOV R4,#0x0
UP CMP R0,R3
	BLO NEXT
	SUB R0,R3
	ADD R4,#0x1
	B UP
NEXT LSL R0,R6
	ORR R5,R0
	ADD R6,#0x4
	MOV R0,R4
	BX LR
	AREA data, DATA, READWRITE
res DCD 0
	END