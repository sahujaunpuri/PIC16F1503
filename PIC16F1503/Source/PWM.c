#include"main.h"



void HOTPWM()
{
	TRISC3 = 1;
	PR2 = 124;
	PWM2CON = 0xE0;
	PWM2DCH = 0x7E;
	PWM2DCL = 0x00;
	TMR2 = 0;
	T2CON = 0x02;
	TMR2IF = 0;
	TRISC3 = 0;
	TMR2ON = 1;
}

void USBPWM()
{
	TRISC5 = 1;
	PR2 = 124;
	PWM1CON = 0xE0;
	PWM1DCH = 0x7E;
	PWM1DCL = 0x00;
	TMR2 = 0;
	T2CON = 0x02;
	TMR2IF = 0;
	TRISC5 = 0;
	TMR2ON = 1;
}
