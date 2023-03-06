#include<LPC17xx.h>

unsigned int i,j,c=0;
int main(void)
{
	SystemInit(); // Add these two function for its internal operaion
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0=0;
	LPC_GPIO0->FIODIR |= 0XFF;
	while(1)
	{
		for(i=0;i<256;i++){
			LPC_GPIO0->FIOCLR = 0xFF;
			LPC_GPIO0->FIOSET = i;
		  for(j=0;j<100000;j++);
		}
	}
}