#include<LPC17xx.h>
unsigned int i,j;
//unsigned long LED = 0x00000010;
int main(void){
	SystemInit(); // Add these two function for its internal operaion
	SystemCoreClockUpdate();
	//LPC_PINCON->PINSEL0 &= 0xFF0000FF;
	//LPC_GPIO0->FIODIR |= 0x00000FF0;
	//while(1){
		//LED = 0x00000010;
		//for(i = 1; i<9; i++){
			//LPC_GPIO0->FIOSET = LED;// Turn ON LED at LSB
			//for(j=0; j<10000;j++)
			//LED<<=1; // Shift the LED to the left by one
		//}
	//LED = 0x00000010;
  //for(i = 1; i<9; i++){
  //LPC_GPIO0->FIOCLR = LED;
  //for(j=0; j<10000; j++)
  //LED <<=1;
	//}
	LPC_PINCON->PINSEL0=0;
	LPC_GPIO0->FIODIR=0xFF0;
	while(1){
    LPC_GPIO0->FIOSET = 0xFF0;
	  for(j=0; j<10000; j++);
		LPC_GPIO0->FIOCLR = 0xFF0;
		for(j=0; j<10000; j++);
  }
	
}