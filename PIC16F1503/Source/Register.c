#include "main.h"


void Variates()//��ʼ������
{
	run.press_bit = 0;//���±�־
	run.sleep_bit = 0;//���߱�־
	run.power_bit = 0;//������־
	run.poweroff_bit = 0;//�ػ���־
	run.poweron_bit = 0;//������־
	run.key = 0;//���±�־
	run.smoke_bit = 0;//���̱�־
	run.overpress_bit = 0;//������ʱ
	run.warn_bit = 0;//�����־
	run.LEDB_bit = 0;//������
	run.show_bit = 0;//��������
	run.close_bit = 0;//�ɿ�Ϩ��
	run.USB_bit = 0;//����USB
	run.sec_bit = 0;//��ʱ��ʼ
	run.finish_bit = 0;//��ʱ���
	run.sec2_bit = 0;//PWM������ʱ
	run.HOT_bit = 0;//510�ӿڳ��
	run.finish1_bit = 0;//��ʱ�����
	run.wait_bit = 0;//��ʱ����·
	run.check1_bit = 0;//����·��־
	run.over_bit = 0;//
	run.finish2 = 0;//
	run.lock_bit = 0;
	run.complete = 0;

	
	Cnt.presstime = 0;//��������
	Cnt.Reload = 0xFFFF - (int)T1TIME+1;

	Cnt.warn = 0;//��������
	Cnt.Count = 0;//��ʱ����
	Cnt.xnum = 0;
	Cnt.keydn = 0;//��������
	Cnt.temp1 = 0;//����ʱ�����
	Cnt.temp2 = 0;//���̳�ʱ����
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



void Init()//��ʼ���Ĵ���
{
	TRISA = 0x0F;
	TRISC = 0x06;
	PORTA = 0x00;
	PORTC = 0x01;
	ANSELA = 0x02;
	ANSELC = 0x06;
	ADCON0 = 0x00;
	ADCON1 = 0x00;
	VREGCON = 0x03;//�͹�������ģʽ
	T1CON = 0x11;//2��Ƶ

	OSCCON = 0x72;//�ڲ�8Mʱ��
	
	INTCON = 0xC0;//�����ж�ʹ��
	TMR1L = (char)Cnt.Reload;
	TMR1H = (char)(Cnt.Reload>>8);
	TMR1IE = 1;//TMR1�����ж�
	TMR1ON = 1;




	

	
}


//////////////////////////////////////////////////	
//////			�жϷ������				//////
//////////////////////////////////////////////////

void interrupt itr()
{
	if(TMR1IE&&TMR1IF)//2.5s��ʱ����
	{
		TMR1IF = 0;
		TMR1L = (char)Cnt.Reload;
		TMR1H = (char)(Cnt.Reload>>8);

		if((run.press_bit==0)&&(++Cnt.Count>=2500))//˯�ߵ�����
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
			if(run.smoke_bit&&++Cnt.temp2>=12000)//���̳�ʱ����
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
			if(run.key&&(++Cnt.LEDtemp > 35))//deng��������
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
			if(!run.smoke_bit&&(++Cnt.LEDtemp > 15))//deng�������
			{
				if( Cnt.value_led > 0)
				{
					Cnt.value_led --;
				}
				else
					run.close_bit = 0;
				Cnt.LEDtemp = 0;
			}
			
			if(run.power_bit&&!run.warn_bit&&!run.poweroff_bit)//deng��������
			{
					Cnt.LEDcount ++ ;
				if( Cnt.LEDcount>= CNT_CYCLE_LED)
					Cnt.LEDcount = 1;
				if( Cnt.LEDcount < Cnt.value_led)
				{
					if(run.LEDB_bit)
					{
						LEDR  = 0;
						LEDB  = 1; //���ƽ���
					}
					else
					{
						LEDR  = 1; //��ƽ���
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

		
		if(run.sec_bit&&++Cnt.ChgCount>=2000)//��ʱ2�����PWM
		{
			Cnt.ChgCount = 0;
			run.finish_bit = 1;
		}
		if(run.finish1_bit&&++Cnt.Chgdelay1>=1500)//�ӳ�1.5������
		{
			run.finish1_bit = 0;
			Cnt.Chgdelay1 = 0;
		}

////////////////////////////////////////////////////////////////
	}
}


/////////////////////////////////////////////////////////////////

