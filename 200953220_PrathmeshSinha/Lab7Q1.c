#include<LPC17xx.h>
unsigned char seven_segment[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};
long int i;
long int j;
long int n;
long int k;
long int onesecflag = 0;
int number = 0;
int count;
int main(){
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 = 0;
	LPC_PINCON->PINSEL3 = 0;
	LPC_GPIO0->FIODIR = 0xFF0;
	LPC_GPIO1->FIODIR = 0xF<<23;
	while(1){
		k = LPC_GPIO2->FIOPIN;
		n= number;
		if(onesecflag ==1){
		  onesecflag = 0;
			number = LPC_GPIO2->FIOPIN & 1 ? (number+1)%10000 : (number-1)%10000;
		}
		for(i = 0; i<4; i++){
				LPC_GPIO1->FIOPIN = i<<23;
			LPC_GPIO0->FIOPIN = seven_segment[n%10]<<4;
			n=n/10;
			for(j=0;j<500;j++);
			if(count==1000){
					onesecflag =1;
					count=0;
      }
			else count++;
	}
}
}