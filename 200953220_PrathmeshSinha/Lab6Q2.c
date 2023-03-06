#include<LPC17xx.h>

int main(void) {
    unsigned char count = 255; // 8-bit counter
    char key; // input key
	  unsigned long LED_MASK=0xFF;
	  unsigned int i=0;
	  int j;
	  SystemInit(); // Add these two function for its internal operaion
	  SystemCoreClockUpdate();
	  LPC_PINCON->PINSEL0=0;
	  LPC_GPIO0->FIODIR = LED_MASK;
	  LPC_GPIO2->FIODIR = 0x0;
	  j=LPC_GPIO2->FIOPIN;
	    if (j&1<<12){
			  key = 'u';
			  count = 0;
      }
    while (1) { // infinite loop
			j=LPC_GPIO2->FIOPIN;
	    if (j&1<<12)key = 'u';
			else key = 'd';
			  LPC_GPIO0->FIOPIN = count & LED_MASK;
				for(i=0;i<100000;i++);
			  key == 'u'? count++ : count--;
    }
}