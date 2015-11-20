#include "main.h"


void Variates()//初始化变量
{
	run.press_bit = 0;//按下标志
	run.sleep_bit = 0;//休眠标志
	run.power_bit = 0;//开机标志
	run.poweroff_bit = 0;//关机标志
	run.poweron_bit = 0;//开机标志
	run.key = 0;//按下标志
	run.smoke_bit = 0;//吸烟标志
	run.overpress_bit = 0;//按键超时
	run.warn_bit = 0;//警告标志
	run.LEDB_bit = 0;//蓝灯亮
	run.show_bit = 0;//按下亮灯
	run.close_bit = 0;//松开熄灯
	run.USB_bit = 0;//插入USB
	run.sec_bit = 0;//计时开始
	run.finish_bit = 0;//计时完成
	run.sec2_bit = 0;//PWM调整延时
	run.HOT_bit = 0;//510接口充电
	run.finish1_bit = 0;//延时检测充电
	run.wait_bit = 0;//延时检测短路
	run.check1_bit = 0;//检测短路标志
	run.over_bit = 0;//
	run.finish2 = 0;//
	run.lock_bit = 0;
	run.complete = 0;

	
	Cnt.presstime = 0;//按键消抖
	Cnt.Reload = 0xFFFF - (int)T1TIME+1;

	Cnt.warn = 0;//警告类型
	Cnt.Count = 0;//延时计数
	Cnt.xnum = 0;
	Cnt.keydn = 0;//按键次数
	Cnt.temp1 = 0;//按键时间计数
	Cnt.temp2 = 0;//吸烟超时计数
	Cnt.LEDcount = 0;
	Cnt.LEDtemp = 0;
	Cnt.ChgCount = 0;
	Cnt.Chgdelay = 0;
	Cnt.Check = 0;
	Cnt.Chgdelay1 = 0;
	Cnt.waitCount = 0;
	Cnt.value_led = 0;
	Cnt.DelayTime = 0;
}



void Init()//初始化寄存器
{
	TRISA = 0x0F;
	TRISC = 0x06;
	PORTA = 0x00;
	PORTC = 0x01;
	ANSELA = 0x02;
	ANSELC = 0x06;
	ADCON0 = 0x00;
	ADCON1 = 0x00;
	VREGCON = 0x03;//低功耗休眠模式
	T1CON = 0x11;//2分频

	OSCCON = 0x72;//内部8M时钟
	
	INTCON = 0xC0;//外设中断使能
	TMR1L = (char)Cnt.Reload;
	TMR1H = (char)(Cnt.Reload>>8);
	TMR1IE = 1;//TMR1允许中断
	TMR1ON = 1;




	

	
}


//////////////////////////////////////////////////	
//////			中断服务程序				//////
//////////////////////////////////////////////////

void interrupt itr()
{
	if(TMR1IE&&TMR1IF)//2.5s定时休眠
	{
		TMR1IF = 0;
		TMR1L = (char)Cnt.Reload;
		TMR1H = (char)(Cnt.Reload>>8);

		if((run.press_bit==0)&&(++Cnt.Count>=2500))//睡眠倒计数
		{
			run.sleep_bit = 1;
			Cnt.Count = 0;
		}
		if(!run.smoke_bit&&++Cnt.DelayTime > 450)//0.45S
		{
				Cnt.DelayTime = 0;
				Cnt.keydn = 0;
		}


////////////////////////////////////////////////////////////////
			if(run.smoke_bit&&++Cnt.temp2>=12000)//吸烟超时计数
			{
				run.warn_bit = 1;
				Cnt.warn = 1;
				Cnt.temp2 = 0;
			}
			else if(!run.press_bit)
			{
				Cnt.temp2 = 0;
			}

///////////////////////////////////////////////////////////////
			if(run.key&&(++Cnt.LEDtemp > 35))//deng渐亮计数
			{
				if( Cnt.value_led < 50)
				{
					Cnt.value_led ++;
				}
				else
					run.show_bit = 0;
				Cnt.LEDtemp = 0;
			}
			else
			if(!run.smoke_bit&&(++Cnt.LEDtemp > 15))//deng渐灭计数
			{
				if( Cnt.value_led > 0)
				{
					Cnt.value_led --;
				}
				else
					run.close_bit = 0;
				Cnt.LEDtemp = 0;
			}
			
			if(run.power_bit&&!run.warn_bit&&!run.poweroff_bit)//deng渐亮渐灭
			{
					Cnt.LEDcount ++ ;
				if( Cnt.LEDcount>= CNT_CYCLE_LED)
					Cnt.LEDcount = 1;
				if( Cnt.LEDcount < Cnt.value_led)
				{
					if(run.LEDB_bit)
					{
						LEDR  = 0;
						LEDB  = 1; //蓝灯渐亮
					}
					else
					{
						LEDR  = 1; //红灯渐亮
						LEDB  = 0;
					}
				}
				else
				{
					LEDR = 0;
					LEDB = 0;
				}
			}

////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////

		
		if(run.sec_bit&&++Cnt.ChgCount>=2000)//计时2秒调整PWM
		{
			Cnt.ChgCount = 0;
			run.finish_bit = 1;
		}
		if(run.finish1_bit&&++Cnt.Chgdelay1>=1500)//延迟1.5秒检测充电
		{
			run.finish1_bit = 0;
			Cnt.Chgdelay1 = 0;
		}

////////////////////////////////////////////////////////////////
	}
}


/////////////////////////////////////////////////////////////////

