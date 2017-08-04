EESchema Schematic File Version 2
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
LIBS:m68k-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "CPU, RAM"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L M68SEC000 U?
U 1 1 59846D87
P 3100 3800
F 0 "U?" H 3500 6200 50  0000 C CNN
F 1 "M68SEC000" H 3550 1800 50  0000 C CNN
F 2 "" H 3100 3800 50  0001 C CNN
F 3 "" H 3100 3800 50  0001 C CNN
	1    3100 3800
	1    0    0    -1  
$EndComp
Text Label 4100 1600 0    60   ~ 0
A0
Text Label 4100 1700 0    60   ~ 0
A1
Text Label 4100 1800 0    60   ~ 0
A2
Text Label 4100 1900 0    60   ~ 0
A3
Text Label 4100 2000 0    60   ~ 0
A4
Text Label 4100 2100 0    60   ~ 0
A5
Text Label 4100 2200 0    60   ~ 0
A6
Text Label 4100 2300 0    60   ~ 0
A7
Text Label 4100 2400 0    60   ~ 0
A8
Text Label 4100 2500 0    60   ~ 0
A9
Text Label 4100 2600 0    60   ~ 0
A10
Text Label 4100 2700 0    60   ~ 0
A11
Text Label 4100 2800 0    60   ~ 0
A12
Text Label 4100 2900 0    60   ~ 0
A13
Text Label 4100 3000 0    60   ~ 0
A14
Text Label 4100 3100 0    60   ~ 0
A15
Text Label 4100 3200 0    60   ~ 0
A16
Text Label 4100 3300 0    60   ~ 0
A17
Text Label 4100 3400 0    60   ~ 0
A18
Text Label 4100 3500 0    60   ~ 0
A19
Text Label 4100 3600 0    60   ~ 0
A20
Text Label 4100 3700 0    60   ~ 0
A21
Text Label 4100 3800 0    60   ~ 0
A22
Text Label 4100 3900 0    60   ~ 0
A23
Text Label 4100 4100 0    60   ~ 0
D0
Text Label 4100 4200 0    60   ~ 0
D1
Text Label 4100 4300 0    60   ~ 0
D2
Text Label 4100 4400 0    60   ~ 0
D3
Text Label 4100 4500 0    60   ~ 0
D4
Text Label 4100 4600 0    60   ~ 0
D5
Text Label 4100 4700 0    60   ~ 0
D6
Text Label 4100 4800 0    60   ~ 0
D7
Text Label 4100 4900 0    60   ~ 0
D8
Text Label 4100 5000 0    60   ~ 0
D9
Text Label 4100 5100 0    60   ~ 0
D10
Text Label 4100 5200 0    60   ~ 0
D11
Text Label 4100 5300 0    60   ~ 0
D12
Text Label 4100 5400 0    60   ~ 0
D13
Text Label 4100 5500 0    60   ~ 0
D14
Text Label 4100 5600 0    60   ~ 0
D15
Text Label 2100 1600 2    60   ~ 0
clk_68k
Text Label 2100 1750 2    60   ~ 0
MODE
Text Label 2100 2000 2    60   ~ 0
IPL0_N
Text Label 2100 2100 2    60   ~ 0
IPL1_N
Text Label 2100 2200 2    60   ~ 0
IPL2_N
Text Label 2100 2300 2    60   ~ 0
AVEC_N
Text Label 2100 2500 2    60   ~ 0
IPL0_N
Text Label 2100 2600 2    60   ~ 0
IPL0_N
Text Label 2100 2900 2    60   ~ 0
FC0
Text Label 2100 3000 2    60   ~ 0
FC1
Text Label 2100 3100 2    60   ~ 0
FC2
Text Label 2100 3700 2    60   ~ 0
AS_N
Text Label 2100 3800 2    60   ~ 0
UDS_N
Text Label 2100 3900 2    60   ~ 0
LDS_N
Text Label 2100 4000 2    60   ~ 0
R/W
Text Label 2100 4200 2    60   ~ 0
DTACK_N
Text Label 2100 4400 2    60   ~ 0
BERR_N
Text Label 2100 5000 2    60   ~ 0
HALT_N
Text Label 2100 5100 2    60   ~ 0
RESET_N
Wire Bus Line
	6350 1200 7650 1200
Text Label 6850 1200 0    60   ~ 0
A[0..23]
$Comp
L +3.3V #PWR?
U 1 1 59846EAF
P 3000 850
F 0 "#PWR?" H 3000 700 50  0001 C CNN
F 1 "+3.3V" H 3000 990 50  0000 C CNN
F 2 "" H 3000 850 50  0001 C CNN
F 3 "" H 3000 850 50  0001 C CNN
	1    3000 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 59846EC6
P 3100 6200
F 0 "#PWR?" H 3100 5950 50  0001 C CNN
F 1 "GND" H 3100 6050 50  0000 C CNN
F 2 "" H 3100 6200 50  0001 C CNN
F 3 "" H 3100 6200 50  0001 C CNN
	1    3100 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6000 3000 6100
Wire Wire Line
	3000 6100 3200 6100
Wire Wire Line
	3200 6100 3200 6000
Wire Wire Line
	3100 6100 3100 6200
Connection ~ 3100 6100
Wire Wire Line
	3200 1200 3200 1000
Wire Wire Line
	2800 1000 3300 1000
Wire Wire Line
	3000 850  3000 1200
Connection ~ 3000 1000
$Comp
L C_Small C?
U 1 1 59846F24
P 3400 1000
F 0 "C?" H 3410 1070 50  0000 L CNN
F 1 "100n" H 3410 920 50  0000 L CNN
F 2 "" H 3400 1000 50  0001 C CNN
F 3 "" H 3400 1000 50  0001 C CNN
	1    3400 1000
	0    1    1    0   
$EndComp
$Comp
L C_Small C?
U 1 1 59846F6E
P 2700 1000
F 0 "C?" H 2710 1070 50  0000 L CNN
F 1 "100n" H 2710 920 50  0000 L CNN
F 2 "" H 2700 1000 50  0001 C CNN
F 3 "" H 2700 1000 50  0001 C CNN
	1    2700 1000
	0    1    1    0   
$EndComp
Connection ~ 3200 1000
Wire Wire Line
	2600 1000 2400 1000
Wire Wire Line
	2400 1000 2400 1100
$Comp
L GND #PWR?
U 1 1 59846FFB
P 2400 1100
F 0 "#PWR?" H 2400 850 50  0001 C CNN
F 1 "GND" H 2400 950 50  0000 C CNN
F 2 "" H 2400 1100 50  0001 C CNN
F 3 "" H 2400 1100 50  0001 C CNN
	1    2400 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 59847018
P 3600 1100
F 0 "#PWR?" H 3600 850 50  0001 C CNN
F 1 "GND" H 3600 950 50  0000 C CNN
F 2 "" H 3600 1100 50  0001 C CNN
F 3 "" H 3600 1100 50  0001 C CNN
	1    3600 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1000 3600 1000
Wire Wire Line
	3600 1000 3600 1100
$EndSCHEMATC
