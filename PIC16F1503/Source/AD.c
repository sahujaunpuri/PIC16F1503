#include "main.h"



#define ADGO_TIMES  8//采样次数




uint GetAD()
{
	uchar i=0,t = 0;
	uint SumADC  = 0;
	uint SumBuf[ADGO_TIMES];
	
	ADCON0bits.ADON = 1;
	NOP();NOP();NOP();
	NOP();NOP();NOP();

	for(i=0;i<ADGO_TIMES-0;i++)
	{
		ADCON0bits.GO= 1;
		while(ADCON0bits.GO) continue;
		SumBuf[i]=ADRESH*256 + ADRESL;
	}
	ADCON0bits.ADON = 0;

	for(i=1;i<ADGO_TIMES-0;i++)
	for(t=0;t<ADGO_TIMES-i;t++)
	{
		if (SumBuf[t+0] > SumBuf[t+1])
		{
			SumADC = SumBuf[t+0];
			SumBuf[t+0] = SumBuf[t+1];
			SumBuf[t+1] = SumADC;
		}
	}
	
	SumADC = 0;
	for(i=2;i<ADGO_TIMES-2;i++)
	{
		SumADC +=  SumBuf[i];
	}
	SumADC /= (ADGO_TIMES-4);
	
	return  SumADC;
}


uint GetHotV()
{
	uint H;
//	VRI = 1;
	ANSA0 = 1;
	ADCON0 = 0x00;
	ADCON1 = 0xA2;
	H = GetAD();
	ANSA0 = 0;
	return H;
}

uint GetBT()
{
	uint BT;
	ANSA1 = 1;
	ADCON0 = 0x04;
	ADCON1 = 0xA0;
	BT = GetAD();
	ANSA1 = 0;
	BT = 1048576/BT;//电源电压
	return BT;
}


uint GetIsense()
{
	uint I;
	IN199 = 1;
	ANSC1 = 1;
	ADCON0 = 0x14;
	ADCON1 = 0xA2;
	I = GetAD();
	ANSC1 = 0;
	return I;
}


uint GetUsbV()
{
	uint V;
	ANSA2 = 1;
	ADCON0 = 0x08;
	ADCON1 = 0xA2;
	V = GetAD();
	ANSA2 = 0;
	return V;
}

uint GetUsbI()
{
	uint V,I,BT;
	BT = GetBT();
	ANSC2 = 1;
	ADCON0 = 0x18;
	ADCON1 = 0xA2;
	V = GetAD();
	ANSC2 = 0;
	V = V*2;
	
	I = V - BT;
	return I;
}