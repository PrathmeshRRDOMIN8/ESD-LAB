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
	LDRB R1,[R0]; load hex number into R1 only last two digits from LSB
	AND R2,R1,#0x0F ; mask LSB 4 bits for eg. 0x000000F2 , we get 0x00000002 in R2, to get a digit at a time.
	CMP R2,#09; compare with digit 9
	BLO DOWN; if it is lower than 9
	ADD R2,#0x7; else add 37 to that number
DOWN ADD R2,#0x30 ; add 30H to the number
	STRB R2,[R3],#4
	AND R4, R1, #0xF0
	LSR R4,#4
	CMP R4, #0x09
	BLO DOWN1
	ADD R4, #0x7
DOWN1 ADD R4, #0x30
	STRB R4,[R3]
STOP B STOP
num DCD 0x3A
	AREA data, DATA, READWRITE
res DCD 0
	END