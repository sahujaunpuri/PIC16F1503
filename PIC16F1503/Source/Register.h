#ifndef _REGISTER_H
#define _REGISTER_H


typedef unsigned char uchar;
typedef unsigned int uint;
typedef unsigned long ulong;



typedef struct
{
	uchar close_bit :1;
	uchar show_bit :1;
	uchar LEDB_bit :1;
	uchar warn_bit :1;
	uchar smoke_bit :1;
	uchar overpress_bit :1;
	uchar key :1;
	uchar poweroff_bit :1;
	uchar poweron_bit  :1;
	uchar power_bit :1;
	uchar press_bit	:1;
	uchar sleep_bit :1;
	uchar USB_bit :1;
	uchar sec_bit :1;
	uchar check_bit :1;
	uchar finish_bit :1;
	uchar sec2_bit :1;
	uchar HOT_bit :1;
	uchar finish1_bit :1;
	uchar wait_bit :1;
	uchar check1_bit :1;
	uchar smoke1_bit :1;
	uchar over_bit :1;
	uchar finish2 :1;
	uchar lock_bit :1;
	uchar complete :1;
}STATE;
extern STATE run;

typedef struct
{
	uint DelayTime;
	uchar LEDcount;
	uchar LEDtemp;
	uchar value_led;
	uchar warn;
	uchar keydn;
	uint xnum;
	uchar presstime;
	uint temp1;
	uint temp2;
	uint Reload;
	uint Count;
	uint ChgCount;
	uint Chgdelay;
	uint Check;
	uint Chgdelay1;
	uint waitCount;
}TIMES;
extern TIMES Cnt;



///////////////////////////////////////////
#define HOT_VOL 	RA0
#define VREF    	RA1
#define USB_VOL 	RA2
#define VRI     	RC0
#define LEDB    	RA5
#define LEDR    	RA4
#define SW			RA3
#define USB_PWM 	RC5
#define HOT_PWM 	RC3
#define USB_SENSE   RC2
#define I_SENSE	 	RC1
#define IN199		RC4

/////////////////////////////////////////////


#define T1TIME 		975/////975:1ms

#define CNT_CYCLE_LED   15


/////////////////////////////////////////////






void Variates();
void Init();
void delay(uint nms);
void powerInit_deal();

uint GetBT();
uint GetAD();
uint GetHotV();
uint GetIsense();
uint GetUsbV();
uint GetUsbI();



void USBPWM();
void HOTPWM();



#endif