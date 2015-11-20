#include "main.h"


__CONFIG(0x3994);
__CONFIG(0x1DFF);

STATE run;
TIMES Cnt;


void delay(uint nms)
{
	uchar t = 0;
	uint i;
	for(i=0;i<nms;i++)
		for(t=0;t<250;t++);
}

uint TempVAD;
void sleep_deal();
void key_deal();
void powerInit_deal();
void power();
void smoke_deal();
void warn_deal();
void BTpower();
void charge_deal();


void main()
{
	Variates();
	Init();
	powerInit_deal();
	while(1)
	{
		CLRWDT();
		sleep_deal();
		key_deal();
		smoke_deal();
		warn_deal();
		charge_deal();
	}	
}



void powerInit_deal()
{
	uchar i = 0;
	LEDR = 0;
	LEDB = 0;
	for(i=0;i<6;i++)
	{
		CLRWDT();
	
		LEDR=~LEDR;
		LEDB=~LEDB;	
		delay(200);
	}
	Cnt.Count = 0;
	run.power_bit = 1;
	while(!SW)
		CLRWDT();
}

void sleep_deal()//2.5s不动作进入休眠模式
{
	if(run.sleep_bit)
	{
		INTCON = 0x08;
		TMR1IE = 0;
		TMR1ON = 0;
		TRISC5 = 1;
		TRISC3 = 1;
		PORTA  = 0x00;
		PORTC  = 0x00;
		IOCAF  = 0x00;
		IOCAP  = 0x0D;
		IOCAN  = 0x08;
		NOP();NOP();
		SLEEP();
		NOP();NOP();

		IOCAF  = 0x00;
		IOCAP  = 0x00;
		IOCAN  = 0x00;
		CLRWDT();
		TRISC5 = 0;
		TRISC3 = 0;
		VRI = 1;
		INTCON = 0xC0;
		TMR1IE = 1;
		TMR1ON = 1;
		Cnt.Count = 0;
		run.sleep_bit = 0;
	}
}


void key_deal()//按键放电
{
	if(SW==0)
	{
		Cnt.DelayTime = 0;
		if(run.press_bit==0&&++Cnt.presstime>=99)
		{
			run.key = 1;
			Cnt.presstime = 0;
			run.press_bit = 1;
			if(run.power_bit)
			{
				run.wait_bit = 1;
				run.check1_bit = 0;
			}
			Cnt.keydn++;
		}
		if(Cnt.keydn>=3)
		{
			Cnt.keydn = 0;
			if(run.power_bit)
			{
				run.poweroff_bit = 1;
				power();
			}
			else
			{
				run.poweron_bit = 1;
				power();
			}
		}
		if(run.power_bit&&run.press_bit)
		{
			Cnt.Count = 0;
		}	
	}
	if(SW)
	{	
		run.lock_bit = 0;
		run.press_bit = 0;
		run.wait_bit = 0;
		run.show_bit = 0;
		if(run.smoke_bit)
		{
			run.finish1_bit = 1;
			run.close_bit = 1;
			HOT_PWM = 0;
			run.check1_bit = 0;
			Cnt.Chgdelay1 = 0;
		}
		run.key = 0;
		HOT_PWM = 0;
		
		run.smoke_bit = 0;
	}
}


void power()//开关机
{
	uchar i = 0;
	if(run.poweron_bit)
	{
		LEDR = 0;
		LEDB = 0;
		for(i=0;i<6;i++)
		{
			CLRWDT();

			LEDR=~LEDR;
			LEDB=~LEDB;	
			delay(200);
		}
		Cnt.Count = 0;
		Cnt.value_led = 0;
		run.poweron_bit = 0;
		run.power_bit = 1;
	}
	if(run.poweroff_bit)
	{
		LEDR = 0;
		LEDB = 0;
		for(i=0;i<6;i++)
		{
			CLRWDT();
		
			LEDR=~LEDR;
			LEDB=~LEDB;	
			delay(200);
		}
		Cnt.Count = 0;
		run.smoke_bit= 0;
		Cnt.value_led = 0;
		run.poweroff_bit = 0;
		run.power_bit = 0;
		run.sleep_bit = 1;
	}
}


void smoke_deal()
{
	if(run.power_bit&&run.press_bit)
	{
		if(!run.lock_bit)
		{
		
			run.show_bit = 1;
			run.smoke_bit = 1;
			run.lock_bit = 1;
			BTpower();
			HOT_PWM = 1;
			delay(10);
		}
		if(GetHotV()<532)
		{
			HOT_PWM = 0;
			run.warn_bit = 1;
			Cnt.warn = 3;
			return;
		}
	}
}




void warn_deal()
{
	if(run.warn_bit)
	{
		uchar i;
		uchar num;
		LEDB = 0;
		LEDR = 0;
		HOT_PWM = 0;
		switch(Cnt.warn)
		{
			case 1:num = 10;break;
			case 2:num = 16;break;
			case 3:num = 6;break;
		}
		for(i=0;i<num;i++)
		{
			CLRWDT();
			delay(200);
			if(Cnt.warn==1)
			{
				if(run.LEDB_bit)
					LEDB = ~LEDB;
				else
					LEDR = ~LEDR;
			}
			else
			{
				LEDR=~LEDR;
				LEDB=~LEDB;
			}	
		}
		LEDR = 0;
		LEDB = 0;
		run.finish1_bit = 1;
		run.check1_bit = 0;
		Cnt.value_led = 0;
		run.smoke_bit = 0;
		run.key = 0;
		run.warn_bit = 0;
		while(!SW)
		{
			CLRWDT();
			HOT_PWM = 0;
		}
	}
}

void BTpower()
{
	TempVAD = GetBT();
	if(TempVAD<1228)
	{
		run.warn_bit = 1;
		Cnt.warn = 2;
		run.LEDB_bit = 0;
		return;
	}
	if(TempVAD>1556)
	{
		run.LEDB_bit = 1;
	}
	else
	{
		run.LEDB_bit = 0;
	}
}



void charge_deal()
{
	if(!run.press_bit&&!run.finish1_bit)
	{
		uchar i;
		if(HOT_VOL||USB_VOL)
		{
			if(!run.USB_bit&&!run.HOT_bit)
			{
				VRI = 1;
				run.power_bit = 0;
				LEDR = 0;
				LEDB = 0;
				if(USB_VOL)
				{
					USBPWM();
					run.USB_bit = 1;
				}
				else
				{
					HOTPWM();
					run.HOT_bit = 1;
				}
				for(i=0;i<6;i++)
				{
					Cnt.Count = 0;
					CLRWDT();
					delay(200);
					LEDR=~LEDR;
					LEDB=~LEDB;	
				}
				uint BT;
				BT = GetBT();
				if(BT<1556)
				{
					Cnt.Count = 0;
					LEDB = 0;
					LEDR = 1;
				}
				else
				{
					Cnt.Count = 0;
					LEDR = 0;
					LEDB = 1;
				}
				Cnt.Count = 0;
				run.sec_bit = 1;
				run.sec2_bit = 1;
			}
			while(1)
			{
				CLRWDT();
				Cnt.Count = 0;
			
				if(run.finish_bit)
				{
					if(!run.over_bit)
					{
						uint I;		
						if(run.USB_bit)
						{
							PWM1CON = 0x00;
							delay(20);
							USB_PWM = 1;
							delay(20);
							I = GetUsbI();
							if(I>=286)
							{
								PWM1DCH = 0x3E;
								PWM1DCL = 0x00;
								PWM1CON = 0xE0;
							}
							else
							{
								run.over_bit = 1;
							}
						}
						if(run.HOT_bit)
						{
							PWM2CON = 0x00;
							delay(20);
							HOT_PWM = 1;
							delay(20);
							I = GetIsense();
							if(I>=200)
							{
								PWM2DCH = 0x5D;
								PWM2DCL = 0x00;
								PWM2CON = 0xE0;

							}
							else
							{
								run.over_bit = 1;
							}
						}
					}
					if(run.USB_bit)
					{
						PWM1CON = 0x00;
						USB_PWM = 0;
					}
					if(run.HOT_bit)
					{
						PWM2CON = 0x00;
						HOT_PWM = 0;
					}
					delay(100);

					if(run.HOT_bit&&GetBT()>=2007)//1753)//2031)
					{
						run.complete = 1;
					}
					if(run.USB_bit&&GetBT()>=1966)
					{
						run.complete = 1;
					}		
					if(run.complete)
					{
						uchar i;
						run.complete = 0;
						Cnt.Count = 0;
						run.over_bit = 0;
						run.finish_bit = 0;
						Cnt.ChgCount = 0;
						run.sec_bit = 0;
						LEDR = 0;
						LEDB = 0;
						for(i=0;i<42;i++)
						{
							Cnt.Count = 0;
							CLRWDT();
							delay(150);
							LEDB=~LEDB;	
						}
						LEDB = 0;
						run.HOT_bit = 0;
						run.USB_bit = 0;
						run.power_bit = 1;
						run.sleep_bit = 1;
						Cnt.Count = 0;
						PWM1CON = 0x00;
						PWM2CON = 0x00;
						HOT_PWM = 0;
						USB_PWM = 0;
						return;
					}
					if(GetBT()<1556)
					{
						LEDB = 0;
						LEDR = 1;
					}
					else
					{
						LEDR = 0;
						LEDB = 1;
					}
					if(!HOT_VOL&&!USB_VOL)
					{
						break;
					}
					if(run.USB_bit)
					{
						if(run.over_bit)
							USB_PWM = 1;
						else
							PWM1CON = 0xE0;
					}
					if(run.HOT_bit)
					{
						if(run.over_bit)
							HOT_PWM = 1;
						else
							PWM2CON = 0xE0;
					}
					run.finish_bit = 0;
				}
			}
			run.wait_bit = 0;
			run.over_bit = 0;
			run.finish_bit = 0;
			Cnt.ChgCount = 0;
			run.USB_bit = 0;
			run.HOT_bit = 0;
			run.complete = 0;
			run.power_bit = 1;
			run.sec_bit = 0;
			PWM1CON = 0x00;
			PWM2CON = 0x00;
			HOT_PWM = 0;
			USB_PWM = 0;
		}
	}
}




/////////////////////////////////////////////////////////
