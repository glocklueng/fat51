#include "stm8s.h"
#include <iostm8s103.h>
//#include "main.h"

#define TIME_CONST	100

@near bool b1000Hz=0,b100Hz=0,b10Hz=0,b5Hz=0,b2Hz=0,b1Hz=0;
@near char t0_cnt0=0,t0_cnt1=0,t0_cnt2=0,t0_cnt3=0,t0_cnt4=0;
bool bFL5,bFL2,bFL1,bFL_;

@near bool bTIME_WRK=0;
@near signed short time_wrk_cnt,time_wrk_cnt_max=TIME_CONST;

@near enum {p1=0,p2,p3,p4,p5} program_stat=p4;
@near char port_temp;

const char program_steps_max[]={6/*p1*/,6/*p2*/,12/*p3*/,12/*p4*/,12/*p5*/}; 
const char program_repeat_max[]={10/*p1*/,10/*p2*/,5/*p3*/,5/*p4*/,5/*p5*/};

@near char program_steps;
@near char program_repeat;

#define MAX_PROGRAM_STAT	5

const char p1_const[]={	0b00000001,	//Бегущий огонь вперед
						0b00000010,
						0b00000100,
						0b00001000,
						0b00010000,
						0b00100000};
						
const char p2_const[]={	0b00100000,	//Бегущий огонь назад
						0b00010000,
						0b00001000,
						0b00000100,
						0b00000010,
						0b00000001};
						
const char p3_const[]={	0b00000001,	//Накапливающееся включение и гашение вперед
						0b00000011,
						0b00000111,
						0b00001111,
						0b00011111,
						0b00111111,
						0b00111110,
						0b00111100,
						0b00111000,
						0b00110000,
						0b00100000,
						0b00000000};
						
const char p4_const[]={	0b00100000,	//Накапливающееся включение и гашение назад
						0b00110000,
						0b00111000,
						0b00111100,
						0b00111110,
						0b00111111,
						0b00011111,
						0b00001111,
						0b00000111,
						0b00000011,
						0b00000001,
						0b00000000};

const char p5_const[]={	0b00000001,	//Гусеница вперед
						0b00000011,
						0b00000010,
						0b00000110,
						0b00000100,
						0b00001100,
						0b00001000,
						0b00011000,
						0b00010000,
						0b00110000,
						0b00100000,
						0b00100001};

//-----------------------------------------------
void time_wrk(void)
{
time_wrk_cnt++;
if(time_wrk_cnt>=time_wrk_cnt_max)
	{
	time_wrk_cnt=0;
	bTIME_WRK=1;
	}

}

//-----------------------------------------------
void wrk_hndl(void)
{
if(bTIME_WRK)
	{
	program_steps++;
	if(program_steps>=program_steps_max[program_stat])
		{
		program_steps=0;
		program_repeat++;
		if(program_repeat>=program_repeat_max[program_stat])
			{
			program_repeat=0;
			program_stat++;
			if(program_stat>=MAX_PROGRAM_STAT)program_stat=0;
			}
		}
	
	if(program_stat==p1)
		{
		port_temp=p1_const[program_steps];	
		}
	else if(program_stat==p2)
		{
		port_temp=p2_const[program_steps];	
		}
	else if(program_stat==p3)
		{
		port_temp=p3_const[program_steps];	
		}		
	else if(program_stat==p4)
		{
		port_temp=p4_const[program_steps];	
		}	
	else if(program_stat==p5)
		{
		port_temp=p5_const[program_steps];	
		}	
		
	GPIOD->ODR=port_temp;
	}
bTIME_WRK=0;
}

//-----------------------------------------------
void gpio_init(void)
{


GPIOD->DDR|=0xff;
GPIOD->CR1|=0xff;
GPIOD->CR2&=~0xff;


}

//-----------------------------------------------
void t4_init(void)
{
TIM4->PSCR = 7;
TIM4->ARR= 123;
TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt

TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
}

//***********************************************
//***********************************************
//***********************************************
//***********************************************
@far @interrupt void TIM4_UPD_Interrupt (void) 
{
b1000Hz=1;
if(++t0_cnt0>=10)
	{		
	t0_cnt0=0;
	b100Hz=1;

	if(++t0_cnt1>=10)
		{
		t0_cnt1=0;
		b10Hz=1;
		}
		
	if(++t0_cnt2>=20)
		{
		t0_cnt2=0;
		b5Hz=1;
		bFL5=!bFL5;
		}

	if(++t0_cnt3>=50)
		{
		t0_cnt3=0;
		b2Hz=1;
		bFL2=!bFL2;		
		}

	if(++t0_cnt4>=100)
		{
		t0_cnt4=0;
		b1Hz=1;
		bFL1=!bFL1;
		}
	}

TIM4->SR1&=~TIM4_SR1_UIF;			// disable break interrupt
return;
}
//***********************************************
@far @interrupt void TIM1_Ovf_Interrupt (void) 
{
//GPIOD->ODR^=(1<<3)|(1<<4);
TIM1->SR1&=~TIM1_SR1_UIF;			
}
//===============================================
//===============================================
//===============================================
//===============================================
main()
{
CLK->CKDIVR=0;
	
gpio_init();
	//_init();
	//t2_init();
	
FLASH_DUKR=0xae;
FLASH_DUKR=0x56;	


	
t4_init();
enableInterrupts();	
	
while (1)
	{
//GPIOD->ODR^=0xff;
	if(b1000Hz)
		{
		b1000Hz=0;
		time_wrk();
      	}  	
		
	if(b100Hz)
		{
		b100Hz=0;
		wrk_hndl();	
      	}  
      	
	if(b10Hz)
		{
		b10Hz=0;
			
      	}
      	 
	if(b5Hz)
		{
		b5Hz=0;
			
		}
		
	if(b2Hz)
		{
		b2Hz=0;
			
      	}      

	if(b1Hz)
		{
		b1Hz=0;
		//GPIOD->ODR^=0xff;	
		}      	     	      
	}
}