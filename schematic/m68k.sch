EESchema Schematic File Version 2
LIBS:m68k-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:custom
LIBS:switches
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "M68k Computer"
Date "2017-08-04"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L M68SEC000 U1
U 1 1 59880DCB
P 2250 3600
F 0 "U1" H 2650 6000 50  0000 C CNN
F 1 "M68SEC000" H 2700 1600 50  0000 C CNN
F 2 "Housings_QFP:TQFP-64_14x14mm_Pitch0.8mm" H 2250 3600 50  0001 C CNN
F 3 "" H 2250 3600 50  0001 C CNN
	1    2250 3600
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 59880DD2
P 1150 1550
F 0 "R3" H 1180 1570 50  0000 L CNN
F 1 "10k" H 1180 1510 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 1150 1550 50  0001 C CNN
F 3 "" H 1150 1550 50  0001 C CNN
	1    1150 1550
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR01
U 1 1 59880DD9
P 1000 1550
F 0 "#PWR01" H 1000 1400 50  0001 C CNN
F 1 "+3V3" H 1000 1690 50  0000 C CNN
F 2 "" H 1000 1550 50  0001 C CNN
F 3 "" H 1000 1550 50  0001 C CNN
	1    1000 1550
	0    -1   -1   0   
$EndComp
Text Label 1250 4000 2    60   ~ 0
~DTACK
$Comp
L R_Small R4
U 1 1 59880DE0
P 1150 3800
F 0 "R4" H 1180 3820 50  0000 L CNN
F 1 "1k" H 1180 3760 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 1150 3800 50  0001 C CNN
F 3 "" H 1150 3800 50  0001 C CNN
	1    1150 3800
	0    1    1    0   
$EndComp
Text Label 900  3800 2    60   ~ 0
R/~W
Text Label 1250 4800 2    60   ~ 0
~HALT
Text Label 1250 4900 2    60   ~ 0
~RESET
Text Label 1250 3700 2    60   ~ 0
~LDS
Text Label 1250 3600 2    60   ~ 0
~UDS
Text Label 1250 3500 2    60   ~ 0
~AS
Text Label 1250 2300 2    60   ~ 0
~BG
Text Label 1250 2400 2    60   ~ 0
~BR
Text Label 1250 1400 2    60   ~ 0
CLK_68k
Text Label 1250 1800 2    60   ~ 0
~IPL0
Text Label 1250 1900 2    60   ~ 0
~IPL1
Text Label 1250 2000 2    60   ~ 0
~IPL2
Text Label 1250 2100 2    60   ~ 0
~AVEC
Text Label 1250 4200 2    60   ~ 0
~BERR
$Comp
L +3V3 #PWR02
U 1 1 59880DF8
P 2150 750
F 0 "#PWR02" H 2150 600 50  0001 C CNN
F 1 "+3V3" H 2150 890 50  0000 C CNN
F 2 "" H 2150 750 50  0001 C CNN
F 3 "" H 2150 750 50  0001 C CNN
	1    2150 750 
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 59880DFE
P 1850 850
F 0 "C1" H 1860 920 50  0000 L CNN
F 1 "100n" H 1860 770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1850 850 50  0001 C CNN
F 3 "" H 1850 850 50  0001 C CNN
	1    1850 850 
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C2
U 1 1 59880E05
P 2600 850
F 0 "C2" H 2610 920 50  0000 L CNN
F 1 "100n" H 2610 770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2600 850 50  0001 C CNN
F 3 "" H 2600 850 50  0001 C CNN
	1    2600 850 
	0    1    1    0   
$EndComp
$Comp
L GND #PWR03
U 1 1 59880E0C
P 2800 950
F 0 "#PWR03" H 2800 700 50  0001 C CNN
F 1 "GND" H 2800 800 50  0000 C CNN
F 2 "" H 2800 950 50  0001 C CNN
F 3 "" H 2800 950 50  0001 C CNN
	1    2800 950 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 59880E12
P 1650 950
F 0 "#PWR04" H 1650 700 50  0001 C CNN
F 1 "GND" H 1650 800 50  0000 C CNN
F 2 "" H 1650 950 50  0001 C CNN
F 3 "" H 1650 950 50  0001 C CNN
	1    1650 950 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR05
U 1 1 598810F6
P 1350 5400
F 0 "#PWR05" H 1350 5250 50  0001 C CNN
F 1 "+3V3" H 1350 5540 50  0000 C CNN
F 2 "" H 1350 5400 50  0001 C CNN
F 3 "" H 1350 5400 50  0001 C CNN
	1    1350 5400
	1    0    0    -1  
$EndComp
Text Label 900  5450 2    60   ~ 0
~DTACK
Text Label 900  5550 2    60   ~ 0
~BG
Text Label 900  5650 2    60   ~ 0
~BR
Text Label 900  5750 2    60   ~ 0
~HALT
Text Label 900  5850 2    60   ~ 0
~RESET
Text Label 900  6050 2    60   ~ 0
~BERR
Text Label 900  6350 2    60   ~ 0
~IPL0
Text Label 900  6250 2    60   ~ 0
~IPL1
Text Label 900  6150 2    60   ~ 0
~IPL2
Text Label 900  5950 2    60   ~ 0
~AVEC
Entry Wire Line
	4450 1250 4550 1350
Entry Wire Line
	4450 1350 4550 1450
Entry Wire Line
	4450 1450 4550 1550
Entry Wire Line
	4450 1550 4550 1650
Entry Wire Line
	4450 1650 4550 1750
Entry Wire Line
	4450 1750 4550 1850
Entry Wire Line
	4450 1850 4550 1950
Entry Wire Line
	4450 1950 4550 2050
Entry Wire Line
	4450 2050 4550 2150
Entry Wire Line
	4450 2150 4550 2250
Entry Wire Line
	4450 2250 4550 2350
Entry Wire Line
	4450 2350 4550 2450
Entry Wire Line
	4450 2450 4550 2550
Entry Wire Line
	4450 2550 4550 2650
Entry Wire Line
	4450 2650 4550 2750
Entry Wire Line
	4450 2750 4550 2850
Entry Wire Line
	4450 2850 4550 2950
Entry Wire Line
	4450 2950 4550 3050
Entry Wire Line
	4450 3050 4550 3150
Text Label 4550 1350 0    60   ~ 0
A1
Text Label 4550 1450 0    60   ~ 0
A2
Text Label 4550 1550 0    60   ~ 0
A3
Text Label 4550 1650 0    60   ~ 0
A4
Text Label 4550 1750 0    60   ~ 0
A5
Text Label 4550 1850 0    60   ~ 0
A6
Text Label 4550 1950 0    60   ~ 0
A7
Text Label 4550 2050 0    60   ~ 0
A8
Text Label 4550 2150 0    60   ~ 0
A9
Text Label 4550 2250 0    60   ~ 0
A10
Text Label 4550 2350 0    60   ~ 0
A11
Text Label 4550 2450 0    60   ~ 0
A12
Text Label 4550 2550 0    60   ~ 0
A13
Text Label 4550 2650 0    60   ~ 0
A14
Text Label 4550 2750 0    60   ~ 0
A15
Text Label 4550 2850 0    60   ~ 0
A16
Text Label 4550 2950 0    60   ~ 0
A17
Text Label 4550 3050 0    60   ~ 0
A18
Text Label 4550 3150 0    60   ~ 0
A19
Text Label 4700 3300 2    60   ~ 0
~RAM_CE
Text Label 4700 3500 2    60   ~ 0
~OE
$Comp
L +3V3 #PWR06
U 1 1 59881A08
P 5850 3200
F 0 "#PWR06" H 5850 3050 50  0001 C CNN
F 1 "+3V3" H 5850 3340 50  0000 C CNN
F 2 "" H 5850 3200 50  0001 C CNN
F 3 "" H 5850 3200 50  0001 C CNN
	1    5850 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 59881A0E
P 5850 3800
F 0 "#PWR07" H 5850 3550 50  0001 C CNN
F 1 "GND" H 5850 3650 50  0000 C CNN
F 2 "" H 5850 3800 50  0001 C CNN
F 3 "" H 5850 3800 50  0001 C CNN
	1    5850 3800
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 59881A14
P 5850 3500
F 0 "C3" H 5860 3570 50  0000 L CNN
F 1 "100n" H 5860 3420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5850 3500 50  0001 C CNN
F 3 "" H 5850 3500 50  0001 C CNN
	1    5850 3500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 59881A6F
P 9500 3350
F 0 "C10" H 9510 3420 50  0000 L CNN
F 1 "100n" H 9510 3270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9500 3350 50  0001 C CNN
F 3 "" H 9500 3350 50  0001 C CNN
	1    9500 3350
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C11
U 1 1 59881A76
P 9500 3500
F 0 "C11" H 9510 3570 50  0000 L CNN
F 1 "100n" H 9510 3420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9500 3500 50  0001 C CNN
F 3 "" H 9500 3500 50  0001 C CNN
	1    9500 3500
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C12
U 1 1 59881A7D
P 9500 3650
F 0 "C12" H 9510 3720 50  0000 L CNN
F 1 "100n" H 9510 3570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9500 3650 50  0001 C CNN
F 3 "" H 9500 3650 50  0001 C CNN
	1    9500 3650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR08
U 1 1 59881A84
P 9350 4100
F 0 "#PWR08" H 9350 3850 50  0001 C CNN
F 1 "GND" H 9350 3950 50  0000 C CNN
F 2 "" H 9350 4100 50  0001 C CNN
F 3 "" H 9350 4100 50  0001 C CNN
	1    9350 4100
	1    0    0    -1  
$EndComp
Text Label 9550 2250 2    60   ~ 0
TCK
Text Label 9550 2350 2    60   ~ 0
TDI
Text Label 9550 2450 2    60   ~ 0
TDO
Text Label 9550 2550 2    60   ~ 0
TMS
Text Label 10850 3350 0    60   ~ 0
A20
Text Label 10850 3450 0    60   ~ 0
A21
Text Label 10850 4050 0    60   ~ 0
~BERR
Text Label 10850 1450 0    60   ~ 0
R/~W
Text Label 10850 3950 0    60   ~ 0
A22
Text Label 10850 3850 0    60   ~ 0
A23
Text Label 4700 3400 2    60   ~ 0
R/~W
Text Label 10850 1550 0    60   ~ 0
~OE
Text Label 10850 3750 0    60   ~ 0
~RAM_CE
Text Label 10850 1750 0    60   ~ 0
~LDS
Text Label 10850 1850 0    60   ~ 0
~UDS
Text Label 9750 1550 2    60   ~ 0
CLK_50MHz
$Comp
L CONN_01X06 J3
U 1 1 59881DD2
P 4850 6750
F 0 "J3" H 4850 7100 50  0000 C CNN
F 1 "JTAG" V 4950 6750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 4850 6750 50  0001 C CNN
F 3 "" H 4850 6750 50  0001 C CNN
	1    4850 6750
	1    0    0    -1  
$EndComp
Text Label 4650 6500 2    60   ~ 0
+3V3
Text Label 4650 6600 2    60   ~ 0
GND
Text Label 4650 6700 2    60   ~ 0
TCK
Text Label 4650 6800 2    60   ~ 0
TDO
Text Label 4650 6900 2    60   ~ 0
TDI
Text Label 4650 7000 2    60   ~ 0
TMS
$Comp
L GND #PWR09
U 1 1 59883125
P 2250 5850
F 0 "#PWR09" H 2250 5600 50  0001 C CNN
F 1 "GND" H 2250 5700 50  0000 C CNN
F 2 "" H 2250 5850 50  0001 C CNN
F 3 "" H 2250 5850 50  0001 C CNN
	1    2250 5850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 J2
U 1 1 59883D86
P 6150 6850
F 0 "J2" H 6150 7050 50  0000 C CNN
F 1 "CONN_01X03" V 6250 6850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6150 6850 50  0001 C CNN
F 3 "" H 6150 6850 50  0001 C CNN
	1    6150 6850
	1    0    0    -1  
$EndComp
Text Label 5950 6850 2    60   ~ 0
CLK_68k
Text Label 5950 6750 2    60   ~ 0
CLK_FROM_CPLD
Text Label 5950 6950 2    60   ~ 0
CLK_16MHz
$Comp
L +5V #PWR010
U 1 1 5988820F
P 4450 4650
F 0 "#PWR010" H 4450 4500 50  0001 C CNN
F 1 "+5V" H 4450 4790 50  0000 C CNN
F 2 "" H 4450 4650 50  0001 C CNN
F 3 "" H 4450 4650 50  0001 C CNN
	1    4450 4650
	1    0    0    -1  
$EndComp
Text Label 5450 4750 0    60   ~ 0
+3V3
$Comp
L C_Small C6
U 1 1 598882E4
P 4450 4950
F 0 "C6" H 4460 5020 50  0000 L CNN
F 1 "C_Small" H 4460 4870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4450 4950 50  0001 C CNN
F 3 "" H 4450 4950 50  0001 C CNN
	1    4450 4950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 598887CF
P 4900 5150
F 0 "#PWR011" H 4900 4900 50  0001 C CNN
F 1 "GND" H 4900 5000 50  0000 C CNN
F 2 "" H 4900 5150 50  0001 C CNN
F 3 "" H 4900 5150 50  0001 C CNN
	1    4900 5150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 59889671
P 5350 4950
F 0 "C7" H 5360 5020 50  0000 L CNN
F 1 "C_Small" H 5360 4870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5350 4950 50  0001 C CNN
F 3 "" H 5350 4950 50  0001 C CNN
	1    5350 4950
	1    0    0    -1  
$EndComp
Text Label 10850 1350 0    60   ~ 0
~DTACK
$Comp
L AT28BV64 U4
U 1 1 5988B65F
P 8000 1900
F 0 "U4" H 8200 2600 60  0000 C CNN
F 1 "AT28BV64" H 8000 1100 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-28W_7.5x17.9mm_Pitch1.27mm" H 7950 1250 60  0001 C CNN
F 3 "" H 7950 1250 60  0001 C CNN
	1    8000 1900
	1    0    0    -1  
$EndComp
Text Label 7550 2300 2    60   ~ 0
D0
Text Label 7550 2400 2    60   ~ 0
D1
Text Label 7550 2500 2    60   ~ 0
D2
Text Label 8450 2600 0    60   ~ 0
D3
Text Label 8450 2500 0    60   ~ 0
D4
Text Label 8450 2400 0    60   ~ 0
D5
Text Label 8450 2300 0    60   ~ 0
D6
Text Label 8450 2200 0    60   ~ 0
D7
$Comp
L GND #PWR012
U 1 1 5988BD88
P 7550 2600
F 0 "#PWR012" H 7550 2350 50  0001 C CNN
F 1 "GND" H 7550 2450 50  0000 C CNN
F 2 "" H 7550 2600 50  0001 C CNN
F 3 "" H 7550 2600 50  0001 C CNN
	1    7550 2600
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR013
U 1 1 5988C00B
P 8550 1200
F 0 "#PWR013" H 8550 1050 50  0001 C CNN
F 1 "+3V3" H 8550 1340 50  0000 C CNN
F 2 "" H 8550 1200 50  0001 C CNN
F 3 "" H 8550 1200 50  0001 C CNN
	1    8550 1200
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 5988C1DC
P 8800 1300
F 0 "C8" H 8810 1370 50  0000 L CNN
F 1 "100n" H 8810 1220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8800 1300 50  0001 C CNN
F 3 "" H 8800 1300 50  0001 C CNN
	1    8800 1300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR014
U 1 1 5988C278
P 8900 1300
F 0 "#PWR014" H 8900 1050 50  0001 C CNN
F 1 "GND" H 8900 1150 50  0000 C CNN
F 2 "" H 8900 1300 50  0001 C CNN
F 3 "" H 8900 1300 50  0001 C CNN
	1    8900 1300
	0    -1   -1   0   
$EndComp
Text Label 8450 1400 0    60   ~ 0
R/~W
Text Label 8450 1900 0    60   ~ 0
~OE
Text Label 8450 2100 0    60   ~ 0
~EEPROM_LDS
$Comp
L AT28BV64 U5
U 1 1 5988D483
P 8000 3700
F 0 "U5" H 8200 4400 60  0000 C CNN
F 1 "AT28BV64" H 8000 2900 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-28W_7.5x17.9mm_Pitch1.27mm" H 7950 3050 60  0001 C CNN
F 3 "" H 7950 3050 60  0001 C CNN
	1    8000 3700
	1    0    0    -1  
$EndComp
Text Label 7550 4100 2    60   ~ 0
D8
Text Label 7550 4200 2    60   ~ 0
D9
Text Label 7550 4300 2    60   ~ 0
D10
Text Label 8450 4400 0    60   ~ 0
D11
Text Label 8450 4300 0    60   ~ 0
D12
Text Label 8450 4200 0    60   ~ 0
D13
Text Label 8450 4100 0    60   ~ 0
D14
Text Label 8450 4000 0    60   ~ 0
D15
$Comp
L GND #PWR015
U 1 1 5988D49F
P 7550 4400
F 0 "#PWR015" H 7550 4150 50  0001 C CNN
F 1 "GND" H 7550 4250 50  0000 C CNN
F 2 "" H 7550 4400 50  0001 C CNN
F 3 "" H 7550 4400 50  0001 C CNN
	1    7550 4400
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR016
U 1 1 5988D4A6
P 8550 3000
F 0 "#PWR016" H 8550 2850 50  0001 C CNN
F 1 "+3V3" H 8550 3140 50  0000 C CNN
F 2 "" H 8550 3000 50  0001 C CNN
F 3 "" H 8550 3000 50  0001 C CNN
	1    8550 3000
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 5988D4AE
P 8800 3100
F 0 "C9" H 8810 3170 50  0000 L CNN
F 1 "100n" H 8810 3020 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8800 3100 50  0001 C CNN
F 3 "" H 8800 3100 50  0001 C CNN
	1    8800 3100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR017
U 1 1 5988D4B5
P 8900 3100
F 0 "#PWR017" H 8900 2850 50  0001 C CNN
F 1 "GND" H 8900 2950 50  0000 C CNN
F 2 "" H 8900 3100 50  0001 C CNN
F 3 "" H 8900 3100 50  0001 C CNN
	1    8900 3100
	0    -1   -1   0   
$EndComp
Text Label 8450 3200 0    60   ~ 0
R/~W
Text Label 8450 3700 0    60   ~ 0
~OE
Text Label 8450 3900 0    60   ~ 0
~EEPROM_UDS
Text Label 10850 3550 0    60   ~ 0
~EEPROM_LDS
Text Label 10850 3650 0    60   ~ 0
~EEPROM_UDS
Text Label 10850 1650 0    60   ~ 0
~AS
Text Label 10850 2350 0    60   ~ 0
CLK_FROM_CPLD
Text Label 7550 2200 2    60   ~ 0
A1
Text Label 7550 2100 2    60   ~ 0
A2
Text Label 7550 2000 2    60   ~ 0
A3
Text Label 7550 1900 2    60   ~ 0
A4
Text Label 7550 1800 2    60   ~ 0
A5
Text Label 7550 1700 2    60   ~ 0
A6
Text Label 7550 1600 2    60   ~ 0
A7
Text Label 7550 1500 2    60   ~ 0
A8
Text Label 8450 1600 0    60   ~ 0
A9
Text Label 8450 1700 0    60   ~ 0
A10
Text Label 8450 2000 0    60   ~ 0
A11
Text Label 7550 1400 2    60   ~ 0
A13
Text Label 7550 4000 2    60   ~ 0
A1
Text Label 7550 3900 2    60   ~ 0
A2
Text Label 7550 3800 2    60   ~ 0
A3
Text Label 7550 3700 2    60   ~ 0
A4
Text Label 7550 3600 2    60   ~ 0
A5
Text Label 7550 3500 2    60   ~ 0
A6
Text Label 7550 3400 2    60   ~ 0
A7
Text Label 7550 3300 2    60   ~ 0
A8
Text Label 7550 3200 2    60   ~ 0
A13
Text Label 8450 1800 0    60   ~ 0
A12
Text Label 8450 3400 0    60   ~ 0
A9
Text Label 8450 3500 0    60   ~ 0
A10
Text Label 8450 3800 0    60   ~ 0
A11
Text Label 8450 3600 0    60   ~ 0
A12
$Comp
L XO91 U8
U 1 1 5989962F
P 7800 5350
F 0 "U8" H 7950 5500 60  0000 C CNN
F 1 "XO91-16" H 7900 5200 60  0000 C CNN
F 2 "Crystals:Crystal_SMD_EuroQuartz_MQ-4pin_7.0x5.0mm_HandSoldering" H 7800 5350 60  0001 C CNN
F 3 "" H 7800 5350 60  0001 C CNN
	1    7800 5350
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR018
U 1 1 59899862
P 7400 5050
F 0 "#PWR018" H 7400 4900 50  0001 C CNN
F 1 "+3V3" H 7400 5190 50  0000 C CNN
F 2 "" H 7400 5050 50  0001 C CNN
F 3 "" H 7400 5050 50  0001 C CNN
	1    7400 5050
	1    0    0    -1  
$EndComp
$Comp
L R_Small R13
U 1 1 59899C39
P 8300 5300
F 0 "R13" H 8330 5320 50  0000 L CNN
F 1 "10k" H 8330 5260 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8300 5300 50  0001 C CNN
F 3 "" H 8300 5300 50  0001 C CNN
	1    8300 5300
	0    -1   -1   0   
$EndComp
Text Label 8200 5400 0    60   ~ 0
CLK_16MHz
$Comp
L C_Small C13
U 1 1 5989A1DD
P 7200 5300
F 0 "C13" H 7210 5370 50  0000 L CNN
F 1 "100n" H 7210 5220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7200 5300 50  0001 C CNN
F 3 "" H 7200 5300 50  0001 C CNN
	1    7200 5300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR019
U 1 1 5989A4A2
P 7400 5500
F 0 "#PWR019" H 7400 5250 50  0001 C CNN
F 1 "GND" H 7400 5350 50  0000 C CNN
F 2 "" H 7400 5500 50  0001 C CNN
F 3 "" H 7400 5500 50  0001 C CNN
	1    7400 5500
	1    0    0    -1  
$EndComp
$Comp
L XO91 U9
U 1 1 5989B92D
P 7800 6200
F 0 "U9" H 7950 6350 60  0000 C CNN
F 1 "XO91-50" H 7900 6050 60  0000 C CNN
F 2 "Crystals:Crystal_SMD_EuroQuartz_MQ-4pin_7.0x5.0mm_HandSoldering" H 7800 6200 60  0001 C CNN
F 3 "" H 7800 6200 60  0001 C CNN
	1    7800 6200
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR020
U 1 1 5989B934
P 7400 5900
F 0 "#PWR020" H 7400 5750 50  0001 C CNN
F 1 "+3V3" H 7400 6040 50  0000 C CNN
F 2 "" H 7400 5900 50  0001 C CNN
F 3 "" H 7400 5900 50  0001 C CNN
	1    7400 5900
	1    0    0    -1  
$EndComp
$Comp
L R_Small R14
U 1 1 5989B93D
P 8300 6150
F 0 "R14" H 8330 6170 50  0000 L CNN
F 1 "10k" H 8330 6110 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8300 6150 50  0001 C CNN
F 3 "" H 8300 6150 50  0001 C CNN
	1    8300 6150
	0    -1   -1   0   
$EndComp
Text Label 8200 6250 0    60   ~ 0
CLK_50MHz
$Comp
L C_Small C14
U 1 1 5989B949
P 7200 6150
F 0 "C14" H 7210 6220 50  0000 L CNN
F 1 "100n" H 7210 6070 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7200 6150 50  0001 C CNN
F 3 "" H 7200 6150 50  0001 C CNN
	1    7200 6150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR021
U 1 1 5989B954
P 7400 6350
F 0 "#PWR021" H 7400 6100 50  0001 C CNN
F 1 "GND" H 7400 6200 50  0000 C CNN
F 2 "" H 7400 6350 50  0001 C CNN
F 3 "" H 7400 6350 50  0001 C CNN
	1    7400 6350
	1    0    0    -1  
$EndComp
$Comp
L LM1084IT-3.3/NOPB U3
U 1 1 5989CFCC
P 4900 4800
F 0 "U3" H 5100 4600 50  0000 C CNN
F 1 "LM1084IT-3.3/NOPB" H 4600 5000 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Horizontal" H 4900 4900 50  0001 C CIN
F 3 "" H 4900 4800 50  0001 C CNN
	1    4900 4800
	1    0    0    -1  
$EndComp
Text Label 3400 6750 2    60   ~ 0
GND
Text Label 3400 6850 2    60   ~ 0
GND
Text Label 3900 6750 0    60   ~ 0
+5V
Text Label 3900 6850 0    60   ~ 0
+5V
$Comp
L SW_Push_Dual SW1
U 1 1 5989AF30
P 4750 5800
F 0 "SW1" H 4800 5900 50  0000 L CNN
F 1 "SW_Push_Dual" H 4750 5530 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_TH_Tactile_Omron_B3F-10xx" H 4750 6000 50  0001 C CNN
F 3 "" H 4750 6000 50  0001 C CNN
	1    4750 5800
	1    0    0    -1  
$EndComp
Text Label 4950 5800 0    60   ~ 0
~RESET
Text Label 4950 6000 0    60   ~ 0
~HALT
$Comp
L GND #PWR022
U 1 1 5989B489
P 4350 5900
F 0 "#PWR022" H 4350 5650 50  0001 C CNN
F 1 "GND" H 4350 5750 50  0000 C CNN
F 2 "" H 4350 5900 50  0001 C CNN
F 3 "" H 4350 5900 50  0001 C CNN
	1    4350 5900
	1    0    0    -1  
$EndComp
Text Label 7350 7450 2    60   ~ 0
GND
Text Label 7850 7450 0    60   ~ 0
+5V
Text Label 7350 7550 2    60   ~ 0
GND
Text Label 7850 7550 0    60   ~ 0
+3V3
Text Label 7350 7650 2    60   ~ 0
A1
Text Label 7850 7650 0    60   ~ 0
A2
Text Label 7350 7750 2    60   ~ 0
A3
Text Label 7850 7750 0    60   ~ 0
A4
Text Label 7350 7850 2    60   ~ 0
A5
Text Label 7850 7850 0    60   ~ 0
A6
Text Label 7350 7950 2    60   ~ 0
A7
Text Label 7850 7950 0    60   ~ 0
A8
Text Label 7350 8050 2    60   ~ 0
A9
Text Label 7850 8050 0    60   ~ 0
A10
Text Label 7350 8150 2    60   ~ 0
A11
Text Label 7850 8150 0    60   ~ 0
A12
Text Label 7350 8250 2    60   ~ 0
A13
Text Label 7850 8250 0    60   ~ 0
A14
Text Label 7350 8350 2    60   ~ 0
A15
Text Label 7850 8350 0    60   ~ 0
A16
Text Label 7350 8450 2    60   ~ 0
A17
Text Label 7850 8450 0    60   ~ 0
A18
Text Label 7350 8550 2    60   ~ 0
A19
Text Label 7850 8550 0    60   ~ 0
A20
Text Label 7350 8650 2    60   ~ 0
A21
Text Label 7850 8650 0    60   ~ 0
A22
Text Label 7350 8750 2    60   ~ 0
A23
Text Label 10850 2650 0    60   ~ 0
A13
Text Label 10850 2750 0    60   ~ 0
A14
Text Label 10850 2850 0    60   ~ 0
A15
Text Label 10850 2950 0    60   ~ 0
A16
Text Label 10850 3050 0    60   ~ 0
A17
Text Label 10850 3150 0    60   ~ 0
A18
Text Label 10850 3250 0    60   ~ 0
A19
Text Label 10850 2450 0    60   ~ 0
BOOT
Text Notes 11150 1550 0    60   ~ 0
#OE = 1 wenn BOOT=1, sonst Buskollision 
$Comp
L MCP23008 U10
U 1 1 598AD7D9
P 13000 2750
F 0 "U10" H 12900 3375 50  0000 R CNN
F 1 "MCP23008" H 12900 3300 50  0000 R CNN
F 2 "Housings_SOIC:SOIC-18W_7.5x11.6mm_Pitch1.27mm" H 13050 2100 50  0001 L CNN
F 3 "" H 13250 3350 50  0001 C CNN
	1    13000 2750
	1    0    0    -1  
$EndComp
$Comp
L MCP23017 U7
U 1 1 598AD9CA
P 13000 5050
F 0 "U7" H 12900 6075 50  0000 R CNN
F 1 "MCP23017" H 12900 6000 50  0000 R CNN
F 2 "Housings_SOIC:SOIC-28W_7.5x17.9mm_Pitch1.27mm" H 13050 4100 50  0001 L CNN
F 3 "" H 13250 6050 50  0001 C CNN
	1    13000 5050
	1    0    0    -1  
$EndComp
Text Label 12500 4250 2    60   ~ 0
D0
Text Label 12500 4350 2    60   ~ 0
D1
Text Label 12500 4450 2    60   ~ 0
D2
Text Label 12500 4550 2    60   ~ 0
D3
Text Label 12500 4650 2    60   ~ 0
D4
Text Label 12500 4750 2    60   ~ 0
D5
Text Label 12500 4850 2    60   ~ 0
D6
Text Label 12500 4950 2    60   ~ 0
D7
Text Label 12500 5150 2    60   ~ 0
D8
Text Label 12500 5250 2    60   ~ 0
D9
Text Label 12500 5350 2    60   ~ 0
D10
Text Label 12500 5450 2    60   ~ 0
D11
Text Label 12500 5550 2    60   ~ 0
D12
Text Label 12500 5650 2    60   ~ 0
D13
Text Label 12500 5750 2    60   ~ 0
D14
Text Label 12500 5850 2    60   ~ 0
D15
$Comp
L GND #PWR023
U 1 1 598ADD20
P 13000 6050
F 0 "#PWR023" H 13000 5800 50  0001 C CNN
F 1 "GND" H 13000 5900 50  0000 C CNN
F 2 "" H 13000 6050 50  0001 C CNN
F 3 "" H 13000 6050 50  0001 C CNN
	1    13000 6050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR024
U 1 1 598ADDB5
P 13000 3850
F 0 "#PWR024" H 13000 3700 50  0001 C CNN
F 1 "+3V3" H 13000 3990 50  0000 C CNN
F 2 "" H 13000 3850 50  0001 C CNN
F 3 "" H 13000 3850 50  0001 C CNN
	1    13000 3850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C15
U 1 1 598AE437
P 12500 3950
F 0 "C15" H 12510 4020 50  0000 L CNN
F 1 "100n" H 12510 3870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 12500 3950 50  0001 C CNN
F 3 "" H 12500 3950 50  0001 C CNN
	1    12500 3950
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR025
U 1 1 598AE587
P 12200 4050
F 0 "#PWR025" H 12200 3800 50  0001 C CNN
F 1 "GND" H 12200 3900 50  0000 C CNN
F 2 "" H 12200 4050 50  0001 C CNN
F 3 "" H 12200 4050 50  0001 C CNN
	1    12200 4050
	1    0    0    -1  
$EndComp
Text Label 13500 5350 0    60   ~ 0
SCL
Text Label 13500 5450 0    60   ~ 0
SDA
Text Label 13500 2750 0    60   ~ 0
SCL
Text Label 13500 2850 0    60   ~ 0
SDA
Text Notes 13600 5800 0    60   ~ 0
i2c-addr: 0x20
$Comp
L GND #PWR026
U 1 1 598AF602
P 13000 3450
F 0 "#PWR026" H 13000 3200 50  0001 C CNN
F 1 "GND" H 13000 3300 50  0000 C CNN
F 2 "" H 13000 3450 50  0001 C CNN
F 3 "" H 13000 3450 50  0001 C CNN
	1    13000 3450
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR027
U 1 1 598AF776
P 13500 3050
F 0 "#PWR027" H 13500 2900 50  0001 C CNN
F 1 "+3V3" H 13500 3190 50  0000 C CNN
F 2 "" H 13500 3050 50  0001 C CNN
F 3 "" H 13500 3050 50  0001 C CNN
	1    13500 3050
	0    1    1    0   
$EndComp
Text Notes 13750 3250 0    60   ~ 0
i2c-addr: 0x21
$Comp
L +3V3 #PWR028
U 1 1 598AFDA0
P 13000 1950
F 0 "#PWR028" H 13000 1800 50  0001 C CNN
F 1 "+3V3" H 13000 2090 50  0000 C CNN
F 2 "" H 13000 1950 50  0001 C CNN
F 3 "" H 13000 1950 50  0001 C CNN
	1    13000 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C16
U 1 1 598AFDAA
P 12500 2050
F 0 "C16" H 12510 2120 50  0000 L CNN
F 1 "100n" H 12510 1970 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 12500 2050 50  0001 C CNN
F 3 "" H 12500 2050 50  0001 C CNN
	1    12500 2050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR029
U 1 1 598AFF23
P 12300 2150
F 0 "#PWR029" H 12300 1900 50  0001 C CNN
F 1 "GND" H 12300 2000 50  0000 C CNN
F 2 "" H 12300 2150 50  0001 C CNN
F 3 "" H 12300 2150 50  0001 C CNN
	1    12300 2150
	1    0    0    -1  
$EndComp
Text Label 12500 2450 2    60   ~ 0
BOOT
Text Label 12500 2550 2    60   ~ 0
DTACK_TRIG
Text Label 10850 2550 0    60   ~ 0
DTACK_TRIG
Text Notes 12650 1350 2    60   ~ 0
Längeres DTACK für eeprom.
Text Label 7350 9550 2    60   ~ 0
D0
Text Label 7850 9450 0    60   ~ 0
D1
Text Label 7350 9450 2    60   ~ 0
D2
Text Label 7850 9350 0    60   ~ 0
D3
Text Label 7350 9350 2    60   ~ 0
D4
Text Label 7850 9250 0    60   ~ 0
D5
Text Label 7350 9250 2    60   ~ 0
D6
Text Label 7850 9150 0    60   ~ 0
D7
Text Label 7350 9150 2    60   ~ 0
D8
Text Label 7850 9050 0    60   ~ 0
D9
Text Label 7350 9050 2    60   ~ 0
D10
Text Label 7850 8950 0    60   ~ 0
D11
Text Label 7350 8950 2    60   ~ 0
D12
Text Label 7850 8850 0    60   ~ 0
D13
Text Label 7350 8850 2    60   ~ 0
D14
Text Label 7850 8750 0    60   ~ 0
D15
Text Label 7850 9550 0    60   ~ 0
~DTACK
Text Label 7350 9650 2    60   ~ 0
R/~W
Text Label 7350 9750 2    60   ~ 0
~UDS
Text Label 7850 9650 0    60   ~ 0
~LDS
Text Label 7850 9750 0    60   ~ 0
~BR
Text Label 7350 9850 2    60   ~ 0
~BG
Text Label 7850 9850 0    60   ~ 0
~AVEC
Text Label 7350 9950 2    60   ~ 0
~IPL0
Text Label 7850 9950 0    60   ~ 0
~IPL1
Text Label 7350 10050 2    60   ~ 0
~IPL2
$Comp
L AS6C8016 U2
U 1 1 598B5339
P 5150 2350
F 0 "U2" H 5250 3450 60  0000 C CNN
F 1 "AS6C8016" H 5150 900 60  0000 C CNN
F 2 "custom:TSOP44" H 5150 2350 60  0001 C CNN
F 3 "" H 5150 2350 60  0001 C CNN
	1    5150 2350
	1    0    0    -1  
$EndComp
Text Label 4700 3600 2    60   ~ 0
~UDS
Text Label 4700 3700 2    60   ~ 0
~LDS
Text Label 3250 1500 0    60   ~ 0
A1
Text Label 3250 1600 0    60   ~ 0
A2
Text Label 3250 1700 0    60   ~ 0
A3
Text Label 3250 1800 0    60   ~ 0
A4
Text Label 3250 1900 0    60   ~ 0
A5
Text Label 3250 2000 0    60   ~ 0
A6
Text Label 3250 2100 0    60   ~ 0
A7
Text Label 3250 2200 0    60   ~ 0
A8
Text Label 3250 2300 0    60   ~ 0
A9
Text Label 3250 2400 0    60   ~ 0
A10
Text Label 3250 2500 0    60   ~ 0
A11
Text Label 3250 2600 0    60   ~ 0
A12
Text Label 3250 2700 0    60   ~ 0
A13
Text Label 3250 2800 0    60   ~ 0
A14
Text Label 3250 2900 0    60   ~ 0
A15
Text Label 3250 3000 0    60   ~ 0
A16
Text Label 3250 3100 0    60   ~ 0
A17
Text Label 3250 3200 0    60   ~ 0
A18
Text Label 3250 3300 0    60   ~ 0
A19
Text Label 3250 3400 0    60   ~ 0
A20
Text Label 3250 3500 0    60   ~ 0
A21
Text Label 3250 3600 0    60   ~ 0
A22
Text Label 3250 3700 0    60   ~ 0
A23
Text Label 3250 3900 0    60   ~ 0
D0
Text Label 3250 4000 0    60   ~ 0
D1
Text Label 3250 4100 0    60   ~ 0
D2
Text Label 3250 4200 0    60   ~ 0
D3
Text Label 3250 4300 0    60   ~ 0
D4
Text Label 3250 4400 0    60   ~ 0
D5
Text Label 3250 4500 0    60   ~ 0
D6
Text Label 3250 4600 0    60   ~ 0
D7
Text Label 3250 4700 0    60   ~ 0
D8
Text Label 3250 4800 0    60   ~ 0
D9
Text Label 3250 4900 0    60   ~ 0
D10
Text Label 3250 5000 0    60   ~ 0
D11
Text Label 3250 5100 0    60   ~ 0
D12
Text Label 3250 5200 0    60   ~ 0
D13
Text Label 3250 5300 0    60   ~ 0
D14
Text Label 3250 5400 0    60   ~ 0
D15
Text Label 5600 1350 0    60   ~ 0
D0
Text Label 5600 1450 0    60   ~ 0
D1
Text Label 5600 1550 0    60   ~ 0
D2
Text Label 5600 1650 0    60   ~ 0
D3
Text Label 5600 1750 0    60   ~ 0
D4
Text Label 5600 1850 0    60   ~ 0
D5
Text Label 5600 1950 0    60   ~ 0
D6
Text Label 5600 2050 0    60   ~ 0
D7
Text Label 5600 2150 0    60   ~ 0
D8
Text Label 5600 2250 0    60   ~ 0
D9
Text Label 5600 2350 0    60   ~ 0
D10
Text Label 5600 2450 0    60   ~ 0
D11
Text Label 5600 2550 0    60   ~ 0
D12
Text Label 5600 2650 0    60   ~ 0
D13
Text Label 5600 2750 0    60   ~ 0
D14
Text Label 5600 2850 0    60   ~ 0
D15
$Comp
L C_Small C4
U 1 1 598B3532
P 6050 3500
F 0 "C4" H 6060 3570 50  0000 L CNN
F 1 "100n" H 6060 3420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6050 3500 50  0001 C CNN
F 3 "" H 6050 3500 50  0001 C CNN
	1    6050 3500
	1    0    0    -1  
$EndComp
Text Label 9750 1350 2    60   ~ 0
CLK_16MHz
$Comp
L PWR_FLAG #FLG030
U 1 1 598B5D96
P 3900 6650
F 0 "#FLG030" H 3900 6725 50  0001 C CNN
F 1 "PWR_FLAG" H 3900 6800 50  0000 C CNN
F 2 "" H 3900 6650 50  0001 C CNN
F 3 "" H 3900 6650 50  0001 C CNN
	1    3900 6650
	-1   0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG031
U 1 1 598B6FAB
P 3400 6650
F 0 "#FLG031" H 3400 6725 50  0001 C CNN
F 1 "PWR_FLAG" H 3400 6800 50  0000 C CNN
F 2 "" H 3400 6650 50  0001 C CNN
F 3 "" H 3400 6650 50  0001 C CNN
	1    3400 6650
	1    0    0    -1  
$EndComp
NoConn ~ 13500 2450
NoConn ~ 13500 4650
NoConn ~ 13500 4750
$Comp
L R_Small R15
U 1 1 598B8A3F
P 2100 6900
F 0 "R15" H 2130 6920 50  0000 L CNN
F 1 "2k" H 2130 6860 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 2100 6900 50  0001 C CNN
F 3 "" H 2100 6900 50  0001 C CNN
	1    2100 6900
	0    -1   -1   0   
$EndComp
Text Label 2550 6900 2    60   ~ 0
SCL
$Comp
L +3V3 #PWR032
U 1 1 598B8A47
P 1950 6700
F 0 "#PWR032" H 1950 6550 50  0001 C CNN
F 1 "+3V3" H 1950 6840 50  0000 C CNN
F 2 "" H 1950 6700 50  0001 C CNN
F 3 "" H 1950 6700 50  0001 C CNN
	1    1950 6700
	1    0    0    -1  
$EndComp
$Comp
L R_Small R16
U 1 1 598B8A4D
P 2100 6800
F 0 "R16" H 2130 6820 50  0000 L CNN
F 1 "2k" H 2130 6760 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 2100 6800 50  0001 C CNN
F 3 "" H 2100 6800 50  0001 C CNN
	1    2100 6800
	0    -1   -1   0   
$EndComp
Text Label 2550 6800 2    60   ~ 0
SDA
NoConn ~ 9750 1450
$Comp
L +3V3 #PWR033
U 1 1 598BA5A5
P 9750 3200
F 0 "#PWR033" H 9750 3050 50  0001 C CNN
F 1 "+3V3" H 9750 3340 50  0000 C CNN
F 2 "" H 9750 3200 50  0001 C CNN
F 3 "" H 9750 3200 50  0001 C CNN
	1    9750 3200
	1    0    0    -1  
$EndComp
NoConn ~ 1250 2700
NoConn ~ 1250 2800
NoConn ~ 1250 2900
NoConn ~ 3250 1400
$Comp
L CONN_01X03 J5
U 1 1 598BE077
P 2750 6800
F 0 "J5" H 2750 7000 50  0000 C CNN
F 1 "I2C" V 2850 6800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2750 6800 50  0001 C CNN
F 3 "" H 2750 6800 50  0001 C CNN
	1    2750 6800
	1    0    0    -1  
$EndComp
Text Label 2550 6700 2    60   ~ 0
GND
$Comp
L CONN_02X30 J4
U 1 1 598BF124
P 7600 8900
F 0 "J4" H 7600 10450 50  0000 C CNN
F 1 "CONN_02X30" V 7600 8900 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_60pins" H 7600 8400 50  0001 C CNN
F 3 "" H 7600 8400 50  0001 C CNN
	1    7600 8900
	1    0    0    -1  
$EndComp
NoConn ~ 7350 10350
NoConn ~ 7850 10350
$Comp
L R_Network10 RN1
U 1 1 598C20A8
P 1100 5950
F 0 "RN1" V 500 5950 50  0000 C CNN
F 1 "R_Network10" V 1600 5950 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP11" V 1675 5950 50  0001 C CNN
F 3 "" H 1100 5950 50  0001 C CNN
	1    1100 5950
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 598F0960
P 6350 5400
F 0 "D1" H 6350 5500 50  0000 C CNN
F 1 "LED" H 6350 5300 50  0000 C CNN
F 2 "LEDs:LED_0805" H 6350 5400 50  0001 C CNN
F 3 "" H 6350 5400 50  0001 C CNN
	1    6350 5400
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R1
U 1 1 598F0A1F
P 6350 5150
F 0 "R1" H 6380 5170 50  0000 L CNN
F 1 "750" H 6380 5110 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 6350 5150 50  0001 C CNN
F 3 "" H 6350 5150 50  0001 C CNN
	1    6350 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 598F0AC4
P 6350 5550
F 0 "#PWR034" H 6350 5300 50  0001 C CNN
F 1 "GND" H 6350 5400 50  0000 C CNN
F 2 "" H 6350 5550 50  0001 C CNN
F 3 "" H 6350 5550 50  0001 C CNN
	1    6350 5550
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR035
U 1 1 598F0C18
P 6350 5050
F 0 "#PWR035" H 6350 4900 50  0001 C CNN
F 1 "+3V3" H 6350 5190 50  0000 C CNN
F 2 "" H 6350 5050 50  0001 C CNN
F 3 "" H 6350 5050 50  0001 C CNN
	1    6350 5050
	1    0    0    -1  
$EndComp
$Comp
L XC9572XL-VQ44 U6
U 1 1 59881A68
P 10350 2650
F 0 "U6" H 10550 4100 60  0000 C CNN
F 1 "XC9572XL-VQ44" H 10300 1150 60  0000 C CNN
F 2 "Housings_QFP:TQFP-44_10x10mm_Pitch0.8mm" H 10300 2250 60  0001 C CNN
F 3 "" H 10300 2250 60  0001 C CNN
	1    10350 2650
	1    0    0    -1  
$EndComp
Text Label 10850 1950 0    60   ~ 0
CS0
Text Label 10850 2050 0    60   ~ 0
CS1
Text Label 10850 2150 0    60   ~ 0
CS2
Text Label 10850 2250 0    60   ~ 0
CS3
Text Label 7350 10150 2    60   ~ 0
CS0
Text Label 7350 10250 2    60   ~ 0
CS2
Text Label 7850 10150 0    60   ~ 0
CS1
Text Label 7850 10250 0    60   ~ 0
CS3
Text Label 12500 2650 2    60   ~ 0
~RESET
Text Label 12500 2750 2    60   ~ 0
~HALT
$Comp
L CONN_01X03 J9
U 1 1 599050EF
P 12300 3050
F 0 "J9" H 12300 3250 50  0000 C CNN
F 1 "CONN_01X03" V 12400 3050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 12300 3050 50  0001 C CNN
F 3 "" H 12300 3050 50  0001 C CNN
	1    12300 3050
	-1   0    0    1   
$EndComp
Text Label 12500 2850 2    60   ~ 0
R/~W
$Comp
L R_Small R2
U 1 1 599348E1
P 9500 1850
F 0 "R2" H 9530 1870 50  0000 L CNN
F 1 "100" H 9530 1810 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 9500 1850 50  0001 C CNN
F 3 "" H 9500 1850 50  0001 C CNN
	1    9500 1850
	0    1    1    0   
$EndComp
Text Label 9400 1850 2    60   ~ 0
~RESET
$Comp
L CONN_01X02 J7
U 1 1 59934E94
P 9550 1700
F 0 "J7" H 9550 1850 50  0000 C CNN
F 1 "CONN_01X02" V 9650 1700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9550 1700 50  0001 C CNN
F 3 "" H 9550 1700 50  0001 C CNN
	1    9550 1700
	-1   0    0    1   
$EndComp
Text Label 8500 7450 2    60   ~ 0
GND
Text Label 9000 7450 0    60   ~ 0
+5V
Text Label 8500 7550 2    60   ~ 0
GND
Text Label 9000 7550 0    60   ~ 0
+3V3
Text Label 8500 7650 2    60   ~ 0
A1
Text Label 9000 7650 0    60   ~ 0
A2
Text Label 8500 7750 2    60   ~ 0
A3
Text Label 9000 7750 0    60   ~ 0
A4
Text Label 8500 7850 2    60   ~ 0
A5
Text Label 9000 7850 0    60   ~ 0
A6
Text Label 8500 7950 2    60   ~ 0
A7
Text Label 9000 7950 0    60   ~ 0
A8
Text Label 8500 8050 2    60   ~ 0
A9
Text Label 9000 8050 0    60   ~ 0
A10
Text Label 8500 8150 2    60   ~ 0
A11
Text Label 9000 8150 0    60   ~ 0
A12
Text Label 8500 8250 2    60   ~ 0
A13
Text Label 9000 8250 0    60   ~ 0
A14
Text Label 8500 8350 2    60   ~ 0
A15
Text Label 9000 8350 0    60   ~ 0
A16
Text Label 8500 8450 2    60   ~ 0
A17
Text Label 9000 8450 0    60   ~ 0
A18
Text Label 8500 8550 2    60   ~ 0
A19
Text Label 9000 8550 0    60   ~ 0
A20
Text Label 8500 8650 2    60   ~ 0
A21
Text Label 9000 8650 0    60   ~ 0
A22
Text Label 8500 8750 2    60   ~ 0
A23
Text Label 8500 9550 2    60   ~ 0
D0
Text Label 9000 9450 0    60   ~ 0
D1
Text Label 8500 9450 2    60   ~ 0
D2
Text Label 9000 9350 0    60   ~ 0
D3
Text Label 8500 9350 2    60   ~ 0
D4
Text Label 9000 9250 0    60   ~ 0
D5
Text Label 8500 9250 2    60   ~ 0
D6
Text Label 9000 9150 0    60   ~ 0
D7
Text Label 8500 9150 2    60   ~ 0
D8
Text Label 9000 9050 0    60   ~ 0
D9
Text Label 8500 9050 2    60   ~ 0
D10
Text Label 9000 8950 0    60   ~ 0
D11
Text Label 8500 8950 2    60   ~ 0
D12
Text Label 9000 8850 0    60   ~ 0
D13
Text Label 8500 8850 2    60   ~ 0
D14
Text Label 9000 8750 0    60   ~ 0
D15
Text Label 9000 9550 0    60   ~ 0
~DTACK
Text Label 8500 9650 2    60   ~ 0
R/~W
Text Label 8500 9750 2    60   ~ 0
~UDS
Text Label 9000 9650 0    60   ~ 0
~LDS
Text Label 9000 9750 0    60   ~ 0
~BR
Text Label 8500 9850 2    60   ~ 0
~BG
Text Label 9000 9850 0    60   ~ 0
~AVEC
Text Label 8500 9950 2    60   ~ 0
~IPL0
Text Label 9000 9950 0    60   ~ 0
~IPL1
Text Label 8500 10050 2    60   ~ 0
~IPL2
$Comp
L CONN_02X30 J6
U 1 1 5997FD38
P 8750 8900
F 0 "J6" H 8750 10450 50  0000 C CNN
F 1 "CONN_02X30" V 8750 8900 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_60pins" H 8750 8400 50  0001 C CNN
F 3 "" H 8750 8400 50  0001 C CNN
	1    8750 8900
	1    0    0    -1  
$EndComp
NoConn ~ 8500 10350
NoConn ~ 9000 10350
Text Label 8500 10150 2    60   ~ 0
CS0
Text Label 8500 10250 2    60   ~ 0
CS2
Text Label 9000 10150 0    60   ~ 0
CS1
Text Label 9000 10250 0    60   ~ 0
CS3
Text Label 9650 7450 2    60   ~ 0
GND
Text Label 10150 7450 0    60   ~ 0
+5V
Text Label 9650 7550 2    60   ~ 0
GND
Text Label 10150 7550 0    60   ~ 0
+3V3
Text Label 9650 7650 2    60   ~ 0
A1
Text Label 10150 7650 0    60   ~ 0
A2
Text Label 9650 7750 2    60   ~ 0
A3
Text Label 10150 7750 0    60   ~ 0
A4
Text Label 9650 7850 2    60   ~ 0
A5
Text Label 10150 7850 0    60   ~ 0
A6
Text Label 9650 7950 2    60   ~ 0
A7
Text Label 10150 7950 0    60   ~ 0
A8
Text Label 9650 8050 2    60   ~ 0
A9
Text Label 10150 8050 0    60   ~ 0
A10
Text Label 9650 8150 2    60   ~ 0
A11
Text Label 10150 8150 0    60   ~ 0
A12
Text Label 9650 8250 2    60   ~ 0
A13
Text Label 10150 8250 0    60   ~ 0
A14
Text Label 9650 8350 2    60   ~ 0
A15
Text Label 10150 8350 0    60   ~ 0
A16
Text Label 9650 8450 2    60   ~ 0
A17
Text Label 10150 8450 0    60   ~ 0
A18
Text Label 9650 8550 2    60   ~ 0
A19
Text Label 10150 8550 0    60   ~ 0
A20
Text Label 9650 8650 2    60   ~ 0
A21
Text Label 10150 8650 0    60   ~ 0
A22
Text Label 9650 8750 2    60   ~ 0
A23
Text Label 9650 9550 2    60   ~ 0
D0
Text Label 10150 9450 0    60   ~ 0
D1
Text Label 9650 9450 2    60   ~ 0
D2
Text Label 10150 9350 0    60   ~ 0
D3
Text Label 9650 9350 2    60   ~ 0
D4
Text Label 10150 9250 0    60   ~ 0
D5
Text Label 9650 9250 2    60   ~ 0
D6
Text Label 10150 9150 0    60   ~ 0
D7
Text Label 9650 9150 2    60   ~ 0
D8
Text Label 10150 9050 0    60   ~ 0
D9
Text Label 9650 9050 2    60   ~ 0
D10
Text Label 10150 8950 0    60   ~ 0
D11
Text Label 9650 8950 2    60   ~ 0
D12
Text Label 10150 8850 0    60   ~ 0
D13
Text Label 9650 8850 2    60   ~ 0
D14
Text Label 10150 8750 0    60   ~ 0
D15
Text Label 10150 9550 0    60   ~ 0
~DTACK
Text Label 9650 9650 2    60   ~ 0
R/~W
Text Label 9650 9750 2    60   ~ 0
~UDS
Text Label 10150 9650 0    60   ~ 0
~LDS
Text Label 10150 9750 0    60   ~ 0
~BR
Text Label 9650 9850 2    60   ~ 0
~BG
Text Label 10150 9850 0    60   ~ 0
~AVEC
Text Label 9650 9950 2    60   ~ 0
~IPL0
Text Label 10150 9950 0    60   ~ 0
~IPL1
Text Label 9650 10050 2    60   ~ 0
~IPL2
$Comp
L CONN_02X30 J8
U 1 1 5997FDC7
P 9900 8900
F 0 "J8" H 9900 10450 50  0000 C CNN
F 1 "CONN_02X30" V 9900 8900 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_60pins" H 9900 8400 50  0001 C CNN
F 3 "" H 9900 8400 50  0001 C CNN
	1    9900 8900
	1    0    0    -1  
$EndComp
NoConn ~ 9650 10350
NoConn ~ 10150 10350
Text Label 9650 10150 2    60   ~ 0
CS0
Text Label 9650 10250 2    60   ~ 0
CS2
Text Label 10150 10150 0    60   ~ 0
CS1
Text Label 10150 10250 0    60   ~ 0
CS3
NoConn ~ 10150 10050
NoConn ~ 9000 10050
NoConn ~ 7850 10050
$Comp
L CONN_02X03 J1
U 1 1 59AB95E5
P 3650 6850
F 0 "J1" H 3650 7050 50  0000 C CNN
F 1 "CONN_02X03" H 3650 6650 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_6pins" H 3650 5650 50  0001 C CNN
F 3 "" H 3650 5650 50  0001 C CNN
	1    3650 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1550 1250 1550
Wire Wire Line
	1050 1550 1000 1550
Wire Wire Line
	1050 3800 900  3800
Wire Wire Line
	2150 750  2150 1000
Wire Wire Line
	1950 850  2500 850 
Wire Wire Line
	2350 850  2350 1000
Connection ~ 2150 850 
Connection ~ 2350 850 
Wire Wire Line
	2700 850  2800 850 
Wire Wire Line
	2800 850  2800 950 
Wire Wire Line
	1750 850  1650 850 
Wire Wire Line
	1650 850  1650 950 
Wire Wire Line
	4700 1350 4550 1350
Wire Wire Line
	4700 1450 4550 1450
Wire Wire Line
	4700 1550 4550 1550
Wire Wire Line
	4700 1650 4550 1650
Wire Wire Line
	4700 1750 4550 1750
Wire Wire Line
	4700 1850 4550 1850
Wire Wire Line
	4700 1950 4550 1950
Wire Wire Line
	4700 2050 4550 2050
Wire Wire Line
	4700 2150 4550 2150
Wire Wire Line
	4700 2250 4550 2250
Wire Wire Line
	4700 2350 4550 2350
Wire Wire Line
	4700 2450 4550 2450
Wire Wire Line
	4700 2550 4550 2550
Wire Wire Line
	4700 2650 4550 2650
Wire Wire Line
	4700 2750 4550 2750
Wire Wire Line
	4700 2850 4550 2850
Wire Wire Line
	4700 2950 4550 2950
Wire Wire Line
	4700 3050 4550 3050
Wire Wire Line
	4700 3150 4550 3150
Wire Bus Line
	4450 1250 4450 3050
Wire Bus Line
	4450 1250 4300 1250
Wire Wire Line
	5850 3200 5850 3400
Wire Wire Line
	5850 3600 5850 3800
Wire Wire Line
	9750 3350 9600 3350
Wire Wire Line
	9750 3200 9750 3650
Wire Wire Line
	9750 3500 9600 3500
Wire Wire Line
	9750 3650 9600 3650
Wire Wire Line
	9400 3350 9350 3350
Wire Wire Line
	9350 3350 9350 4100
Wire Wire Line
	9750 3850 9750 4050
Connection ~ 9750 3950
Wire Wire Line
	9750 3950 9350 3950
Connection ~ 9350 3950
Wire Wire Line
	9400 3650 9350 3650
Connection ~ 9350 3650
Wire Wire Line
	9400 3500 9350 3500
Connection ~ 9350 3500
Wire Wire Line
	9750 2250 9550 2250
Wire Wire Line
	9750 2350 9550 2350
Wire Wire Line
	9750 2450 9550 2450
Wire Wire Line
	9750 2550 9550 2550
Wire Wire Line
	2150 5800 2350 5800
Wire Wire Line
	4500 4750 4450 4750
Wire Wire Line
	4450 4650 4450 4850
Connection ~ 4450 4750
Wire Wire Line
	4450 5050 4450 5100
Wire Wire Line
	4450 5100 5350 5100
Wire Wire Line
	4900 5050 4900 5150
Connection ~ 4900 5100
Wire Wire Line
	5300 4750 5450 4750
Wire Wire Line
	5350 4750 5350 4850
Connection ~ 5350 4750
Wire Wire Line
	5350 5100 5350 5050
Wire Wire Line
	8450 1300 8700 1300
Wire Wire Line
	8550 1200 8550 1300
Connection ~ 8550 1300
Wire Wire Line
	8450 3100 8700 3100
Wire Wire Line
	8550 3000 8550 3100
Connection ~ 8550 3100
Wire Wire Line
	7400 5050 7400 5300
Wire Wire Line
	7400 5300 7300 5300
Connection ~ 7400 5300
Wire Wire Line
	7400 5100 8500 5100
Wire Wire Line
	8500 5100 8500 5300
Wire Wire Line
	8500 5300 8400 5300
Connection ~ 7400 5100
Wire Wire Line
	7100 5300 7000 5300
Wire Wire Line
	7000 5300 7000 5400
Wire Wire Line
	7000 5400 7400 5400
Wire Wire Line
	7400 5400 7400 5500
Wire Wire Line
	7400 5900 7400 6150
Wire Wire Line
	7400 6150 7300 6150
Connection ~ 7400 6150
Wire Wire Line
	7400 5950 8500 5950
Wire Wire Line
	8500 5950 8500 6150
Wire Wire Line
	8500 6150 8400 6150
Connection ~ 7400 5950
Wire Wire Line
	7100 6150 7000 6150
Wire Wire Line
	7000 6150 7000 6250
Wire Wire Line
	7000 6250 7400 6250
Wire Wire Line
	7400 6250 7400 6350
Wire Notes Line
	6850 4800 8800 4800
Wire Notes Line
	8800 4800 8800 6600
Wire Notes Line
	8800 6600 6850 6600
Wire Notes Line
	6850 6600 6850 4800
Wire Wire Line
	4550 6000 4550 5800
Wire Wire Line
	4550 5800 4350 5800
Wire Wire Line
	4350 5800 4350 5900
Wire Wire Line
	13000 3850 13000 4050
Wire Wire Line
	13500 4250 13600 4250
Wire Wire Line
	13600 4250 13600 3950
Wire Wire Line
	13600 3950 12600 3950
Connection ~ 13000 3950
Wire Wire Line
	12400 3950 12200 3950
Wire Wire Line
	12200 3950 12200 4050
Wire Wire Line
	13500 6050 13000 6050
Wire Wire Line
	13500 5650 13500 6050
Connection ~ 13500 5850
Connection ~ 13500 5750
Wire Wire Line
	13500 3450 13000 3450
Wire Wire Line
	13500 3150 13500 3450
Connection ~ 13500 3250
Wire Wire Line
	13000 1950 13000 2150
Wire Wire Line
	13600 2050 13600 2350
Wire Wire Line
	12600 2050 13600 2050
Connection ~ 13000 2050
Wire Wire Line
	12400 2050 12300 2050
Wire Wire Line
	12300 2050 12300 2150
Wire Wire Line
	13600 2350 13500 2350
Wire Wire Line
	5600 3400 5600 3300
Wire Wire Line
	5600 3300 6050 3300
Connection ~ 5850 3300
Wire Wire Line
	5600 3600 5600 3700
Wire Wire Line
	5600 3700 6050 3700
Connection ~ 5850 3700
Wire Wire Line
	6050 3300 6050 3400
Wire Wire Line
	6050 3700 6050 3600
Wire Wire Line
	3900 6650 3900 6950
Wire Wire Line
	3400 6650 3400 6950
Wire Wire Line
	2200 6900 2550 6900
Wire Wire Line
	2200 6800 2550 6800
Connection ~ 9750 3500
Connection ~ 9750 3450
Connection ~ 9750 3350
Wire Wire Line
	2250 5800 2250 5850
Connection ~ 2250 5800
Wire Wire Line
	1950 6700 1950 6900
Wire Wire Line
	1950 6900 2000 6900
Wire Wire Line
	2000 6800 1950 6800
Connection ~ 1950 6800
Wire Wire Line
	1300 5450 1350 5450
Wire Wire Line
	1350 5450 1350 5400
Wire Notes Line
	11950 1750 14500 1750
Wire Notes Line
	14500 1750 14500 6300
Wire Notes Line
	14500 6300 11950 6300
Wire Notes Line
	11950 6300 11950 1750
Wire Wire Line
	9600 1850 9750 1850
Connection ~ 3400 6850
Connection ~ 3900 6850
Connection ~ 3400 6750
Connection ~ 3900 6750
$EndSCHEMATC
