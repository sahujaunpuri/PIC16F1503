opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F1503
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
# 4 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	dw 0x3994 ;#
# 5 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 5 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	dw 0x1DFF ;#
	FNCALL	_main,_Variates
	FNCALL	_main,_Init
	FNCALL	_main,_powerInit_deal
	FNCALL	_main,_sleep_deal
	FNCALL	_main,_key_deal
	FNCALL	_main,_smoke_deal
	FNCALL	_main,_warn_deal
	FNCALL	_main,_charge_deal
	FNCALL	_charge_deal,_USBPWM
	FNCALL	_charge_deal,_HOTPWM
	FNCALL	_charge_deal,_delay
	FNCALL	_charge_deal,_GetBT
	FNCALL	_charge_deal,_GetUsbI
	FNCALL	_charge_deal,_GetIsense
	FNCALL	_smoke_deal,_BTpower
	FNCALL	_smoke_deal,_delay
	FNCALL	_smoke_deal,_GetHotV
	FNCALL	_BTpower,_GetBT
	FNCALL	_GetUsbI,_GetBT
	FNCALL	_GetUsbI,_GetAD
	FNCALL	_key_deal,_power
	FNCALL	_GetIsense,_GetAD
	FNCALL	_GetBT,_GetAD
	FNCALL	_GetBT,___aldiv
	FNCALL	_GetHotV,_GetAD
	FNCALL	_power,_delay
	FNCALL	_warn_deal,_delay
	FNCALL	_powerInit_deal,_delay
	FNROOT	_main
	FNCALL	intlevel1,_itr
	global	intlevel1
	FNROOT	intlevel1
	global	_Cnt
	global	_run
	global	_TempVAD
	global	_INTCON
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
_INTCON	set	11
	global	_PORTA
_PORTA	set	12
	global	_PORTC
_PORTC	set	14
	global	_PR2
_PR2	set	27
	global	_T1CON
_T1CON	set	24
	global	_T2CON
_T2CON	set	28
	global	_TMR1H
_TMR1H	set	23
	global	_TMR1L
_TMR1L	set	22
	global	_TMR2
_TMR2	set	26
	global	_RA0
_RA0	set	96
	global	_RA2
_RA2	set	98
	global	_RA3
_RA3	set	99
	global	_RA4
_RA4	set	100
	global	_RA5
_RA5	set	101
	global	_RC0
_RC0	set	112
	global	_RC3
_RC3	set	115
	global	_RC4
_RC4	set	116
	global	_RC5
_RC5	set	117
	global	_TMR1IF
_TMR1IF	set	136
	global	_TMR1ON
_TMR1ON	set	192
	global	_TMR2IF
_TMR2IF	set	137
	global	_TMR2ON
_TMR2ON	set	226
	global	_ADCON0
_ADCON0	set	157
	global	_ADCON0bits
_ADCON0bits	set	157
	global	_ADCON1
_ADCON1	set	158
	global	_ADRESH
_ADRESH	set	156
	global	_ADRESL
_ADRESL	set	155
	global	_OSCCON
_OSCCON	set	153
	global	_TRISA
_TRISA	set	140
	global	_TRISC
_TRISC	set	142
	global	_TMR1IE
_TMR1IE	set	1160
	global	_TRISC3
_TRISC3	set	1139
	global	_TRISC5
_TRISC5	set	1141
	global	_ANSELA
_ANSELA	set	396
	global	_ANSELC
_ANSELC	set	398
	global	_VREGCON
_VREGCON	set	407
	global	_ANSA0
_ANSA0	set	3168
	global	_ANSA1
_ANSA1	set	3169
	global	_ANSC1
_ANSC1	set	3185
	global	_ANSC2
_ANSC2	set	3186
	global	_IOCAF
_IOCAF	set	915
	global	_IOCAN
_IOCAN	set	914
	global	_IOCAP
_IOCAP	set	913
	global	_PWM1CON
_PWM1CON	set	1555
	global	_PWM1DCH
_PWM1DCH	set	1554
	global	_PWM1DCL
_PWM1DCL	set	1553
	global	_PWM2CON
_PWM2CON	set	1558
	global	_PWM2DCH
_PWM2DCH	set	1557
	global	_PWM2DCL
_PWM2DCL	set	1556
	file	"TPS-050040BCA-00_A-SV101.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_Cnt:
       ds      28

_run:
       ds      4

_TempVAD:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR0 containing the base address, and
;	WREG with the size to clear
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf0		;clear RAM location pointed to by FSR
	addfsr	0,1
	decfsz wreg		;Have we reached the end of clearing yet?
	goto clrloop	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	022h
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Variates
?_Variates:	; 0 bytes @ 0x0
	global	??_Variates
??_Variates:	; 0 bytes @ 0x0
	global	?_Init
?_Init:	; 0 bytes @ 0x0
	global	??_Init
??_Init:	; 0 bytes @ 0x0
	global	?_powerInit_deal
?_powerInit_deal:	; 0 bytes @ 0x0
	global	?_sleep_deal
?_sleep_deal:	; 0 bytes @ 0x0
	global	??_sleep_deal
??_sleep_deal:	; 0 bytes @ 0x0
	global	?_key_deal
?_key_deal:	; 0 bytes @ 0x0
	global	?_smoke_deal
?_smoke_deal:	; 0 bytes @ 0x0
	global	?_warn_deal
?_warn_deal:	; 0 bytes @ 0x0
	global	?_charge_deal
?_charge_deal:	; 0 bytes @ 0x0
	global	?_power
?_power:	; 0 bytes @ 0x0
	global	?_BTpower
?_BTpower:	; 0 bytes @ 0x0
	global	?_USBPWM
?_USBPWM:	; 0 bytes @ 0x0
	global	??_USBPWM
??_USBPWM:	; 0 bytes @ 0x0
	global	?_HOTPWM
?_HOTPWM:	; 0 bytes @ 0x0
	global	??_HOTPWM
??_HOTPWM:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_itr
?_itr:	; 0 bytes @ 0x0
	global	??_itr
??_itr:	; 0 bytes @ 0x0
	global	?_GetAD
?_GetAD:	; 2 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	delay@nms
delay@nms:	; 2 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	2
	global	??_GetAD
??_GetAD:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	delay@i
delay@i:	; 2 bytes @ 0x2
	ds	2
	global	delay@t
delay@t:	; 1 bytes @ 0x4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	??_powerInit_deal
??_powerInit_deal:	; 0 bytes @ 0x5
	global	??_warn_deal
??_warn_deal:	; 0 bytes @ 0x5
	global	??_power
??_power:	; 0 bytes @ 0x5
	global	powerInit_deal@i
powerInit_deal@i:	; 1 bytes @ 0x5
	global	power@i
power@i:	; 1 bytes @ 0x5
	global	warn_deal@i
warn_deal@i:	; 1 bytes @ 0x5
	ds	1
	global	??_key_deal
??_key_deal:	; 0 bytes @ 0x6
	global	?_GetHotV
?_GetHotV:	; 2 bytes @ 0x6
	global	?_GetIsense
?_GetIsense:	; 2 bytes @ 0x6
	global	warn_deal@num
warn_deal@num:	; 1 bytes @ 0x6
	ds	2
	global	??_GetHotV
??_GetHotV:	; 0 bytes @ 0x8
	global	??_GetIsense
??_GetIsense:	; 0 bytes @ 0x8
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x8
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x8
	global	GetHotV@H
GetHotV@H:	; 2 bytes @ 0x8
	global	GetIsense@I
GetIsense@I:	; 2 bytes @ 0x8
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x9
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xA
	ds	4
	global	??_smoke_deal
??_smoke_deal:	; 0 bytes @ 0xE
	global	??_charge_deal
??_charge_deal:	; 0 bytes @ 0xE
	global	??_BTpower
??_BTpower:	; 0 bytes @ 0xE
	global	??_GetBT
??_GetBT:	; 0 bytes @ 0xE
	global	??_GetUsbI
??_GetUsbI:	; 0 bytes @ 0xE
	global	??_main
??_main:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	GetAD@SumBuf
GetAD@SumBuf:	; 16 bytes @ 0x0
	ds	16
	global	GetAD@SumADC
GetAD@SumADC:	; 2 bytes @ 0x10
	ds	2
	global	GetAD@t
GetAD@t:	; 1 bytes @ 0x12
	ds	1
	global	GetAD@i
GetAD@i:	; 1 bytes @ 0x13
	ds	1
	global	?_GetBT
?_GetBT:	; 2 bytes @ 0x14
	ds	2
	global	GetBT@BT
GetBT@BT:	; 2 bytes @ 0x16
	ds	2
	global	?_GetUsbI
?_GetUsbI:	; 2 bytes @ 0x18
	ds	2
	global	GetUsbI@BT
GetUsbI@BT:	; 2 bytes @ 0x1A
	ds	2
	global	GetUsbI@V
GetUsbI@V:	; 2 bytes @ 0x1C
	ds	2
	global	GetUsbI@I
GetUsbI@I:	; 2 bytes @ 0x1E
	ds	2
	global	charge_deal@BT
charge_deal@BT:	; 2 bytes @ 0x20
	ds	2
	global	charge_deal@I
charge_deal@I:	; 2 bytes @ 0x22
	ds	2
	global	charge_deal@i
charge_deal@i:	; 1 bytes @ 0x24
	ds	1
	global	charge_deal@i_5379
charge_deal@i_5379:	; 1 bytes @ 0x25
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 34, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     38      72
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_GetUsbI	unsigned int  size(1) Largest target is 0
;;
;; ?_GetIsense	unsigned int  size(1) Largest target is 0
;;
;; ?_GetBT	unsigned int  size(1) Largest target is 2
;;		 -> GetBT@BT(BANK0[2]), 
;;
;; ?___aldiv	long  size(1) Largest target is 0
;;
;; ?_GetHotV	unsigned int  size(1) Largest target is 0
;;
;; ?_GetAD	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _key_deal->_power
;;   _GetIsense->_GetAD
;;   _GetBT->___aldiv
;;   _GetHotV->_GetAD
;;   _power->_delay
;;   _warn_deal->_delay
;;   _powerInit_deal->_delay
;;
;; Critical Paths under _itr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_charge_deal
;;   _charge_deal->_GetUsbI
;;   _BTpower->_GetBT
;;   _GetUsbI->_GetBT
;;   _GetIsense->_GetAD
;;   _GetBT->_GetAD
;;   _GetHotV->_GetAD
;;
;; Critical Paths under _itr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _itr in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    5558
;;                           _Variates
;;                               _Init
;;                     _powerInit_deal
;;                         _sleep_deal
;;                           _key_deal
;;                         _smoke_deal
;;                          _warn_deal
;;                        _charge_deal
;; ---------------------------------------------------------------------------------
;; (1) _charge_deal                                          6     6      0    3432
;;                                             32 BANK0      6     6      0
;;                             _USBPWM
;;                             _HOTPWM
;;                              _delay
;;                              _GetBT
;;                            _GetUsbI
;;                          _GetIsense
;; ---------------------------------------------------------------------------------
;; (1) _smoke_deal                                           0     0      0    1658
;;                            _BTpower
;;                              _delay
;;                            _GetHotV
;; ---------------------------------------------------------------------------------
;; (2) _BTpower                                              0     0      0     944
;;                              _GetBT
;; ---------------------------------------------------------------------------------
;; (2) _GetUsbI                                              8     6      2    1613
;;                                             24 BANK0      8     6      2
;;                              _GetBT
;;                              _GetAD
;; ---------------------------------------------------------------------------------
;; (1) _key_deal                                             0     0      0     186
;;                              _power
;; ---------------------------------------------------------------------------------
;; (2) _GetIsense                                            4     2      2     621
;;                                              6 COMMON     4     2      2
;;                              _GetAD
;; ---------------------------------------------------------------------------------
;; (3) _GetBT                                                4     2      2     944
;;                                             20 BANK0      4     2      2
;;                              _GetAD
;;                            ___aldiv
;; ---------------------------------------------------------------------------------
;; (2) _GetHotV                                              4     2      2     621
;;                                              6 COMMON     4     2      2
;;                              _GetAD
;; ---------------------------------------------------------------------------------
;; (2) _power                                                1     1      0     186
;;                                              5 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _warn_deal                                            2     2      0     142
;;                                              5 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _sleep_deal                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _powerInit_deal                                       1     1      0     140
;;                                              5 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _GetAD                                               26    24      2     598
;;                                              0 COMMON     6     4      2
;;                                              0 BANK0     20    20      0
;; ---------------------------------------------------------------------------------
;; (4) ___aldiv                                             14     6      8     300
;;                                              0 COMMON    14     6      8
;; ---------------------------------------------------------------------------------
;; (2) _HOTPWM                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _USBPWM                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Variates                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                5     3      2      93
;;                                              0 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _itr                                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Variates
;;   _Init
;;   _powerInit_deal
;;     _delay
;;   _sleep_deal
;;   _key_deal
;;     _power
;;       _delay
;;   _smoke_deal
;;     _BTpower
;;       _GetBT
;;         _GetAD
;;         ___aldiv
;;     _delay
;;     _GetHotV
;;       _GetAD
;;   _warn_deal
;;     _delay
;;   _charge_deal
;;     _USBPWM
;;     _HOTPWM
;;     _delay
;;     _GetBT
;;       _GetAD
;;       ___aldiv
;;     _GetUsbI
;;       _GetBT
;;         _GetAD
;;         ___aldiv
;;       _GetAD
;;     _GetIsense
;;       _GetAD
;;
;; _itr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM              70      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      E       E       2      100.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       4       3        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;ABS                  0      0      56       4        0.0%
;;BITBANK0            50      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0               50     26      48       6       90.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BANK1               20      0       0       8        0.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;DATA                 0      0      5A       9        0.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 31 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Variates
;;		_Init
;;		_powerInit_deal
;;		_sleep_deal
;;		_key_deal
;;		_smoke_deal
;;		_warn_deal
;;		_charge_deal
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	31
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 11
; Regs used in _main: [wreg-status,0+pclath+cstack]
	line	32
	
l8397:	
;main.c: 32: Variates();
	fcall	_Variates
	line	33
;main.c: 33: Init();
	fcall	_Init
	line	34
;main.c: 34: powerInit_deal();
	fcall	_powerInit_deal
	line	37
	
l8399:	
# 37 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	maintext
	line	38
;main.c: 38: sleep_deal();
	fcall	_sleep_deal
	line	39
;main.c: 39: key_deal();
	fcall	_key_deal
	line	40
	
l8401:	
;main.c: 40: smoke_deal();
	fcall	_smoke_deal
	line	41
	
l8403:	
;main.c: 41: warn_deal();
	fcall	_warn_deal
	line	42
	
l8405:	
;main.c: 42: charge_deal();
	fcall	_charge_deal
	goto	l8399
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	44
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_charge_deal
psect	text472,local,class=CODE,delta=2
global __ptext472
__ptext472:

;; *************** function _charge_deal *****************
;; Defined at:
;;		line 299 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   37[BANK0 ] unsigned char 
;;  I               2   34[BANK0 ] unsigned int 
;;  BT              2   32[BANK0 ] unsigned int 
;;  i               1   36[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       6       0
;;      Temps:          0       0       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_USBPWM
;;		_HOTPWM
;;		_delay
;;		_GetBT
;;		_GetUsbI
;;		_GetIsense
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text472
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	299
	global	__size_of_charge_deal
	__size_of_charge_deal	equ	__end_of_charge_deal-_charge_deal
	
_charge_deal:	
	opt	stack 11
; Regs used in _charge_deal: [wreg+fsr1l-status,0+pclath+cstack]
	line	300
	
l8193:	
;main.c: 300: if(!run.press_bit&&!run.finish1_bit)
	btfsc	0+(_run)+01h,2
	goto	u1671
	goto	u1670
u1671:
	goto	l3261
u1670:
	
l8195:	
	btfsc	0+(_run)+02h,2
	goto	u1681
	goto	u1680
u1681:
	goto	l3261
u1680:
	line	303
	
l8197:	
;main.c: 301: {
;main.c: 302: uchar i;
;main.c: 303: if(RA0||RA2)
	btfsc	(96/8),(96)&7
	goto	u1691
	goto	u1690
u1691:
	goto	l3237
u1690:
	
l8199:	
	btfss	(98/8),(98)&7
	goto	u1701
	goto	u1700
u1701:
	goto	l3261
u1700:
	
l3237:	
	line	305
;main.c: 304: {
;main.c: 305: if(!run.USB_bit&&!run.HOT_bit)
	btfsc	0+(_run)+01h,4
	goto	u1711
	goto	u1710
u1711:
	goto	l8253
u1710:
	
l8201:	
	btfsc	0+(_run)+02h,1
	goto	u1721
	goto	u1720
u1721:
	goto	l8253
u1720:
	line	307
	
l8203:	
;main.c: 306: {
;main.c: 307: RC0 = 1;
	bsf	(112/8),(112)&7
	line	308
;main.c: 308: run.power_bit = 0;
	bcf	0+(_run)+01h,1
	line	309
;main.c: 309: RA4 = 0;
	bcf	(100/8),(100)&7
	line	310
;main.c: 310: RA5 = 0;
	bcf	(101/8),(101)&7
	line	311
;main.c: 311: if(RA2)
	btfss	(98/8),(98)&7
	goto	u1731
	goto	u1730
u1731:
	goto	l8209
u1730:
	line	313
	
l8205:	
;main.c: 312: {
;main.c: 313: USBPWM();
	fcall	_USBPWM
	line	314
	
l8207:	
;main.c: 314: run.USB_bit = 1;
	bsf	0+(_run)+01h,4
	line	315
;main.c: 315: }
	goto	l8213
	line	318
	
l8209:	
;main.c: 316: else
;main.c: 317: {
;main.c: 318: HOTPWM();
	fcall	_HOTPWM
	line	319
	
l8211:	
;main.c: 319: run.HOT_bit = 1;
	bsf	0+(_run)+02h,1
	line	321
	
l8213:	
;main.c: 320: }
;main.c: 321: for(i=0;i<6;i++)
	clrf	(charge_deal@i)
	line	323
	
l8219:	
;main.c: 322: {
;main.c: 323: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	324
	
l8221:	
# 324 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text472
	line	325
	
l8223:	
;main.c: 325: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	326
	
l8225:	
;main.c: 326: RA4=~RA4;
	movlw	1<<((100)&7)
	movlb 0	; select bank0
	xorwf	((100)/8),f
	line	327
	
l8227:	
;main.c: 327: RA5=~RA5;
	movlw	1<<((101)&7)
	xorwf	((101)/8),f
	line	321
	
l8229:	
	incf	(charge_deal@i),f
	
l8231:	
	movlw	(06h)
	subwf	(charge_deal@i),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l8219
u1740:
	line	330
	
l8233:	
;main.c: 328: }
;main.c: 329: uint BT;
;main.c: 330: BT = GetBT();
	fcall	_GetBT
	movf	(1+(?_GetBT)),w
	movwf	(charge_deal@BT+1)
	movf	(0+(?_GetBT)),w
	movwf	(charge_deal@BT)
	line	331
	
l8235:	
;main.c: 331: if(BT<1556)
	movlw	high(0614h)
	subwf	(charge_deal@BT+1),w
	movlw	low(0614h)
	skipnz
	subwf	(charge_deal@BT),w
	skipnc
	goto	u1751
	goto	u1750
u1751:
	goto	l8243
u1750:
	line	333
	
l8237:	
;main.c: 332: {
;main.c: 333: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	334
	
l8239:	
;main.c: 334: RA5 = 0;
	bcf	(101/8),(101)&7
	line	335
	
l8241:	
;main.c: 335: RA4 = 1;
	bsf	(100/8),(100)&7
	line	336
;main.c: 336: }
	goto	l3244
	line	339
	
l8243:	
;main.c: 337: else
;main.c: 338: {
;main.c: 339: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	340
	
l8245:	
;main.c: 340: RA4 = 0;
	bcf	(100/8),(100)&7
	line	341
	
l8247:	
;main.c: 341: RA5 = 1;
	bsf	(101/8),(101)&7
	line	342
	
l3244:	
	line	343
;main.c: 342: }
;main.c: 343: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	344
	
l8249:	
;main.c: 344: run.sec_bit = 1;
	bsf	0+(_run)+01h,5
	line	345
	
l8251:	
;main.c: 345: run.sec2_bit = 1;
	bsf	0+(_run)+02h,0
	line	349
	
l8253:	
# 349 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text472
	line	350
;main.c: 350: Cnt.Count = 0;
	movlb 0	; select bank0
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	352
	
l8255:	
;main.c: 352: if(run.finish_bit)
	btfss	0+(_run)+01h,7
	goto	u1761
	goto	u1760
u1761:
	goto	l8253
u1760:
	line	354
	
l8257:	
;main.c: 353: {
;main.c: 354: if(!run.over_bit)
	btfsc	0+(_run)+02h,6
	goto	u1771
	goto	u1770
u1771:
	goto	l3247
u1770:
	line	357
	
l8259:	
;main.c: 355: {
;main.c: 356: uint I;
;main.c: 357: if(run.USB_bit)
	btfss	0+(_run)+01h,4
	goto	u1781
	goto	u1780
u1781:
	goto	l3248
u1780:
	line	359
	
l8261:	
;main.c: 358: {
;main.c: 359: PWM1CON = 0x00;
	movlb 12	; select bank12
	clrf	(1555)^0600h	;volatile
	line	360
	
l8263:	
;main.c: 360: delay(20);
	movlw	014h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	361
	
l8265:	
;main.c: 361: RC5 = 1;
	movlb 0	; select bank0
	bsf	(117/8),(117)&7
	line	362
	
l8267:	
;main.c: 362: delay(20);
	movlw	014h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	363
	
l8269:	
;main.c: 363: I = GetUsbI();
	fcall	_GetUsbI
	movf	(1+(?_GetUsbI)),w
	movwf	(charge_deal@I+1)
	movf	(0+(?_GetUsbI)),w
	movwf	(charge_deal@I)
	line	364
	
l8271:	
;main.c: 364: if(I>=286)
	movlw	high(011Eh)
	subwf	(charge_deal@I+1),w
	movlw	low(011Eh)
	skipnz
	subwf	(charge_deal@I),w
	skipc
	goto	u1791
	goto	u1790
u1791:
	goto	l3249
u1790:
	line	366
	
l8273:	
;main.c: 365: {
;main.c: 366: PWM1DCH = 0x3E;
	movlw	(03Eh)
	movlb 12	; select bank12
	movwf	(1554)^0600h	;volatile
	line	367
	
l8275:	
;main.c: 367: PWM1DCL = 0x00;
	clrf	(1553)^0600h	;volatile
	line	368
	
l8277:	
;main.c: 368: PWM1CON = 0xE0;
	movlw	(0E0h)
	movwf	(1555)^0600h	;volatile
	line	369
;main.c: 369: }
	goto	l3248
	line	370
	
l3249:	
	line	372
;main.c: 370: else
;main.c: 371: {
;main.c: 372: run.over_bit = 1;
	bsf	0+(_run)+02h,6
	line	374
	
l3248:	
	line	375
;main.c: 373: }
;main.c: 374: }
;main.c: 375: if(run.HOT_bit)
	movlb 0	; select bank0
	btfss	0+(_run)+02h,1
	goto	u1801
	goto	u1800
u1801:
	goto	l3247
u1800:
	line	377
	
l8279:	
;main.c: 376: {
;main.c: 377: PWM2CON = 0x00;
	movlb 12	; select bank12
	clrf	(1558)^0600h	;volatile
	line	378
	
l8281:	
;main.c: 378: delay(20);
	movlw	014h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	379
	
l8283:	
;main.c: 379: RC3 = 1;
	movlb 0	; select bank0
	bsf	(115/8),(115)&7
	line	380
	
l8285:	
;main.c: 380: delay(20);
	movlw	014h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	381
	
l8287:	
;main.c: 381: I = GetIsense();
	fcall	_GetIsense
	movf	(1+(?_GetIsense)),w
	movlb 0	; select bank0
	movwf	(charge_deal@I+1)
	movf	(0+(?_GetIsense)),w
	movwf	(charge_deal@I)
	line	382
	
l8289:	
;main.c: 382: if(I>=200)
	movlw	high(0C8h)
	subwf	(charge_deal@I+1),w
	movlw	low(0C8h)
	skipnz
	subwf	(charge_deal@I),w
	skipc
	goto	u1811
	goto	u1810
u1811:
	goto	l3252
u1810:
	line	384
	
l8291:	
;main.c: 383: {
;main.c: 384: PWM2DCH = 0x5D;
	movlw	(05Dh)
	movlb 12	; select bank12
	movwf	(1557)^0600h	;volatile
	line	385
	
l8293:	
;main.c: 385: PWM2DCL = 0x00;
	clrf	(1556)^0600h	;volatile
	line	386
	
l8295:	
;main.c: 386: PWM2CON = 0xE0;
	movlw	(0E0h)
	movwf	(1558)^0600h	;volatile
	line	388
;main.c: 388: }
	goto	l3247
	line	389
	
l3252:	
	line	391
;main.c: 389: else
;main.c: 390: {
;main.c: 391: run.over_bit = 1;
	bsf	0+(_run)+02h,6
	line	394
	
l3247:	
	line	395
;main.c: 392: }
;main.c: 393: }
;main.c: 394: }
;main.c: 395: if(run.USB_bit)
	movlb 0	; select bank0
	btfss	0+(_run)+01h,4
	goto	u1821
	goto	u1820
u1821:
	goto	l8301
u1820:
	line	397
	
l8297:	
;main.c: 396: {
;main.c: 397: PWM1CON = 0x00;
	movlb 12	; select bank12
	clrf	(1555)^0600h	;volatile
	line	398
	
l8299:	
;main.c: 398: RC5 = 0;
	movlb 0	; select bank0
	bcf	(117/8),(117)&7
	line	400
	
l8301:	
;main.c: 399: }
;main.c: 400: if(run.HOT_bit)
	btfss	0+(_run)+02h,1
	goto	u1831
	goto	u1830
u1831:
	goto	l8307
u1830:
	line	402
	
l8303:	
;main.c: 401: {
;main.c: 402: PWM2CON = 0x00;
	movlb 12	; select bank12
	clrf	(1558)^0600h	;volatile
	line	403
	
l8305:	
;main.c: 403: RC3 = 0;
	movlb 0	; select bank0
	bcf	(115/8),(115)&7
	line	405
	
l8307:	
;main.c: 404: }
;main.c: 405: delay(100);
	movlw	064h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	407
	
l8309:	
;main.c: 407: if(run.HOT_bit&&GetBT()>=2007)
	btfss	0+(_run)+02h,1
	goto	u1841
	goto	u1840
u1841:
	goto	l3256
u1840:
	
l8311:	
	fcall	_GetBT
	movlw	high(07D7h)
	subwf	(1+(?_GetBT)),w
	movlw	low(07D7h)
	skipnz
	subwf	(0+(?_GetBT)),w
	skipc
	goto	u1851
	goto	u1850
u1851:
	goto	l3256
u1850:
	line	409
	
l8313:	
;main.c: 408: {
;main.c: 409: run.complete = 1;
	bsf	0+(_run)+03h,1
	line	410
	
l3256:	
	line	411
;main.c: 410: }
;main.c: 411: if(run.USB_bit&&GetBT()>=1966)
	btfss	0+(_run)+01h,4
	goto	u1861
	goto	u1860
u1861:
	goto	l3257
u1860:
	
l8315:	
	fcall	_GetBT
	movlw	high(07AEh)
	subwf	(1+(?_GetBT)),w
	movlw	low(07AEh)
	skipnz
	subwf	(0+(?_GetBT)),w
	skipc
	goto	u1871
	goto	u1870
u1871:
	goto	l3257
u1870:
	line	413
	
l8317:	
;main.c: 412: {
;main.c: 413: run.complete = 1;
	bsf	0+(_run)+03h,1
	line	414
	
l3257:	
	line	415
;main.c: 414: }
;main.c: 415: if(run.complete)
	btfss	0+(_run)+03h,1
	goto	u1881
	goto	u1880
u1881:
	goto	l8357
u1880:
	line	418
	
l8319:	
;main.c: 416: {
;main.c: 417: uchar i;
;main.c: 418: run.complete = 0;
	bcf	0+(_run)+03h,1
	line	419
	
l8321:	
;main.c: 419: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	420
	
l8323:	
;main.c: 420: run.over_bit = 0;
	bcf	0+(_run)+02h,6
	line	421
	
l8325:	
;main.c: 421: run.finish_bit = 0;
	bcf	0+(_run)+01h,7
	line	422
;main.c: 422: Cnt.ChgCount = 0;
	clrf	0+(_Cnt)+012h
	clrf	1+(_Cnt)+012h
	line	423
	
l8327:	
;main.c: 423: run.sec_bit = 0;
	bcf	0+(_run)+01h,5
	line	424
	
l8329:	
;main.c: 424: RA4 = 0;
	bcf	(100/8),(100)&7
	line	425
	
l8331:	
;main.c: 425: RA5 = 0;
	bcf	(101/8),(101)&7
	line	426
;main.c: 426: for(i=0;i<42;i++)
	clrf	(charge_deal@i_5379)
	line	428
	
l8337:	
;main.c: 427: {
;main.c: 428: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	429
	
l8339:	
# 429 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text472
	line	430
	
l8341:	
;main.c: 430: delay(150);
	movlw	096h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	431
	
l8343:	
;main.c: 431: RA5=~RA5;
	movlw	1<<((101)&7)
	movlb 0	; select bank0
	xorwf	((101)/8),f
	line	426
	
l8345:	
	incf	(charge_deal@i_5379),f
	
l8347:	
	movlw	(02Ah)
	subwf	(charge_deal@i_5379),w
	skipc
	goto	u1891
	goto	u1890
u1891:
	goto	l8337
u1890:
	
l3260:	
	line	433
;main.c: 432: }
;main.c: 433: RA5 = 0;
	bcf	(101/8),(101)&7
	line	434
;main.c: 434: run.HOT_bit = 0;
	bcf	0+(_run)+02h,1
	line	435
;main.c: 435: run.USB_bit = 0;
	bcf	0+(_run)+01h,4
	line	436
;main.c: 436: run.power_bit = 1;
	bsf	0+(_run)+01h,1
	line	437
;main.c: 437: run.sleep_bit = 1;
	bsf	0+(_run)+01h,3
	line	438
	
l8349:	
;main.c: 438: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	439
;main.c: 439: PWM1CON = 0x00;
	movlb 12	; select bank12
	clrf	(1555)^0600h	;volatile
	line	440
;main.c: 440: PWM2CON = 0x00;
	clrf	(1558)^0600h	;volatile
	line	441
	
l8351:	
;main.c: 441: RC3 = 0;
	movlb 0	; select bank0
	bcf	(115/8),(115)&7
	line	442
	
l8353:	
;main.c: 442: RC5 = 0;
	bcf	(117/8),(117)&7
	goto	l3261
	line	445
	
l8357:	
;main.c: 444: }
;main.c: 445: if(GetBT()<1556)
	fcall	_GetBT
	movlw	high(0614h)
	subwf	(1+(?_GetBT)),w
	movlw	low(0614h)
	skipnz
	subwf	(0+(?_GetBT)),w
	skipnc
	goto	u1901
	goto	u1900
u1901:
	goto	l3262
u1900:
	line	447
	
l8359:	
;main.c: 446: {
;main.c: 447: RA5 = 0;
	bcf	(101/8),(101)&7
	line	448
;main.c: 448: RA4 = 1;
	bsf	(100/8),(100)&7
	line	449
;main.c: 449: }
	goto	l3263
	line	450
	
l3262:	
	line	452
;main.c: 450: else
;main.c: 451: {
;main.c: 452: RA4 = 0;
	bcf	(100/8),(100)&7
	line	453
;main.c: 453: RA5 = 1;
	bsf	(101/8),(101)&7
	line	454
	
l3263:	
	line	455
;main.c: 454: }
;main.c: 455: if(!RA0&&!RA2)
	btfsc	(96/8),(96)&7
	goto	u1911
	goto	u1910
u1911:
	goto	l3264
u1910:
	
l8361:	
	btfsc	(98/8),(98)&7
	goto	u1921
	goto	u1920
u1921:
	goto	l3264
u1920:
	goto	l3265
	line	458
	
l3264:	
	line	459
;main.c: 458: }
;main.c: 459: if(run.USB_bit)
	btfss	0+(_run)+01h,4
	goto	u1931
	goto	u1930
u1931:
	goto	l8371
u1930:
	line	461
	
l8365:	
;main.c: 460: {
;main.c: 461: if(run.over_bit)
	btfss	0+(_run)+02h,6
	goto	u1941
	goto	u1940
u1941:
	goto	l8369
u1940:
	line	462
	
l8367:	
;main.c: 462: RC5 = 1;
	bsf	(117/8),(117)&7
	goto	l8371
	line	464
	
l8369:	
;main.c: 463: else
;main.c: 464: PWM1CON = 0xE0;
	movlw	(0E0h)
	movlb 12	; select bank12
	movwf	(1555)^0600h	;volatile
	line	466
	
l8371:	
;main.c: 465: }
;main.c: 466: if(run.HOT_bit)
	movlb 0	; select bank0
	btfss	0+(_run)+02h,1
	goto	u1951
	goto	u1950
u1951:
	goto	l8379
u1950:
	line	468
	
l8373:	
;main.c: 467: {
;main.c: 468: if(run.over_bit)
	btfss	0+(_run)+02h,6
	goto	u1961
	goto	u1960
u1961:
	goto	l8377
u1960:
	line	469
	
l8375:	
;main.c: 469: RC3 = 1;
	bsf	(115/8),(115)&7
	goto	l8379
	line	471
	
l8377:	
;main.c: 470: else
;main.c: 471: PWM2CON = 0xE0;
	movlw	(0E0h)
	movlb 12	; select bank12
	movwf	(1558)^0600h	;volatile
	line	473
	
l8379:	
;main.c: 472: }
;main.c: 473: run.finish_bit = 0;
	movlb 0	; select bank0
	bcf	0+(_run)+01h,7
	goto	l8253
	line	347
	
l3265:	
	line	476
;main.c: 474: }
;main.c: 475: }
;main.c: 476: run.wait_bit = 0;
	bcf	0+(_run)+02h,3
	line	477
;main.c: 477: run.over_bit = 0;
	bcf	0+(_run)+02h,6
	line	478
;main.c: 478: run.finish_bit = 0;
	bcf	0+(_run)+01h,7
	line	479
	
l8381:	
;main.c: 479: Cnt.ChgCount = 0;
	clrf	0+(_Cnt)+012h
	clrf	1+(_Cnt)+012h
	line	480
	
l8383:	
;main.c: 480: run.USB_bit = 0;
	bcf	0+(_run)+01h,4
	line	481
	
l8385:	
;main.c: 481: run.HOT_bit = 0;
	bcf	0+(_run)+02h,1
	line	482
	
l8387:	
;main.c: 482: run.complete = 0;
	bcf	0+(_run)+03h,1
	line	483
	
l8389:	
;main.c: 483: run.power_bit = 1;
	bsf	0+(_run)+01h,1
	line	484
	
l8391:	
;main.c: 484: run.sec_bit = 0;
	bcf	0+(_run)+01h,5
	line	485
;main.c: 485: PWM1CON = 0x00;
	movlb 12	; select bank12
	clrf	(1555)^0600h	;volatile
	line	486
;main.c: 486: PWM2CON = 0x00;
	clrf	(1558)^0600h	;volatile
	goto	l8351
	line	491
	
l3261:	
	return
	opt stack 0
GLOBAL	__end_of_charge_deal
	__end_of_charge_deal:
;; =============== function _charge_deal ends ============

	signat	_charge_deal,88
	global	_smoke_deal
psect	text473,local,class=CODE,delta=2
global __ptext473
__ptext473:

;; *************** function _smoke_deal *****************
;; Defined at:
;;		line 202 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1C/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_BTpower
;;		_delay
;;		_GetHotV
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text473
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	202
	global	__size_of_smoke_deal
	__size_of_smoke_deal	equ	__end_of_smoke_deal-_smoke_deal
	
_smoke_deal:	
	opt	stack 11
; Regs used in _smoke_deal: [wreg+fsr1l-status,0+pclath+cstack]
	line	203
	
l8171:	
;main.c: 203: if(run.power_bit&&run.press_bit)
	btfss	0+(_run)+01h,1
	goto	u1631
	goto	u1630
u1631:
	goto	l3206
u1630:
	
l8173:	
	btfss	0+(_run)+01h,2
	goto	u1641
	goto	u1640
u1641:
	goto	l3206
u1640:
	line	205
	
l8175:	
;main.c: 204: {
;main.c: 205: if(!run.lock_bit)
	btfsc	0+(_run)+03h,0
	goto	u1651
	goto	u1650
u1651:
	goto	l8185
u1650:
	line	208
	
l8177:	
;main.c: 206: {
;main.c: 208: run.show_bit = 1;
	bsf	(_run),1
	line	209
;main.c: 209: run.smoke_bit = 1;
	bsf	(_run),4
	line	210
;main.c: 210: run.lock_bit = 1;
	bsf	0+(_run)+03h,0
	line	211
	
l8179:	
;main.c: 211: BTpower();
	fcall	_BTpower
	line	212
	
l8181:	
;main.c: 212: RC3 = 1;
	bsf	(115/8),(115)&7
	line	213
	
l8183:	
;main.c: 213: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	215
	
l8185:	
;main.c: 214: }
;main.c: 215: if(GetHotV()<532)
	fcall	_GetHotV
	movlw	high(0214h)
	subwf	(1+(?_GetHotV)),w
	movlw	low(0214h)
	skipnz
	subwf	(0+(?_GetHotV)),w
	skipnc
	goto	u1661
	goto	u1660
u1661:
	goto	l3206
u1660:
	line	217
	
l8187:	
;main.c: 216: {
;main.c: 217: RC3 = 0;
	movlb 0	; select bank0
	bcf	(115/8),(115)&7
	line	218
;main.c: 218: run.warn_bit = 1;
	bsf	(_run),3
	line	219
	
l8189:	
;main.c: 219: Cnt.warn = 3;
	movlw	(03h)
	movwf	0+(_Cnt)+05h
	line	223
	
l3206:	
	return
	opt stack 0
GLOBAL	__end_of_smoke_deal
	__end_of_smoke_deal:
;; =============== function _smoke_deal ends ============

	signat	_smoke_deal,88
	global	_BTpower
psect	text474,local,class=CODE,delta=2
global __ptext474
__ptext474:

;; *************** function _BTpower *****************
;; Defined at:
;;		line 277 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_GetBT
;; This function is called by:
;;		_smoke_deal
;; This function uses a non-reentrant model
;;
psect	text474
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	277
	global	__size_of_BTpower
	__size_of_BTpower	equ	__end_of_BTpower-_BTpower
	
_BTpower:	
	opt	stack 11
; Regs used in _BTpower: [wreg+fsr1l-status,0+pclath+cstack]
	line	278
	
l8155:	
;main.c: 278: TempVAD = GetBT();
	fcall	_GetBT
	movf	(1+(?_GetBT)),w
	movwf	(_TempVAD+1)
	movf	(0+(?_GetBT)),w
	movwf	(_TempVAD)
	line	279
	
l8157:	
;main.c: 279: if(TempVAD<1228)
	movlw	high(04CCh)
	subwf	(_TempVAD+1),w
	movlw	low(04CCh)
	skipnz
	subwf	(_TempVAD),w
	skipnc
	goto	u1611
	goto	u1610
u1611:
	goto	l8167
u1610:
	line	281
	
l8159:	
;main.c: 280: {
;main.c: 281: run.warn_bit = 1;
	bsf	(_run),3
	line	282
	
l8161:	
;main.c: 282: Cnt.warn = 2;
	movlw	(02h)
	movwf	0+(_Cnt)+05h
	line	283
	
l8163:	
;main.c: 283: run.LEDB_bit = 0;
	bcf	(_run),2
	goto	l3229
	line	286
	
l8167:	
;main.c: 285: }
;main.c: 286: if(TempVAD>1556)
	movlw	high(0615h)
	subwf	(_TempVAD+1),w
	movlw	low(0615h)
	skipnz
	subwf	(_TempVAD),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l8163
u1620:
	line	288
	
l8169:	
;main.c: 287: {
;main.c: 288: run.LEDB_bit = 1;
	bsf	(_run),2
	line	294
;main.c: 289: }
	
l3229:	
	return
	opt stack 0
GLOBAL	__end_of_BTpower
	__end_of_BTpower:
;; =============== function _BTpower ends ============

	signat	_BTpower,88
	global	_GetUsbI
psect	text475,local,class=CODE,delta=2
global __ptext475
__ptext475:

;; *************** function _GetUsbI *****************
;; Defined at:
;;		line 100 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  I               2   30[BANK0 ] unsigned int 
;;  V               2   28[BANK0 ] unsigned int 
;;  BT              2   26[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   24[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       6       0
;;      Temps:          0       0       0
;;      Totals:         0       8       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_GetBT
;;		_GetAD
;; This function is called by:
;;		_charge_deal
;; This function uses a non-reentrant model
;;
psect	text475
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
	line	100
	global	__size_of_GetUsbI
	__size_of_GetUsbI	equ	__end_of_GetUsbI-_GetUsbI
	
_GetUsbI:	
	opt	stack 11
; Regs used in _GetUsbI: [wreg+fsr1l-status,0+pclath+cstack]
	line	102
	
l8135:	
;AD.c: 101: uint V,I,BT;
;AD.c: 102: BT = GetBT();
	fcall	_GetBT
	movf	(1+(?_GetBT)),w
	movwf	(GetUsbI@BT+1)
	movf	(0+(?_GetBT)),w
	movwf	(GetUsbI@BT)
	line	103
	
l8137:	
;AD.c: 103: ANSC2 = 1;
	movlb 3	; select bank3
	bsf	(3186/8)^0180h,(3186)&7
	line	104
	
l8139:	
;AD.c: 104: ADCON0 = 0x18;
	movlw	(018h)
	movlb 1	; select bank1
	movwf	(157)^080h	;volatile
	line	105
	
l8141:	
;AD.c: 105: ADCON1 = 0xA2;
	movlw	(0A2h)
	movwf	(158)^080h	;volatile
	line	106
;AD.c: 106: V = GetAD();
	fcall	_GetAD
	movf	(1+(?_GetAD)),w
	movwf	(GetUsbI@V+1)
	movf	(0+(?_GetAD)),w
	movwf	(GetUsbI@V)
	line	107
	
l8143:	
;AD.c: 107: ANSC2 = 0;
	movlb 3	; select bank3
	bcf	(3186/8)^0180h,(3186)&7
	line	108
	
l8145:	
;AD.c: 108: V = V*2;
	movlb 0	; select bank0
	lslf	(GetUsbI@V),f
	rlf	(GetUsbI@V+1),f
	line	110
	
l8147:	
;AD.c: 110: I = V - BT;
	movf	(GetUsbI@V+1),w
	movwf	(GetUsbI@I+1)
	movf	(GetUsbI@V),w
	movwf	(GetUsbI@I)
	
l8149:	
	movf	(GetUsbI@BT),w
	subwf	(GetUsbI@I),f
	movf	(GetUsbI@BT+1),w
	subwfb	(GetUsbI@I+1),f
	line	111
	
l8151:	
;AD.c: 111: return I;
	movf	(GetUsbI@I+1),w
	movwf	(?_GetUsbI+1)
	movf	(GetUsbI@I),w
	movwf	(?_GetUsbI)
	line	112
	
l1573:	
	return
	opt stack 0
GLOBAL	__end_of_GetUsbI
	__end_of_GetUsbI:
;; =============== function _GetUsbI ends ============

	signat	_GetUsbI,90
	global	_key_deal
psect	text476,local,class=CODE,delta=2
global __ptext476
__ptext476:

;; *************** function _key_deal *****************
;; Defined at:
;;		line 102 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_power
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text476
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	102
	global	__size_of_key_deal
	__size_of_key_deal	equ	__end_of_key_deal-_key_deal
	
_key_deal:	
	opt	stack 12
; Regs used in _key_deal: [wreg+status,2+status,0+pclath+cstack]
	line	103
	
l8083:	
;main.c: 103: if(RA3==0)
	btfsc	(99/8),(99)&7
	goto	u1511
	goto	u1510
u1511:
	goto	l8121
u1510:
	line	105
	
l8085:	
;main.c: 104: {
;main.c: 105: Cnt.DelayTime = 0;
	clrf	(_Cnt)
	clrf	(_Cnt+1)
	line	106
	
l8087:	
;main.c: 106: if(run.press_bit==0&&++Cnt.presstime>=99)
	btfsc	0+(_run)+01h,2
	goto	u1521
	goto	u1520
u1521:
	goto	l8103
u1520:
	
l8089:	
	movlw	(063h)
	incf	0+(_Cnt)+09h,f
	subwf	(0+(_Cnt)+09h),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l8103
u1530:
	line	108
	
l8091:	
;main.c: 107: {
;main.c: 108: run.key = 1;
	bsf	(_run),6
	line	109
	
l8093:	
;main.c: 109: Cnt.presstime = 0;
	clrf	0+(_Cnt)+09h
	line	110
	
l8095:	
;main.c: 110: run.press_bit = 1;
	bsf	0+(_run)+01h,2
	line	111
	
l8097:	
;main.c: 111: if(run.power_bit)
	btfss	0+(_run)+01h,1
	goto	u1541
	goto	u1540
u1541:
	goto	l8101
u1540:
	line	113
	
l8099:	
;main.c: 112: {
;main.c: 113: run.wait_bit = 1;
	bsf	0+(_run)+02h,3
	line	114
;main.c: 114: run.check1_bit = 0;
	bcf	0+(_run)+02h,4
	line	116
	
l8101:	
;main.c: 115: }
;main.c: 116: Cnt.keydn++;
	incf	0+(_Cnt)+06h,f
	line	118
	
l8103:	
;main.c: 117: }
;main.c: 118: if(Cnt.keydn>=3)
	movlw	(03h)
	subwf	0+(_Cnt)+06h,w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l8115
u1550:
	line	120
	
l8105:	
;main.c: 119: {
;main.c: 120: Cnt.keydn = 0;
	clrf	0+(_Cnt)+06h
	line	121
	
l8107:	
;main.c: 121: if(run.power_bit)
	btfss	0+(_run)+01h,1
	goto	u1561
	goto	u1560
u1561:
	goto	l3186
u1560:
	line	123
	
l8109:	
;main.c: 122: {
;main.c: 123: run.poweroff_bit = 1;
	bsf	(_run),7
	line	124
	
l8111:	
;main.c: 124: power();
	fcall	_power
	line	125
;main.c: 125: }
	goto	l8115
	line	126
	
l3186:	
	line	128
;main.c: 126: else
;main.c: 127: {
;main.c: 128: run.poweron_bit = 1;
	bsf	0+(_run)+01h,0
	goto	l8111
	line	132
	
l8115:	
;main.c: 130: }
;main.c: 131: }
;main.c: 132: if(run.power_bit&&run.press_bit)
	btfss	0+(_run)+01h,1
	goto	u1571
	goto	u1570
u1571:
	goto	l8121
u1570:
	
l8117:	
	btfss	0+(_run)+01h,2
	goto	u1581
	goto	u1580
u1581:
	goto	l8121
u1580:
	line	134
	
l8119:	
;main.c: 133: {
;main.c: 134: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	137
	
l8121:	
;main.c: 135: }
;main.c: 136: }
;main.c: 137: if(RA3)
	btfss	(99/8),(99)&7
	goto	u1591
	goto	u1590
u1591:
	goto	l3191
u1590:
	line	139
	
l8123:	
;main.c: 138: {
;main.c: 139: run.lock_bit = 0;
	bcf	0+(_run)+03h,0
	line	140
;main.c: 140: run.press_bit = 0;
	bcf	0+(_run)+01h,2
	line	141
;main.c: 141: run.wait_bit = 0;
	bcf	0+(_run)+02h,3
	line	142
;main.c: 142: run.show_bit = 0;
	bcf	(_run),1
	line	143
;main.c: 143: if(run.smoke_bit)
	btfss	(_run),4
	goto	u1601
	goto	u1600
u1601:
	goto	l8129
u1600:
	line	145
	
l8125:	
;main.c: 144: {
;main.c: 145: run.finish1_bit = 1;
	bsf	0+(_run)+02h,2
	line	146
;main.c: 146: run.close_bit = 1;
	bsf	(_run),0
	line	147
;main.c: 147: RC3 = 0;
	bcf	(115/8),(115)&7
	line	148
;main.c: 148: run.check1_bit = 0;
	bcf	0+(_run)+02h,4
	line	149
	
l8127:	
;main.c: 149: Cnt.Chgdelay1 = 0;
	clrf	0+(_Cnt)+018h
	clrf	1+(_Cnt)+018h
	line	151
	
l8129:	
;main.c: 150: }
;main.c: 151: run.key = 0;
	bcf	(_run),6
	line	152
	
l8131:	
;main.c: 152: RC3 = 0;
	bcf	(115/8),(115)&7
	line	154
	
l8133:	
;main.c: 154: run.smoke_bit = 0;
	bcf	(_run),4
	line	156
	
l3191:	
	return
	opt stack 0
GLOBAL	__end_of_key_deal
	__end_of_key_deal:
;; =============== function _key_deal ends ============

	signat	_key_deal,88
	global	_GetIsense
psect	text477,local,class=CODE,delta=2
global __ptext477
__ptext477:

;; *************** function _GetIsense *****************
;; Defined at:
;;		line 76 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  I               2    8[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/3
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_GetAD
;; This function is called by:
;;		_charge_deal
;; This function uses a non-reentrant model
;;
psect	text477
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
	line	76
	global	__size_of_GetIsense
	__size_of_GetIsense	equ	__end_of_GetIsense-_GetIsense
	
_GetIsense:	
	opt	stack 12
; Regs used in _GetIsense: [wreg+fsr1l-status,0+pclath+cstack]
	line	78
	
l8071:	
;AD.c: 77: uint I;
;AD.c: 78: RC4 = 1;
	bsf	(116/8),(116)&7
	line	79
;AD.c: 79: ANSC1 = 1;
	movlb 3	; select bank3
	bsf	(3185/8)^0180h,(3185)&7
	line	80
	
l8073:	
;AD.c: 80: ADCON0 = 0x14;
	movlw	(014h)
	movlb 1	; select bank1
	movwf	(157)^080h	;volatile
	line	81
;AD.c: 81: ADCON1 = 0xA2;
	movlw	(0A2h)
	movwf	(158)^080h	;volatile
	line	82
	
l8075:	
;AD.c: 82: I = GetAD();
	fcall	_GetAD
	movf	(1+(?_GetAD)),w
	movwf	(GetIsense@I+1)
	movf	(0+(?_GetAD)),w
	movwf	(GetIsense@I)
	line	83
	
l8077:	
;AD.c: 83: ANSC1 = 0;
	movlb 3	; select bank3
	bcf	(3185/8)^0180h,(3185)&7
	line	84
	
l8079:	
;AD.c: 84: return I;
	movf	(GetIsense@I+1),w
	movwf	(?_GetIsense+1)
	movf	(GetIsense@I),w
	movwf	(?_GetIsense)
	line	85
	
l1567:	
	return
	opt stack 0
GLOBAL	__end_of_GetIsense
	__end_of_GetIsense:
;; =============== function _GetIsense ends ============

	signat	_GetIsense,90
	global	_GetBT
psect	text478,local,class=CODE,delta=2
global __ptext478
__ptext478:

;; *************** function _GetBT *****************
;; Defined at:
;;		line 63 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  BT              2   22[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   20[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_GetAD
;;		___aldiv
;; This function is called by:
;;		_GetUsbI
;;		_BTpower
;;		_charge_deal
;; This function uses a non-reentrant model
;;
psect	text478
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
	line	63
	global	__size_of_GetBT
	__size_of_GetBT	equ	__end_of_GetBT-_GetBT
	
_GetBT:	
	opt	stack 11
; Regs used in _GetBT: [wreg+fsr1l-status,0+pclath+cstack]
	line	65
	
l8057:	
;AD.c: 64: uint BT;
;AD.c: 65: ANSA1 = 1;
	movlb 3	; select bank3
	bsf	(3169/8)^0180h,(3169)&7
	line	66
	
l8059:	
;AD.c: 66: ADCON0 = 0x04;
	movlw	(04h)
	movlb 1	; select bank1
	movwf	(157)^080h	;volatile
	line	67
;AD.c: 67: ADCON1 = 0xA0;
	movlw	(0A0h)
	movwf	(158)^080h	;volatile
	line	68
	
l8061:	
;AD.c: 68: BT = GetAD();
	fcall	_GetAD
	movf	(1+(?_GetAD)),w
	movwf	(GetBT@BT+1)
	movf	(0+(?_GetAD)),w
	movwf	(GetBT@BT)
	line	69
	
l8063:	
;AD.c: 69: ANSA1 = 0;
	movlb 3	; select bank3
	bcf	(3169/8)^0180h,(3169)&7
	line	70
	
l8065:	
;AD.c: 70: BT = 1048576/BT;
	movlb 0	; select bank0
	movf	(GetBT@BT),w
	movwf	(?___aldiv)
	movf	(GetBT@BT+1),w
	movwf	((?___aldiv))+1
	clrf	2+((?___aldiv))
	clrf	3+((?___aldiv))
	movlw	0
	movwf	3+(?___aldiv)+04h
	movlw	010h
	movwf	2+(?___aldiv)+04h
	movlw	0
	movwf	1+(?___aldiv)+04h
	movlw	0
	movwf	0+(?___aldiv)+04h

	fcall	___aldiv
	movf	1+(((0+(?___aldiv)))),w
	movwf	(GetBT@BT+1)
	movf	0+(((0+(?___aldiv)))),w
	movwf	(GetBT@BT)
	line	71
	
l8067:	
;AD.c: 71: return BT;
	movf	(GetBT@BT+1),w
	movwf	(?_GetBT+1)
	movf	(GetBT@BT),w
	movwf	(?_GetBT)
	line	72
	
l1564:	
	return
	opt stack 0
GLOBAL	__end_of_GetBT
	__end_of_GetBT:
;; =============== function _GetBT ends ============

	signat	_GetBT,90
	global	_GetHotV
psect	text479,local,class=CODE,delta=2
global __ptext479
__ptext479:

;; *************** function _GetHotV *****************
;; Defined at:
;;		line 51 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  H               2    8[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/3
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_GetAD
;; This function is called by:
;;		_smoke_deal
;; This function uses a non-reentrant model
;;
psect	text479
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
	line	51
	global	__size_of_GetHotV
	__size_of_GetHotV	equ	__end_of_GetHotV-_GetHotV
	
_GetHotV:	
	opt	stack 12
; Regs used in _GetHotV: [wreg+fsr1l-status,0+pclath+cstack]
	line	54
	
l8043:	
;AD.c: 52: uint H;
;AD.c: 54: ANSA0 = 1;
	movlb 3	; select bank3
	bsf	(3168/8)^0180h,(3168)&7
	line	55
	
l8045:	
;AD.c: 55: ADCON0 = 0x00;
	movlb 1	; select bank1
	clrf	(157)^080h	;volatile
	line	56
	
l8047:	
;AD.c: 56: ADCON1 = 0xA2;
	movlw	(0A2h)
	movwf	(158)^080h	;volatile
	line	57
	
l8049:	
;AD.c: 57: H = GetAD();
	fcall	_GetAD
	movf	(1+(?_GetAD)),w
	movwf	(GetHotV@H+1)
	movf	(0+(?_GetAD)),w
	movwf	(GetHotV@H)
	line	58
	
l8051:	
;AD.c: 58: ANSA0 = 0;
	movlb 3	; select bank3
	bcf	(3168/8)^0180h,(3168)&7
	line	59
	
l8053:	
;AD.c: 59: return H;
	movf	(GetHotV@H+1),w
	movwf	(?_GetHotV+1)
	movf	(GetHotV@H),w
	movwf	(?_GetHotV)
	line	60
	
l1561:	
	return
	opt stack 0
GLOBAL	__end_of_GetHotV
	__end_of_GetHotV:
;; =============== function _GetHotV ends ============

	signat	_GetHotV,90
	global	_power
psect	text480,local,class=CODE,delta=2
global __ptext480
__ptext480:

;; *************** function _power *****************
;; Defined at:
;;		line 160 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_key_deal
;; This function uses a non-reentrant model
;;
psect	text480
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	160
	global	__size_of_power
	__size_of_power	equ	__end_of_power-_power
	
_power:	
	opt	stack 12
; Regs used in _power: [wreg+status,2+status,0+pclath+cstack]
	line	161
	
l7989:	
	line	162
	
l7991:	
;main.c: 162: if(run.poweron_bit)
	btfss	0+(_run)+01h,0
	goto	u1471
	goto	u1470
u1471:
	goto	l8015
u1470:
	line	164
	
l7993:	
;main.c: 163: {
;main.c: 164: RA4 = 0;
	bcf	(100/8),(100)&7
	line	165
;main.c: 165: RA5 = 0;
	bcf	(101/8),(101)&7
	line	166
	
l7995:	
;main.c: 166: for(i=0;i<6;i++)
	clrf	(power@i)
	line	167
	
l3195:	
	line	168
# 168 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text480
	line	170
	
l8001:	
;main.c: 170: RA4=~RA4;
	movlw	1<<((100)&7)
	movlb 0	; select bank0
	xorwf	((100)/8),f
	line	171
;main.c: 171: RA5=~RA5;
	movlw	1<<((101)&7)
	xorwf	((101)/8),f
	line	172
	
l8003:	
;main.c: 172: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	166
	
l8005:	
	incf	(power@i),f
	
l8007:	
	movlw	(06h)
	subwf	(power@i),w
	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l3195
u1480:
	line	174
	
l8009:	
;main.c: 173: }
;main.c: 174: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	175
;main.c: 175: Cnt.value_led = 0;
	clrf	0+(_Cnt)+04h
	line	176
	
l8011:	
;main.c: 176: run.poweron_bit = 0;
	bcf	0+(_run)+01h,0
	line	177
	
l8013:	
;main.c: 177: run.power_bit = 1;
	bsf	0+(_run)+01h,1
	line	179
	
l8015:	
;main.c: 178: }
;main.c: 179: if(run.poweroff_bit)
	btfss	(_run),7
	goto	u1491
	goto	u1490
u1491:
	goto	l3200
u1490:
	line	181
	
l8017:	
;main.c: 180: {
;main.c: 181: RA4 = 0;
	bcf	(100/8),(100)&7
	line	182
;main.c: 182: RA5 = 0;
	bcf	(101/8),(101)&7
	line	183
	
l8019:	
;main.c: 183: for(i=0;i<6;i++)
	clrf	(power@i)
	line	184
	
l3198:	
	line	185
# 185 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text480
	line	187
	
l8025:	
;main.c: 187: RA4=~RA4;
	movlw	1<<((100)&7)
	movlb 0	; select bank0
	xorwf	((100)/8),f
	line	188
;main.c: 188: RA5=~RA5;
	movlw	1<<((101)&7)
	xorwf	((101)/8),f
	line	189
	
l8027:	
;main.c: 189: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	183
	
l8029:	
	incf	(power@i),f
	
l8031:	
	movlw	(06h)
	subwf	(power@i),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l3198
u1500:
	line	191
	
l8033:	
;main.c: 190: }
;main.c: 191: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	192
	
l8035:	
;main.c: 192: run.smoke_bit= 0;
	bcf	(_run),4
	line	193
;main.c: 193: Cnt.value_led = 0;
	clrf	0+(_Cnt)+04h
	line	194
	
l8037:	
;main.c: 194: run.poweroff_bit = 0;
	bcf	(_run),7
	line	195
	
l8039:	
;main.c: 195: run.power_bit = 0;
	bcf	0+(_run)+01h,1
	line	196
	
l8041:	
;main.c: 196: run.sleep_bit = 1;
	bsf	0+(_run)+01h,3
	line	198
	
l3200:	
	return
	opt stack 0
GLOBAL	__end_of_power
	__end_of_power:
;; =============== function _power ends ============

	signat	_power,88
	global	_warn_deal
psect	text481,local,class=CODE,delta=2
global __ptext481
__ptext481:

;; *************** function _warn_deal *****************
;; Defined at:
;;		line 229 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  num             1    6[COMMON] unsigned char 
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1C/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text481
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	229
	global	__size_of_warn_deal
	__size_of_warn_deal	equ	__end_of_warn_deal-_warn_deal
	
_warn_deal:	
	opt	stack 13
; Regs used in _warn_deal: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	230
	
l7949:	
;main.c: 230: if(run.warn_bit)
	movlb 0	; select bank0
	btfss	(_run),3
	goto	u1421
	goto	u1420
u1421:
	goto	l3225
u1420:
	line	234
	
l7951:	
;main.c: 231: {
;main.c: 232: uchar i;
;main.c: 233: uchar num;
;main.c: 234: RA5 = 0;
	bcf	(101/8),(101)&7
	line	235
;main.c: 235: RA4 = 0;
	bcf	(100/8),(100)&7
	line	236
;main.c: 236: RC3 = 0;
	bcf	(115/8),(115)&7
	line	237
;main.c: 237: switch(Cnt.warn)
	goto	l7961
	line	239
	
l7953:	
	movlw	(0Ah)
	movwf	(warn_deal@num)
	goto	l7963
	line	240
	
l7955:	
	movlw	(010h)
	movwf	(warn_deal@num)
	goto	l7963
	line	241
	
l7957:	
	movlw	(06h)
	movwf	(warn_deal@num)
	goto	l7963
	line	237
	
l7961:	
	movf	0+(_Cnt)+05h,w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           15     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l7953
	xorlw	2^1	; case 2
	skipnz
	goto	l7955
	xorlw	3^2	; case 3
	skipnz
	goto	l7957
	goto	l7963
	opt asmopt_on

	line	243
	
l7963:	
;main.c: 243: for(i=0;i<num;i++)
	clrf	(warn_deal@i)
	goto	l7979
	line	244
	
l3216:	
	line	245
# 245 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text481
	line	246
	
l7965:	
;main.c: 246: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	247
	
l7967:	
;main.c: 247: if(Cnt.warn==1)
	movlb 0	; select bank0
	decf	0+(_Cnt)+05h,w
	skipz
	goto	u1431
	goto	u1430
u1431:
	goto	l7975
u1430:
	line	249
	
l7969:	
;main.c: 248: {
;main.c: 249: if(run.LEDB_bit)
	btfss	(_run),2
	goto	u1441
	goto	u1440
u1441:
	goto	l7973
u1440:
	line	250
	
l7971:	
;main.c: 250: RA5 = ~RA5;
	movlw	1<<((101)&7)
	xorwf	((101)/8),f
	goto	l7977
	line	252
	
l7973:	
;main.c: 251: else
;main.c: 252: RA4 = ~RA4;
	movlw	1<<((100)&7)
	xorwf	((100)/8),f
	goto	l7977
	line	256
	
l7975:	
;main.c: 254: else
;main.c: 255: {
;main.c: 256: RA4=~RA4;
	movlw	1<<((100)&7)
	xorwf	((100)/8),f
	line	257
;main.c: 257: RA5=~RA5;
	movlw	1<<((101)&7)
	xorwf	((101)/8),f
	line	243
	
l7977:	
	incf	(warn_deal@i),f
	
l7979:	
	movf	(warn_deal@num),w
	subwf	(warn_deal@i),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l3216
u1450:
	
l3221:	
	line	260
;main.c: 258: }
;main.c: 259: }
;main.c: 260: RA4 = 0;
	bcf	(100/8),(100)&7
	line	261
;main.c: 261: RA5 = 0;
	bcf	(101/8),(101)&7
	line	262
;main.c: 262: run.finish1_bit = 1;
	bsf	0+(_run)+02h,2
	line	263
;main.c: 263: run.check1_bit = 0;
	bcf	0+(_run)+02h,4
	line	264
	
l7981:	
;main.c: 264: Cnt.value_led = 0;
	clrf	0+(_Cnt)+04h
	line	265
	
l7983:	
;main.c: 265: run.smoke_bit = 0;
	bcf	(_run),4
	line	266
	
l7985:	
;main.c: 266: run.key = 0;
	bcf	(_run),6
	line	267
	
l7987:	
;main.c: 267: run.warn_bit = 0;
	bcf	(_run),3
	line	268
;main.c: 268: while(!RA3)
	goto	l3222
	
l3223:	
	line	270
# 270 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text481
	line	271
;main.c: 271: RC3 = 0;
	movlb 0	; select bank0
	bcf	(115/8),(115)&7
	line	272
	
l3222:	
	line	268
	btfss	(99/8),(99)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l3223
u1460:
	line	274
	
l3225:	
	return
	opt stack 0
GLOBAL	__end_of_warn_deal
	__end_of_warn_deal:
;; =============== function _warn_deal ends ============

	signat	_warn_deal,88
	global	_sleep_deal
psect	text482,local,class=CODE,delta=2
global __ptext482
__ptext482:

;; *************** function _sleep_deal *****************
;; Defined at:
;;		line 68 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text482
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	68
	global	__size_of_sleep_deal
	__size_of_sleep_deal	equ	__end_of_sleep_deal-_sleep_deal
	
_sleep_deal:	
	opt	stack 14
; Regs used in _sleep_deal: [wreg+status,2]
	line	69
	
l7895:	
;main.c: 69: if(run.sleep_bit)
	movlb 0	; select bank0
	btfss	0+(_run)+01h,3
	goto	u1411
	goto	u1410
u1411:
	goto	l3179
u1410:
	line	71
	
l7897:	
;main.c: 70: {
;main.c: 71: INTCON = 0x08;
	movlw	(08h)
	movwf	(11)	;volatile
	line	72
	
l7899:	
;main.c: 72: TMR1IE = 0;
	movlb 1	; select bank1
	bcf	(1160/8)^080h,(1160)&7
	line	73
	
l7901:	
;main.c: 73: TMR1ON = 0;
	movlb 0	; select bank0
	bcf	(192/8),(192)&7
	line	74
	
l7903:	
;main.c: 74: TRISC5 = 1;
	movlb 1	; select bank1
	bsf	(1141/8)^080h,(1141)&7
	line	75
	
l7905:	
;main.c: 75: TRISC3 = 1;
	bsf	(1139/8)^080h,(1139)&7
	line	76
	
l7907:	
;main.c: 76: PORTA = 0x00;
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	77
	
l7909:	
;main.c: 77: PORTC = 0x00;
	clrf	(14)	;volatile
	line	78
	
l7911:	
;main.c: 78: IOCAF = 0x00;
	movlb 7	; select bank7
	clrf	(915)^0380h	;volatile
	line	79
	
l7913:	
;main.c: 79: IOCAP = 0x0D;
	movlw	(0Dh)
	movwf	(913)^0380h	;volatile
	line	80
	
l7915:	
;main.c: 80: IOCAN = 0x08;
	movlw	(08h)
	movwf	(914)^0380h	;volatile
	line	81
	
l7917:	
;main.c: 81: _nop();_nop();
	nop
	
l7919:	
	nop
	line	82
	
l7921:	
# 82 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
sleep ;#
psect	text482
	line	83
	
l7923:	
;main.c: 83: _nop();_nop();
	nop
	
l7925:	
	nop
	line	85
	
l7927:	
;main.c: 85: IOCAF = 0x00;
	movlb 7	; select bank7
	clrf	(915)^0380h	;volatile
	line	86
	
l7929:	
;main.c: 86: IOCAP = 0x00;
	clrf	(913)^0380h	;volatile
	line	87
	
l7931:	
;main.c: 87: IOCAN = 0x00;
	clrf	(914)^0380h	;volatile
	line	88
	
l7933:	
# 88 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text482
	line	89
	
l7935:	
;main.c: 89: TRISC5 = 0;
	movlb 1	; select bank1
	bcf	(1141/8)^080h,(1141)&7
	line	90
	
l7937:	
;main.c: 90: TRISC3 = 0;
	bcf	(1139/8)^080h,(1139)&7
	line	91
	
l7939:	
;main.c: 91: RC0 = 1;
	movlb 0	; select bank0
	bsf	(112/8),(112)&7
	line	92
;main.c: 92: INTCON = 0xC0;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	93
	
l7941:	
;main.c: 93: TMR1IE = 1;
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	94
	
l7943:	
;main.c: 94: TMR1ON = 1;
	movlb 0	; select bank0
	bsf	(192/8),(192)&7
	line	95
	
l7945:	
;main.c: 95: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	96
	
l7947:	
;main.c: 96: run.sleep_bit = 0;
	bcf	0+(_run)+01h,3
	line	98
	
l3179:	
	return
	opt stack 0
GLOBAL	__end_of_sleep_deal
	__end_of_sleep_deal:
;; =============== function _sleep_deal ends ============

	signat	_sleep_deal,88
	global	_powerInit_deal
psect	text483,local,class=CODE,delta=2
global __ptext483
__ptext483:

;; *************** function _powerInit_deal *****************
;; Defined at:
;;		line 49 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text483
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	49
	global	__size_of_powerInit_deal
	__size_of_powerInit_deal	equ	__end_of_powerInit_deal-_powerInit_deal
	
_powerInit_deal:	
	opt	stack 13
; Regs used in _powerInit_deal: [wreg+status,2+status,0+pclath+cstack]
	line	50
	
l7873:	
	line	51
	
l7875:	
;main.c: 51: RA4 = 0;
	bcf	(100/8),(100)&7
	line	52
	
l7877:	
;main.c: 52: RA5 = 0;
	bcf	(101/8),(101)&7
	line	53
;main.c: 53: for(i=0;i<6;i++)
	clrf	(powerInit_deal@i)
	line	54
	
l3170:	
	line	55
# 55 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text483
	line	57
	
l7883:	
;main.c: 57: RA4=~RA4;
	movlw	1<<((100)&7)
	movlb 0	; select bank0
	xorwf	((100)/8),f
	line	58
;main.c: 58: RA5=~RA5;
	movlw	1<<((101)&7)
	xorwf	((101)/8),f
	line	59
	
l7885:	
;main.c: 59: delay(200);
	movlw	0C8h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	53
	
l7887:	
	incf	(powerInit_deal@i),f
	
l7889:	
	movlw	(06h)
	subwf	(powerInit_deal@i),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l3170
u1390:
	line	61
	
l7891:	
;main.c: 60: }
;main.c: 61: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	62
	
l7893:	
;main.c: 62: run.power_bit = 1;
	bsf	0+(_run)+01h,1
	line	63
;main.c: 63: while(!RA3)
	goto	l3172
	
l3173:	
	line	64
# 64 "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
clrwdt ;#
psect	text483
	
l3172:	
	line	63
	movlb 0	; select bank0
	btfss	(99/8),(99)&7
	goto	u1401
	goto	u1400
u1401:
	goto	l3173
u1400:
	line	65
	
l3175:	
	return
	opt stack 0
GLOBAL	__end_of_powerInit_deal
	__end_of_powerInit_deal:
;; =============== function _powerInit_deal ends ============

	signat	_powerInit_deal,88
	global	_GetAD
psect	text484,local,class=CODE,delta=2
global __ptext484
__ptext484:

;; *************** function _GetAD *****************
;; Defined at:
;;		line 11 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  SumBuf         16    0[BANK0 ] unsigned int [8]
;;  SumADC          2   16[BANK0 ] unsigned int 
;;  i               1   19[BANK0 ] unsigned char 
;;  t               1   18[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/1
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0      20       0
;;      Temps:          4       0       0
;;      Totals:         6      20       0
;;Total ram usage:       26 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GetHotV
;;		_GetBT
;;		_GetIsense
;;		_GetUsbI
;; This function uses a non-reentrant model
;;
psect	text484
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\AD.c"
	line	11
	global	__size_of_GetAD
	__size_of_GetAD	equ	__end_of_GetAD-_GetAD
	
_GetAD:	
	opt	stack 12
; Regs used in _GetAD: [wreg+fsr1l-status,0]
	line	12
	
l7809:	
	movlb 0	; select bank0
	clrf	(GetAD@t)
	line	13
;AD.c: 13: uint SumADC = 0;
	clrf	(GetAD@SumADC)
	clrf	(GetAD@SumADC+1)
	line	16
	
l7811:	
;AD.c: 14: uint SumBuf[8];
;AD.c: 16: ADCON0bits.ADON = 1;
	movlb 1	; select bank1
	bsf	(157)^080h,0	;volatile
	line	17
	
l7813:	
;AD.c: 17: _nop();_nop();_nop();
	nop
	
l7815:	
	nop
	
l7817:	
	nop
	line	18
	
l7819:	
;AD.c: 18: _nop();_nop();_nop();
	nop
	
l7821:	
	nop
	
l7823:	
	nop
	line	20
;AD.c: 20: for(i=0;i<8-0;i++)
	movlb 0	; select bank0
	clrf	(GetAD@i)
	line	21
	
l1545:	
	line	22
;AD.c: 21: {
;AD.c: 22: ADCON0bits.GO= 1;
	movlb 1	; select bank1
	bsf	(157)^080h,1	;volatile
	line	23
;AD.c: 23: while(ADCON0bits.GO) continue;
	
l1547:	
	btfsc	(157)^080h,1	;volatile
	goto	u1331
	goto	u1330
u1331:
	goto	l1547
u1330:
	line	24
	
l7829:	
;AD.c: 24: SumBuf[i]=ADRESH*256 + ADRESL;
	movlb 0	; select bank0
	lslf	(GetAD@i),w
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlb 1	; select bank1
	movf	(155)^080h,w	;volatile
	movwi	[0]fsr1
	movf	(156)^080h,w	;volatile
	movwi	[1]fsr1
	line	20
	
l7831:	
	movlb 0	; select bank0
	incf	(GetAD@i),f
	
l7833:	
	movlw	(08h)
	subwf	(GetAD@i),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l1545
u1340:
	
l1546:	
	line	26
;AD.c: 25: }
;AD.c: 26: ADCON0bits.ADON = 0;
	movlb 1	; select bank1
	bcf	(157)^080h,0	;volatile
	line	28
;AD.c: 28: for(i=1;i<8-0;i++)
	movlb 0	; select bank0
	clrf	(GetAD@i)
	incf	(GetAD@i),f
	line	29
	
l7839:	
;AD.c: 29: for(t=0;t<8-i;t++)
	clrf	(GetAD@t)
	goto	l7847
	line	31
	
l7841:	
;AD.c: 30: {
;AD.c: 31: if (SumBuf[t+0] > SumBuf[t+1])
	movlb 0	; select bank0
	lslf	(GetAD@t),w
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_GetAD+0)+0
	moviw	[1]fsr1
	movwf	(??_GetAD+0)+0+1
	lslf	(GetAD@t),w
	addlw	02h
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_GetAD+2)+0
	moviw	[1]fsr1
	movwf	(??_GetAD+2)+0+1
	movf	1+(??_GetAD+0)+0,w
	subwf	1+(??_GetAD+2)+0,w
	skipz
	goto	u1355
	movf	0+(??_GetAD+0)+0,w
	subwf	0+(??_GetAD+2)+0,w
u1355:
	skipnc
	goto	u1351
	goto	u1350
u1351:
	goto	l7845
u1350:
	line	33
	
l7843:	
;AD.c: 32: {
;AD.c: 33: SumADC = SumBuf[t+0];
	lslf	(GetAD@t),w
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(GetAD@SumADC)
	moviw	[1]fsr1
	movwf	(GetAD@SumADC+1)
	line	34
;AD.c: 34: SumBuf[t+0] = SumBuf[t+1];
	lslf	(GetAD@t),w
	addlw	02h
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_GetAD+0)+0
	moviw	[1]fsr1
	movwf	(??_GetAD+0)+0+1
	lslf	(GetAD@t),w
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(??_GetAD+0)+0,w
	movwi	[0]fsr1
	movf	1+(??_GetAD+0)+0,w
	movwi	[1]fsr1
	line	35
;AD.c: 35: SumBuf[t+1] = SumADC;
	lslf	(GetAD@t),w
	addlw	02h
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(GetAD@SumADC),w
	movwi	[0]fsr1
	movf	(GetAD@SumADC+1),w
	movwi	[1]fsr1
	line	29
	
l7845:	
	incf	(GetAD@t),f
	
l7847:	
	movlw	high(08h)
	movwf	(??_GetAD+0)+0+1
	movf	(GetAD@i),w
	sublw	low(08h)
	movwf	(??_GetAD+0)+0
	skipc
	decf	(??_GetAD+0)+0+1,f
	movf	1+(??_GetAD+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1365
	movf	0+(??_GetAD+0)+0,w
	subwf	(GetAD@t),w
u1365:

	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l7841
u1360:
	line	28
	
l7849:	
	movlb 0	; select bank0
	incf	(GetAD@i),f
	
l7851:	
	movlw	(08h)
	subwf	(GetAD@i),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l7839
u1370:
	line	39
	
l7853:	
;AD.c: 36: }
;AD.c: 37: }
;AD.c: 39: SumADC = 0;
	clrf	(GetAD@SumADC)
	clrf	(GetAD@SumADC+1)
	line	40
	
l7855:	
;AD.c: 40: for(i=2;i<8-2;i++)
	movlw	(02h)
	movwf	(GetAD@i)
	line	42
	
l7861:	
;AD.c: 41: {
;AD.c: 42: SumADC += SumBuf[i];
	lslf	(GetAD@i),w
	addlw	GetAD@SumBuf&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_GetAD+0)+0
	moviw	[1]fsr1
	movwf	(??_GetAD+0)+0+1
	movf	0+(??_GetAD+0)+0,w
	addwf	(GetAD@SumADC),f
	movf	1+(??_GetAD+0)+0,w
	addwfc	(GetAD@SumADC+1),f
	line	40
	
l7863:	
	incf	(GetAD@i),f
	
l7865:	
	movlw	(06h)
	subwf	(GetAD@i),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l7861
u1380:
	line	44
	
l7867:	
;AD.c: 43: }
;AD.c: 44: SumADC /= (8-4);
	lsrf	(GetAD@SumADC+1),f
	rrf	(GetAD@SumADC),f
	lsrf	(GetAD@SumADC+1),f
	rrf	(GetAD@SumADC),f
	line	46
	
l7869:	
;AD.c: 46: return SumADC;
	movf	(GetAD@SumADC+1),w
	movwf	(?_GetAD+1)
	movf	(GetAD@SumADC),w
	movwf	(?_GetAD)
	line	47
	
l1558:	
	return
	opt stack 0
GLOBAL	__end_of_GetAD
	__end_of_GetAD:
;; =============== function _GetAD ends ============

	signat	_GetAD,90
	global	___aldiv
psect	text485,local,class=CODE,delta=2
global __ptext485
__ptext485:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "d:\Program Files\HI-TECH Software\PICC\9.83\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] long 
;;  dividend        4    4[COMMON] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   10[COMMON] long 
;;  sign            1    9[COMMON] unsigned char 
;;  counter         1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         8       0       0
;;      Locals:         6       0       0
;;      Temps:          0       0       0
;;      Totals:        14       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GetBT
;; This function uses a non-reentrant model
;;
psect	text485
	file	"d:\Program Files\HI-TECH Software\PICC\9.83\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 11
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l7769:	
	clrf	(___aldiv@sign)
	line	10
	
l7771:	
	btfss	(___aldiv@divisor+3),7
	goto	u1261
	goto	u1260
u1261:
	goto	l6596
u1260:
	line	11
	
l7773:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	12
	clrf	(___aldiv@sign)
	incf	(___aldiv@sign),f
	line	13
	
l6596:	
	line	14
	btfss	(___aldiv@dividend+3),7
	goto	u1271
	goto	u1270
u1271:
	goto	l7779
u1270:
	line	15
	
l7775:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	16
	
l7777:	
	movlw	(01h)
	xorwf	(___aldiv@sign),f
	line	18
	
l7779:	
	clrf	(___aldiv@quotient)
	clrf	(___aldiv@quotient+1)
	clrf	(___aldiv@quotient+2)
	clrf	(___aldiv@quotient+3)
	line	19
	
l7781:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u1281
	goto	u1280
u1281:
	goto	l7801
u1280:
	line	20
	
l7783:	
	clrf	(___aldiv@counter)
	incf	(___aldiv@counter),f
	line	21
	goto	l7787
	line	22
	
l7785:	
	lslf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	line	23
	incf	(___aldiv@counter),f
	line	21
	
l7787:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u1291
	goto	u1290
u1291:
	goto	l7785
u1290:
	line	26
	
l7789:	
	lslf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	line	27
	
l7791:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u1305
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u1305
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u1305
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u1305:
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l7797
u1300:
	line	28
	
l7793:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	subwfb	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	subwfb	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	subwfb	(___aldiv@dividend+3),f
	line	29
	
l7795:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	line	31
	
l7797:	
	lsrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	line	32
	
l7799:	
	decfsz	(___aldiv@counter),f
	goto	u1311
	goto	u1310
u1311:
	goto	l7789
u1310:
	line	34
	
l7801:	
	movf	(___aldiv@sign),w
	skipz
	goto	u1320
	goto	l7805
u1320:
	line	35
	
l7803:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	line	36
	
l7805:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	line	37
	
l6606:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	_HOTPWM
psect	text486,local,class=CODE,delta=2
global __ptext486
__ptext486:

;; *************** function _HOTPWM *****************
;; Defined at:
;;		line 6 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\PWM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_charge_deal
;; This function uses a non-reentrant model
;;
psect	text486
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\PWM.c"
	line	6
	global	__size_of_HOTPWM
	__size_of_HOTPWM	equ	__end_of_HOTPWM-_HOTPWM
	
_HOTPWM:	
	opt	stack 13
; Regs used in _HOTPWM: [wreg+status,2]
	line	7
	
l7673:	
;PWM.c: 7: TRISC3 = 1;
	movlb 1	; select bank1
	bsf	(1139/8)^080h,(1139)&7
	line	8
	
l7675:	
;PWM.c: 8: PR2 = 124;
	movlw	(07Ch)
	movlb 0	; select bank0
	movwf	(27)	;volatile
	line	9
;PWM.c: 9: PWM2CON = 0xE0;
	movlw	(0E0h)
	movlb 12	; select bank12
	movwf	(1558)^0600h	;volatile
	line	10
;PWM.c: 10: PWM2DCH = 0x7E;
	movlw	(07Eh)
	movwf	(1557)^0600h	;volatile
	line	11
	
l7677:	
;PWM.c: 11: PWM2DCL = 0x00;
	clrf	(1556)^0600h	;volatile
	line	12
	
l7679:	
;PWM.c: 12: TMR2 = 0;
	movlb 0	; select bank0
	clrf	(26)	;volatile
	line	13
;PWM.c: 13: T2CON = 0x02;
	movlw	(02h)
	movwf	(28)	;volatile
	line	14
	
l7681:	
;PWM.c: 14: TMR2IF = 0;
	bcf	(137/8),(137)&7
	line	15
	
l7683:	
;PWM.c: 15: TRISC3 = 0;
	movlb 1	; select bank1
	bcf	(1139/8)^080h,(1139)&7
	line	16
	
l7685:	
;PWM.c: 16: TMR2ON = 1;
	movlb 0	; select bank0
	bsf	(226/8),(226)&7
	line	17
	
l4815:	
	return
	opt stack 0
GLOBAL	__end_of_HOTPWM
	__end_of_HOTPWM:
;; =============== function _HOTPWM ends ============

	signat	_HOTPWM,88
	global	_USBPWM
psect	text487,local,class=CODE,delta=2
global __ptext487
__ptext487:

;; *************** function _USBPWM *****************
;; Defined at:
;;		line 20 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\PWM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_charge_deal
;; This function uses a non-reentrant model
;;
psect	text487
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\PWM.c"
	line	20
	global	__size_of_USBPWM
	__size_of_USBPWM	equ	__end_of_USBPWM-_USBPWM
	
_USBPWM:	
	opt	stack 13
; Regs used in _USBPWM: [wreg+status,2]
	line	21
	
l7659:	
;PWM.c: 21: TRISC5 = 1;
	movlb 1	; select bank1
	bsf	(1141/8)^080h,(1141)&7
	line	22
	
l7661:	
;PWM.c: 22: PR2 = 124;
	movlw	(07Ch)
	movlb 0	; select bank0
	movwf	(27)	;volatile
	line	23
;PWM.c: 23: PWM1CON = 0xE0;
	movlw	(0E0h)
	movlb 12	; select bank12
	movwf	(1555)^0600h	;volatile
	line	24
;PWM.c: 24: PWM1DCH = 0x7E;
	movlw	(07Eh)
	movwf	(1554)^0600h	;volatile
	line	25
	
l7663:	
;PWM.c: 25: PWM1DCL = 0x00;
	clrf	(1553)^0600h	;volatile
	line	26
	
l7665:	
;PWM.c: 26: TMR2 = 0;
	movlb 0	; select bank0
	clrf	(26)	;volatile
	line	27
;PWM.c: 27: T2CON = 0x02;
	movlw	(02h)
	movwf	(28)	;volatile
	line	28
	
l7667:	
;PWM.c: 28: TMR2IF = 0;
	bcf	(137/8),(137)&7
	line	29
	
l7669:	
;PWM.c: 29: TRISC5 = 0;
	movlb 1	; select bank1
	bcf	(1141/8)^080h,(1141)&7
	line	30
	
l7671:	
;PWM.c: 30: TMR2ON = 1;
	movlb 0	; select bank0
	bsf	(226/8),(226)&7
	line	31
	
l4818:	
	return
	opt stack 0
GLOBAL	__end_of_USBPWM
	__end_of_USBPWM:
;; =============== function _USBPWM ends ============

	signat	_USBPWM,88
	global	_Init
psect	text488,local,class=CODE,delta=2
global __ptext488
__ptext488:

;; *************** function _Init *****************
;; Defined at:
;;		line 55 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\Register.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text488
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\Register.c"
	line	55
	global	__size_of_Init
	__size_of_Init	equ	__end_of_Init-_Init
	
_Init:	
	opt	stack 14
; Regs used in _Init: [wreg+status,2]
	line	56
	
l6831:	
;Register.c: 56: TRISA = 0x0F;
	movlw	(0Fh)
	movlb 1	; select bank1
	movwf	(140)^080h	;volatile
	line	57
;Register.c: 57: TRISC = 0x06;
	movlw	(06h)
	movwf	(142)^080h	;volatile
	line	58
	
l6833:	
;Register.c: 58: PORTA = 0x00;
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	59
	
l6835:	
;Register.c: 59: PORTC = 0x01;
	movlw	(01h)
	movwf	(14)	;volatile
	line	60
	
l6837:	
;Register.c: 60: ANSELA = 0x02;
	movlw	(02h)
	movlb 3	; select bank3
	movwf	(396)^0180h	;volatile
	line	61
	
l6839:	
;Register.c: 61: ANSELC = 0x06;
	movlw	(06h)
	movwf	(398)^0180h	;volatile
	line	62
;Register.c: 62: ADCON0 = 0x00;
	movlb 1	; select bank1
	clrf	(157)^080h	;volatile
	line	63
;Register.c: 63: ADCON1 = 0x00;
	clrf	(158)^080h	;volatile
	line	64
	
l6841:	
;Register.c: 64: VREGCON = 0x03;
	movlw	(03h)
	movlb 3	; select bank3
	movwf	(407)^0180h	;volatile
	line	65
	
l6843:	
;Register.c: 65: T1CON = 0x11;
	movlw	(011h)
	movlb 0	; select bank0
	movwf	(24)	;volatile
	line	67
	
l6845:	
;Register.c: 67: OSCCON = 0x72;
	movlw	(072h)
	movlb 1	; select bank1
	movwf	(153)^080h	;volatile
	line	69
	
l6847:	
;Register.c: 69: INTCON = 0xC0;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	70
	
l6849:	
;Register.c: 70: TMR1L = (char)Cnt.Reload;
	movlb 0	; select bank0
	movf	0+(_Cnt)+0Eh,w
	movwf	(22)	;volatile
	line	71
	
l6851:	
;Register.c: 71: TMR1H = (char)(Cnt.Reload>>8);
	movf	1+(_Cnt)+0Eh,w
	movwf	(23)	;volatile
	line	72
	
l6853:	
;Register.c: 72: TMR1IE = 1;
	movlb 1	; select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	73
	
l6855:	
;Register.c: 73: TMR1ON = 1;
	movlb 0	; select bank0
	bsf	(192/8),(192)&7
	line	81
	
l6368:	
	return
	opt stack 0
GLOBAL	__end_of_Init
	__end_of_Init:
;; =============== function _Init ends ============

	signat	_Init,88
	global	_Variates
psect	text489,local,class=CODE,delta=2
global __ptext489
__ptext489:

;; *************** function _Variates *****************
;; Defined at:
;;		line 5 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\Register.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text489
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\Register.c"
	line	5
	global	__size_of_Variates
	__size_of_Variates	equ	__end_of_Variates-_Variates
	
_Variates:	
	opt	stack 14
; Regs used in _Variates: [wreg+status,2]
	line	6
	
l7623:	
;Register.c: 6: run.press_bit = 0;
	bcf	0+(_run)+01h,2
	line	7
;Register.c: 7: run.sleep_bit = 0;
	bcf	0+(_run)+01h,3
	line	8
;Register.c: 8: run.power_bit = 0;
	bcf	0+(_run)+01h,1
	line	9
;Register.c: 9: run.poweroff_bit = 0;
	bcf	(_run),7
	line	10
;Register.c: 10: run.poweron_bit = 0;
	bcf	0+(_run)+01h,0
	line	11
;Register.c: 11: run.key = 0;
	bcf	(_run),6
	line	12
;Register.c: 12: run.smoke_bit = 0;
	bcf	(_run),4
	line	13
;Register.c: 13: run.overpress_bit = 0;
	bcf	(_run),5
	line	14
;Register.c: 14: run.warn_bit = 0;
	bcf	(_run),3
	line	15
;Register.c: 15: run.LEDB_bit = 0;
	bcf	(_run),2
	line	16
;Register.c: 16: run.show_bit = 0;
	bcf	(_run),1
	line	17
;Register.c: 17: run.close_bit = 0;
	bcf	(_run),0
	line	18
;Register.c: 18: run.USB_bit = 0;
	bcf	0+(_run)+01h,4
	line	19
;Register.c: 19: run.sec_bit = 0;
	bcf	0+(_run)+01h,5
	line	20
;Register.c: 20: run.finish_bit = 0;
	bcf	0+(_run)+01h,7
	line	21
;Register.c: 21: run.sec2_bit = 0;
	bcf	0+(_run)+02h,0
	line	22
;Register.c: 22: run.HOT_bit = 0;
	bcf	0+(_run)+02h,1
	line	23
;Register.c: 23: run.finish1_bit = 0;
	bcf	0+(_run)+02h,2
	line	24
;Register.c: 24: run.wait_bit = 0;
	bcf	0+(_run)+02h,3
	line	25
;Register.c: 25: run.check1_bit = 0;
	bcf	0+(_run)+02h,4
	line	26
;Register.c: 26: run.over_bit = 0;
	bcf	0+(_run)+02h,6
	line	27
;Register.c: 27: run.finish2 = 0;
	bcf	0+(_run)+02h,7
	line	28
;Register.c: 28: run.lock_bit = 0;
	bcf	0+(_run)+03h,0
	line	29
;Register.c: 29: run.complete = 0;
	bcf	0+(_run)+03h,1
	line	32
	
l7625:	
;Register.c: 32: Cnt.presstime = 0;
	clrf	0+(_Cnt)+09h
	line	33
	
l7627:	
;Register.c: 33: Cnt.Reload = 0xFFFF - (int)975+1;
	movlw	low(0FC31h)
	movwf	0+(_Cnt)+0Eh
	movlw	high(0FC31h)
	movwf	(0+(_Cnt)+0Eh)+1
	line	35
	
l7629:	
;Register.c: 35: Cnt.warn = 0;
	clrf	0+(_Cnt)+05h
	line	36
	
l7631:	
;Register.c: 36: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	37
	
l7633:	
;Register.c: 37: Cnt.xnum = 0;
	clrf	0+(_Cnt)+07h
	clrf	1+(_Cnt)+07h
	line	38
	
l7635:	
;Register.c: 38: Cnt.keydn = 0;
	clrf	0+(_Cnt)+06h
	line	39
	
l7637:	
;Register.c: 39: Cnt.temp1 = 0;
	clrf	0+(_Cnt)+0Ah
	clrf	1+(_Cnt)+0Ah
	line	40
	
l7639:	
;Register.c: 40: Cnt.temp2 = 0;
	clrf	0+(_Cnt)+0Ch
	clrf	1+(_Cnt)+0Ch
	line	41
	
l7641:	
;Register.c: 41: Cnt.LEDcount = 0;
	clrf	0+(_Cnt)+02h
	line	42
	
l7643:	
;Register.c: 42: Cnt.LEDtemp = 0;
	clrf	0+(_Cnt)+03h
	line	43
	
l7645:	
;Register.c: 43: Cnt.ChgCount = 0;
	clrf	0+(_Cnt)+012h
	clrf	1+(_Cnt)+012h
	line	44
	
l7647:	
;Register.c: 44: Cnt.Chgdelay = 0;
	clrf	0+(_Cnt)+014h
	clrf	1+(_Cnt)+014h
	line	45
	
l7649:	
;Register.c: 45: Cnt.Check = 0;
	clrf	0+(_Cnt)+016h
	clrf	1+(_Cnt)+016h
	line	46
	
l7651:	
;Register.c: 46: Cnt.Chgdelay1 = 0;
	clrf	0+(_Cnt)+018h
	clrf	1+(_Cnt)+018h
	line	47
	
l7653:	
;Register.c: 47: Cnt.waitCount = 0;
	clrf	0+(_Cnt)+01Ah
	clrf	1+(_Cnt)+01Ah
	line	48
	
l7655:	
;Register.c: 48: Cnt.value_led = 0;
	clrf	0+(_Cnt)+04h
	line	49
	
l7657:	
;Register.c: 49: Cnt.DelayTime = 0;
	clrf	(_Cnt)
	clrf	(_Cnt+1)
	line	50
	
l6365:	
	return
	opt stack 0
GLOBAL	__end_of_Variates
	__end_of_Variates:
;; =============== function _Variates ends ============

	signat	_Variates,88
	global	_delay
psect	text490,local,class=CODE,delta=2
global __ptext490
__ptext490:

;; *************** function _delay *****************
;; Defined at:
;;		line 12 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
;; Parameters:    Size  Location     Type
;;  nms             2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMMON] unsigned int 
;;  t               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_powerInit_deal
;;		_power
;;		_smoke_deal
;;		_warn_deal
;;		_charge_deal
;; This function uses a non-reentrant model
;;
psect	text490
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\main.c"
	line	12
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 13
; Regs used in _delay: [wreg+status,2+status,0]
	line	13
	
l7607:	
	line	15
;main.c: 14: uint i;
;main.c: 15: for(i=0;i<nms;i++)
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l7621
	line	16
	
l7609:	
;main.c: 16: for(t=0;t<250;t++);
	clrf	(delay@t)
	
l7615:	
	incf	(delay@t),f
	
l7617:	
	movlw	(0FAh)
	subwf	(delay@t),w
	skipc
	goto	u991
	goto	u990
u991:
	goto	l7615
u990:
	line	15
	
l7619:	
	incf	(delay@i),f
	skipnz
	incf	(delay@i+1),f
	
l7621:	
	movf	(delay@nms+1),w
	subwf	(delay@i+1),w
	skipz
	goto	u1005
	movf	(delay@nms),w
	subwf	(delay@i),w
u1005:
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l7609
u1000:
	line	17
	
l3161:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_itr
psect	intentry

;; *************** function _itr *****************
;; Defined at:
;;		line 89 in file "D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\Register.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1E/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"D:\DATA\PROJECT\TPS-050040BCA-00_A-SV101\Source\Register.c"
	line	89
	global	__size_of_itr
	__size_of_itr	equ	__end_of_itr-_itr
	
_itr:	
	opt	stack 11
; Regs used in _itr: [wreg+status,2+status,0]
psect	intentry
	pagesel	$
	line	90
	
i1l7687:	
;Register.c: 90: if(TMR1IE&&TMR1IF)
	movlb 1	; select bank1
	btfss	(1160/8)^080h,(1160)&7
	goto	u101_21
	goto	u101_20
u101_21:
	goto	i1l6392
u101_20:
	
i1l7689:	
	movlb 0	; select bank0
	btfss	(136/8),(136)&7
	goto	u102_21
	goto	u102_20
u102_21:
	goto	i1l6392
u102_20:
	line	92
	
i1l7691:	
;Register.c: 91: {
;Register.c: 92: TMR1IF = 0;
	bcf	(136/8),(136)&7
	line	93
	
i1l7693:	
;Register.c: 93: TMR1L = (char)Cnt.Reload;
	movf	0+(_Cnt)+0Eh,w
	movwf	(22)	;volatile
	line	94
;Register.c: 94: TMR1H = (char)(Cnt.Reload>>8);
	movf	1+(_Cnt)+0Eh,w
	movwf	(23)	;volatile
	line	96
	
i1l7695:	
;Register.c: 96: if((run.press_bit==0)&&(++Cnt.Count>=2500))
	btfsc	0+(_run)+01h,2
	goto	u103_21
	goto	u103_20
u103_21:
	goto	i1l7703
u103_20:
	
i1l7697:	
	incf	0+(_Cnt)+010h,f
	skipnz
	incf	1+(_Cnt)+010h,f
	movlw	high(09C4h)
	subwf	(1+(_Cnt)+010h),w
	movlw	low(09C4h)
	skipnz
	subwf	(0+(_Cnt)+010h),w
	skipc
	goto	u104_21
	goto	u104_20
u104_21:
	goto	i1l7703
u104_20:
	line	98
	
i1l7699:	
;Register.c: 97: {
;Register.c: 98: run.sleep_bit = 1;
	bsf	0+(_run)+01h,3
	line	99
	
i1l7701:	
;Register.c: 99: Cnt.Count = 0;
	clrf	0+(_Cnt)+010h
	clrf	1+(_Cnt)+010h
	line	101
	
i1l7703:	
;Register.c: 100: }
;Register.c: 101: if(!run.smoke_bit&&++Cnt.DelayTime > 450)
	btfsc	(_run),4
	goto	u105_21
	goto	u105_20
u105_21:
	goto	i1l7709
u105_20:
	
i1l7705:	
	incf	(_Cnt),f
	skipnz
	incf	(_Cnt+1),f
	movlw	high(01C3h)
	subwf	((_Cnt+1)),w
	movlw	low(01C3h)
	skipnz
	subwf	((_Cnt)),w
	skipc
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l7709
u106_20:
	line	103
	
i1l7707:	
;Register.c: 102: {
;Register.c: 103: Cnt.DelayTime = 0;
	clrf	(_Cnt)
	clrf	(_Cnt+1)
	line	104
;Register.c: 104: Cnt.keydn = 0;
	clrf	0+(_Cnt)+06h
	line	109
	
i1l7709:	
;Register.c: 105: }
;Register.c: 109: if(run.smoke_bit&&++Cnt.temp2>=12000)
	btfss	(_run),4
	goto	u107_21
	goto	u107_20
u107_21:
	goto	i1l6374
u107_20:
	
i1l7711:	
	incf	0+(_Cnt)+0Ch,f
	skipnz
	incf	1+(_Cnt)+0Ch,f
	movlw	high(02EE0h)
	subwf	(1+(_Cnt)+0Ch),w
	movlw	low(02EE0h)
	skipnz
	subwf	(0+(_Cnt)+0Ch),w
	skipc
	goto	u108_21
	goto	u108_20
u108_21:
	goto	i1l6374
u108_20:
	line	111
	
i1l7713:	
;Register.c: 110: {
;Register.c: 111: run.warn_bit = 1;
	bsf	(_run),3
	line	112
;Register.c: 112: Cnt.warn = 1;
	clrf	0+(_Cnt)+05h
	incf	0+(_Cnt)+05h,f
	line	113
	
i1l7715:	
;Register.c: 113: Cnt.temp2 = 0;
	clrf	0+(_Cnt)+0Ch
	clrf	1+(_Cnt)+0Ch
	line	114
;Register.c: 114: }
	goto	i1l7719
	line	115
	
i1l6374:	
;Register.c: 115: else if(!run.press_bit)
	btfsc	0+(_run)+01h,2
	goto	u109_21
	goto	u109_20
u109_21:
	goto	i1l7719
u109_20:
	goto	i1l7715
	line	121
	
i1l7719:	
;Register.c: 118: }
;Register.c: 121: if(run.key&&(++Cnt.LEDtemp > 35))
	btfss	(_run),6
	goto	u110_21
	goto	u110_20
u110_21:
	goto	i1l6377
u110_20:
	
i1l7721:	
	movlw	(024h)
	incf	0+(_Cnt)+03h,f
	subwf	(0+(_Cnt)+03h),w
	skipc
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l6377
u111_20:
	line	123
	
i1l7723:	
;Register.c: 122: {
;Register.c: 123: if( Cnt.value_led < 50)
	movlw	(032h)
	subwf	0+(_Cnt)+04h,w
	skipnc
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l6378
u112_20:
	line	125
	
i1l7725:	
;Register.c: 124: {
;Register.c: 125: Cnt.value_led ++;
	incf	0+(_Cnt)+04h,f
	line	126
;Register.c: 126: }
	goto	i1l7727
	line	127
	
i1l6378:	
	line	128
;Register.c: 127: else
;Register.c: 128: run.show_bit = 0;
	bcf	(_run),1
	line	129
	
i1l7727:	
;Register.c: 129: Cnt.LEDtemp = 0;
	clrf	0+(_Cnt)+03h
	line	130
;Register.c: 130: }
	goto	i1l7737
	line	131
	
i1l6377:	
	line	132
;Register.c: 131: else
;Register.c: 132: if(!run.smoke_bit&&(++Cnt.LEDtemp > 15))
	btfsc	(_run),4
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l7737
u113_20:
	
i1l7729:	
	movlw	(010h)
	incf	0+(_Cnt)+03h,f
	subwf	(0+(_Cnt)+03h),w
	skipc
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l7737
u114_20:
	line	134
	
i1l7731:	
;Register.c: 133: {
;Register.c: 134: if( Cnt.value_led > 0)
	movf	0+(_Cnt)+04h,w
	skipz
	goto	u115_20
	goto	i1l6382
u115_20:
	line	136
	
i1l7733:	
;Register.c: 135: {
;Register.c: 136: Cnt.value_led --;
	decf	0+(_Cnt)+04h,f
	line	137
;Register.c: 137: }
	goto	i1l7727
	line	138
	
i1l6382:	
	line	139
;Register.c: 138: else
;Register.c: 139: run.close_bit = 0;
	bcf	(_run),0
	goto	i1l7727
	line	143
	
i1l7737:	
;Register.c: 141: }
;Register.c: 143: if(run.power_bit&&!run.warn_bit&&!run.poweroff_bit)
	btfss	0+(_run)+01h,1
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l6384
u116_20:
	
i1l7739:	
	btfsc	(_run),3
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l6384
u117_20:
	
i1l7741:	
	btfsc	(_run),7
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l6384
u118_20:
	line	145
	
i1l7743:	
;Register.c: 144: {
;Register.c: 145: Cnt.LEDcount ++ ;
	incf	0+(_Cnt)+02h,f
	line	146
	
i1l7745:	
;Register.c: 146: if( Cnt.LEDcount>= 15)
	movlw	(0Fh)
	subwf	0+(_Cnt)+02h,w
	skipc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l7749
u119_20:
	line	147
	
i1l7747:	
;Register.c: 147: Cnt.LEDcount = 1;
	clrf	0+(_Cnt)+02h
	incf	0+(_Cnt)+02h,f
	line	148
	
i1l7749:	
;Register.c: 148: if( Cnt.LEDcount < Cnt.value_led)
	movf	0+(_Cnt)+04h,w
	subwf	0+(_Cnt)+02h,w
	skipnc
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l6386
u120_20:
	line	150
	
i1l7751:	
;Register.c: 149: {
;Register.c: 150: if(run.LEDB_bit)
	btfss	(_run),2
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l6387
u121_20:
	line	152
	
i1l7753:	
;Register.c: 151: {
;Register.c: 152: RA4 = 0;
	bcf	(100/8),(100)&7
	line	153
;Register.c: 153: RA5 = 1;
	bsf	(101/8),(101)&7
	line	154
;Register.c: 154: }
	goto	i1l6384
	line	155
	
i1l6387:	
	line	157
;Register.c: 155: else
;Register.c: 156: {
;Register.c: 157: RA4 = 1;
	bsf	(100/8),(100)&7
	line	158
;Register.c: 158: RA5 = 0;
	bcf	(101/8),(101)&7
	goto	i1l6384
	line	161
	
i1l6386:	
	line	163
;Register.c: 161: else
;Register.c: 162: {
;Register.c: 163: RA4 = 0;
	bcf	(100/8),(100)&7
	line	164
;Register.c: 164: RA5 = 0;
	bcf	(101/8),(101)&7
	line	166
	
i1l6384:	
	line	174
;Register.c: 165: }
;Register.c: 166: }
;Register.c: 174: if(run.sec_bit&&++Cnt.ChgCount>=2000)
	btfss	0+(_run)+01h,5
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l7761
u122_20:
	
i1l7755:	
	incf	0+(_Cnt)+012h,f
	skipnz
	incf	1+(_Cnt)+012h,f
	movlw	high(07D0h)
	subwf	(1+(_Cnt)+012h),w
	movlw	low(07D0h)
	skipnz
	subwf	(0+(_Cnt)+012h),w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l7761
u123_20:
	line	176
	
i1l7757:	
;Register.c: 175: {
;Register.c: 176: Cnt.ChgCount = 0;
	clrf	0+(_Cnt)+012h
	clrf	1+(_Cnt)+012h
	line	177
	
i1l7759:	
;Register.c: 177: run.finish_bit = 1;
	bsf	0+(_run)+01h,7
	line	179
	
i1l7761:	
;Register.c: 178: }
;Register.c: 179: if(run.finish1_bit&&++Cnt.Chgdelay1>=1500)
	btfss	0+(_run)+02h,2
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l6392
u124_20:
	
i1l7763:	
	incf	0+(_Cnt)+018h,f
	skipnz
	incf	1+(_Cnt)+018h,f
	movlw	high(05DCh)
	subwf	(1+(_Cnt)+018h),w
	movlw	low(05DCh)
	skipnz
	subwf	(0+(_Cnt)+018h),w
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l6392
u125_20:
	line	181
	
i1l7765:	
;Register.c: 180: {
;Register.c: 181: run.finish1_bit = 0;
	bcf	0+(_run)+02h,2
	line	182
	
i1l7767:	
;Register.c: 182: Cnt.Chgdelay1 = 0;
	clrf	0+(_Cnt)+018h
	clrf	1+(_Cnt)+018h
	line	187
	
i1l6392:	
	retfie
	opt stack 0
GLOBAL	__end_of_itr
	__end_of_itr:
;; =============== function _itr ends ============

	signat	_itr,88
psect	intentry
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
