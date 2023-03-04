	AREA RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10000000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0, =SRC; Reading input
	MOV R3, #40 ; Counter as 40
	MOV R9, #0 ; R9 = i;
	SUB R4,R3,#4
OUTER CMP R9,R4 ; if(i<n-1)
	BHI EXIT
	MOV R8,R9 ; R8 = min_index
	ADD R7,R9,#4 ; R7 = j, j=i+1
INNER CMP R7,R3
	 BHI SWAP
	 LDR R10, [R0,R7]
	 LDR R11, [R0,R8]
	 CMP R10,R11
	 ADDHI R7,#4
	 BHI INNER
	 MOV R8,R7
	 ADD R7,#4
	 B INNER
SWAP LDR R5,[R0,R8]
	LDR R6, [R0,R9]
	STR R6,[R0,R8]
	STR R5,[R0,R9]
    ADD R9,#4
	B OUTER
EXIT
STOP B STOP		
	AREA DATASEG, DATA, READWRITE
SRC DCD 0,0,0,0,0,0,0,0,0,0
	END