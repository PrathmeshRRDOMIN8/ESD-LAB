#include<LPC17xx.h>

unsigned int flag,row,j,col,x;
unsigned char seven_seg[4][4] = {{0x3F,0x6,0x5B,0x4F},{0x66,0x6D,0x7D,0x07},{0x7F,0x6F,0x77,0x7C},{0x39,0x5E,0x79,0x71}};
int main(void)
{
	SystemInit();
	SystemCoreClockUpdate();
	
	LPC_PINCON->PINSEL0=0;
	LPC_PINCON->PINSEL1=0;
	LPC_PINCON->PINSEL3=0;
	LPC_PINCON->PINSEL4=0;
	
	LPC_GPIO0->FIODIR=0x78FF0;
	LPC_GPIO1->FIODIR=0x0;
	LPC_GPIO2->FIODIR=0xF<<10;
	
	while(1)
	{
		
		for(row=0;row<4;row++)
		{
			LPC_GPIO2->FIOPIN=1<<(10+row);
			flag =0;
			x=LPC_GPIO1->FIOPIN & 0xF<<23;
			if(x)
			{
				flag=1;
				if(x==1<<23)
					col=0;
				else if(x==1<<24)
					col=1;
				else if(x==1<<25)
					col=2;
				else if(x==1<<26)
					col=3;
			}
				LPC_GPIO0->FIOPIN=0;
				if(flag==1)
				{
					LPC_GPIO0->FIOMASK=0xFFFFF00F;
					LPC_GPIO0->FIOPIN=seven_seg[row][col]<<4;
					for(j=0;j<10000;j++)
					break;
				}
		}
	}
}

