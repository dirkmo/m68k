EESchema Schematic File Version 2
LIBS:custom
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
LIBS:extboard-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 10450 3550 2    60   ~ 0
GND
Text Label 10950 3550 0    60   ~ 0
+5V
Text Label 10450 3650 2    60   ~ 0
GND
Text Label 10950 3650 0    60   ~ 0
+3V3
Text Label 10450 3750 2    60   ~ 0
A1
Text Label 10950 3750 0    60   ~ 0
A2
Text Label 10450 3850 2    60   ~ 0
A3
Text Label 10950 3850 0    60   ~ 0
A4
Text Label 10450 3950 2    60   ~ 0
A5
Text Label 10950 3950 0    60   ~ 0
A6
Text Label 10450 4050 2    60   ~ 0
A7
Text Label 10950 4050 0    60   ~ 0
A8
Text Label 10450 4150 2    60   ~ 0
A9
Text Label 10950 4150 0    60   ~ 0
A10
Text Label 10450 4250 2    60   ~ 0
A11
Text Label 10950 4250 0    60   ~ 0
A12
Text Label 10450 4350 2    60   ~ 0
A13
Text Label 10950 4350 0    60   ~ 0
A14
Text Label 10450 4450 2    60   ~ 0
A15
Text Label 10950 4450 0    60   ~ 0
A16
Text Label 10450 4550 2    60   ~ 0
A17
Text Label 10950 4550 0    60   ~ 0
A18
Text Label 10450 4650 2    60   ~ 0
A19
Text Label 10950 4650 0    60   ~ 0
A20
Text Label 10450 4750 2    60   ~ 0
A21
Text Label 10950 4750 0    60   ~ 0
A22
Text Label 10450 4850 2    60   ~ 0
A23
Text Label 10450 5650 2    60   ~ 0
D0
Text Label 10950 5550 0    60   ~ 0
D1
Text Label 10450 5550 2    60   ~ 0
D2
Text Label 10950 5450 0    60   ~ 0
D3
Text Label 10450 5450 2    60   ~ 0
D4
Text Label 10950 5350 0    60   ~ 0
D5
Text Label 10450 5350 2    60   ~ 0
D6
Text Label 10950 5250 0    60   ~ 0
D7
Text Label 10450 5250 2    60   ~ 0
D8
Text Label 10950 5150 0    60   ~ 0
D9
Text Label 10450 5150 2    60   ~ 0
D10
Text Label 10950 5050 0    60   ~ 0
D11
Text Label 10450 5050 2    60   ~ 0
D12
Text Label 10950 4950 0    60   ~ 0
D13
Text Label 10450 4950 2    60   ~ 0
D14
Text Label 10950 4850 0    60   ~ 0
D15
Text Label 10950 5650 0    60   ~ 0
~DTACK
Text Label 10450 5750 2    60   ~ 0
R/~W
Text Label 10450 5850 2    60   ~ 0
~UDS
Text Label 10950 5750 0    60   ~ 0
~LDS
Text Label 10950 5850 0    60   ~ 0
~BR
Text Label 10450 5950 2    60   ~ 0
~BG
Text Label 10950 5950 0    60   ~ 0
~AVEC
Text Label 10450 6050 2    60   ~ 0
~IPL0
Text Label 10950 6050 0    60   ~ 0
~IPL1
Text Label 10450 6150 2    60   ~ 0
~IPL2
$Comp
L CONN_02X30 J?
U 1 1 59B04A64
P 10700 5000
F 0 "J?" H 10700 6550 50  0000 C CNN
F 1 "CONN_02X30" V 10700 5000 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_60pins" H 10700 4500 50  0001 C CNN
F 3 "" H 10700 4500 50  0001 C CNN
	1    10700 5000
	1    0    0    -1  
$EndComp
NoConn ~ 10450 6450
NoConn ~ 10950 6450
Text Label 10450 6250 2    60   ~ 0
CS0
Text Label 10450 6350 2    60   ~ 0
CS2
Text Label 10950 6250 0    60   ~ 0
CS1
Text Label 10950 6350 0    60   ~ 0
CS3
NoConn ~ 10950 6150
$Comp
L USB_B J?
U 1 1 59B18EEE
P 850 1050
F 0 "J?" H 650 1500 50  0000 L CNN
F 1 "USB_B" H 650 1400 50  0000 L CNN
F 2 "" H 1000 1000 50  0001 C CNN
F 3 "" H 1000 1000 50  0001 C CNN
	1    850  1050
	1    0    0    -1  
$EndComp
$Comp
L SD_Card J?
U 1 1 59B2E2DE
P 1950 2950
F 0 "J?" H 1300 3500 50  0000 C CNN
F 1 "SD_Card" H 2550 2400 50  0000 C CNN
F 2 "10067847-001" H 2150 3300 50  0001 C CNN
F 3 "" H 1950 2950 50  0001 C CNN
	1    1950 2950
	1    0    0    -1  
$EndComp
$Comp
L SST26VF U?
U 1 1 59B2EACF
P 1900 4050
F 0 "U?" H 2100 4550 60  0000 C CNN
F 1 "SST26VF" H 2000 4050 60  0000 C CNN
F 2 "" H 1900 4050 60  0001 C CNN
F 3 "" H 1900 4050 60  0001 C CNN
	1    1900 4050
	1    0    0    -1  
$EndComp
$Comp
L L_Small L?
U 1 1 59B2EC0C
P 1250 850
F 0 "L?" H 1280 890 50  0000 L CNN
F 1 "L_Small" H 1280 810 50  0000 L CNN
F 2 "" H 1250 850 50  0001 C CNN
F 3 "" H 1250 850 50  0001 C CNN
	1    1250 850 
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x02 J?
U 1 1 59B2EC72
P 1600 650
F 0 "J?" H 1600 750 50  0000 C CNN
F 1 "Conn_01x02" H 1600 450 50  0000 C CNN
F 2 "" H 1600 650 50  0001 C CNN
F 3 "" H 1600 650 50  0001 C CNN
	1    1600 650 
	0    -1   -1   0   
$EndComp
Text Label 1900 850  0    60   ~ 0
+5V
Text Label 2750 750  2    60   ~ 0
+5V
$Comp
L P8X32A U?
U 1 1 59B3AA64
P 8600 4850
F 0 "U?" H 8750 6300 60  0000 C CNN
F 1 "P8X32A" H 8650 3350 60  0000 C CNN
F 2 "" H 8650 5550 60  0001 C CNN
F 3 "" H 8650 5550 60  0001 C CNN
	1    8600 4850
	1    0    0    -1  
$EndComp
$Comp
L 24LC512 U?
U 1 1 59B3AAC7
P 5850 6800
F 0 "U?" H 5600 7050 50  0000 C CNN
F 1 "24LC512" H 5900 7050 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5900 6550 50  0001 L CNN
F 3 "" H 5850 6700 50  0001 C CNN
	1    5850 6800
	1    0    0    -1  
$EndComp
Text Label 9000 6050 0    60   ~ 0
SDA
Text Label 9000 5950 0    60   ~ 0
SCL
$Comp
L FT232R U?
U 1 1 59B3AEE5
P 3250 1300
F 0 "U?" H 3550 2050 60  0000 C CNN
F 1 "FT232R" H 3450 400 60  0000 C CNN
F 2 "" H 3300 1400 60  0001 C CNN
F 3 "" H 3300 1400 60  0001 C CNN
	1    3250 1300
	1    0    0    -1  
$EndComp
Text Label 2750 650  2    60   ~ 0
+3V3
Text Label 2750 1250 2    60   ~ 0
GND
Text Label 4100 650  0    60   ~ 0
FT232_TO_P8X32
Text Label 4100 750  0    60   ~ 0
P8X32_TO_FT232
Text Label 9000 6250 0    60   ~ 0
FT232_TO_P8X32
Text Label 9000 6150 0    60   ~ 0
P8X32_TO_FT232
Text Label 3800 1050 0    60   ~ 0
~DTR
$Comp
L Q_NPN_BEC Q?
U 1 1 59B3B633
P 5050 1400
F 0 "Q?" H 5250 1450 50  0000 L CNN
F 1 "Q_NPN_BEC" H 5250 1350 50  0000 L CNN
F 2 "" H 5250 1500 50  0001 C CNN
F 3 "" H 5050 1400 50  0001 C CNN
	1    5050 1400
	1    0    0    -1  
$EndComp
Text Notes 4450 1050 0    60   ~ 0
Transistorpins prüfen
Text Label 4550 1400 2    60   ~ 0
~DTR
$Comp
L C_Small C?
U 1 1 59B3B823
P 4650 1400
F 0 "C?" H 4660 1470 50  0000 L CNN
F 1 "10n" H 4660 1320 50  0000 L CNN
F 2 "" H 4650 1400 50  0001 C CNN
F 3 "" H 4650 1400 50  0001 C CNN
	1    4650 1400
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 59B3B888
P 4800 1550
F 0 "R?" H 4830 1570 50  0000 L CNN
F 1 "33k" H 4830 1510 50  0000 L CNN
F 2 "" H 4800 1550 50  0001 C CNN
F 3 "" H 4800 1550 50  0001 C CNN
	1    4800 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 59B3BA37
P 4800 1650
F 0 "#PWR?" H 4800 1400 50  0001 C CNN
F 1 "GND" H 4800 1500 50  0000 C CNN
F 2 "" H 4800 1650 50  0001 C CNN
F 3 "" H 4800 1650 50  0001 C CNN
	1    4800 1650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 59B3BA72
P 5150 1600
F 0 "#PWR?" H 5150 1350 50  0001 C CNN
F 1 "GND" H 5150 1450 50  0000 C CNN
F 2 "" H 5150 1600 50  0001 C CNN
F 3 "" H 5150 1600 50  0001 C CNN
	1    5150 1600
	1    0    0    -1  
$EndComp
Text Label 5150 1200 0    60   ~ 0
~RST
Text Label 8150 3750 2    60   ~ 0
~RST
$Comp
L R_Small R?
U 1 1 59B3BBDE
P 4000 650
F 0 "R?" V 4000 600 50  0000 L CNN
F 1 "150" V 4050 600 50  0000 L CNN
F 2 "" H 4000 650 50  0001 C CNN
F 3 "" H 4000 650 50  0001 C CNN
	1    4000 650 
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 59B3BC19
P 4000 750
F 0 "R?" V 4000 700 50  0000 L CNN
F 1 "150" V 4050 700 50  0000 L CNN
F 2 "" H 4000 750 50  0001 C CNN
F 3 "" H 4000 750 50  0001 C CNN
	1    4000 750 
	0    1    1    0   
$EndComp
Text Label 6600 6700 0    60   ~ 0
SDA
Text Label 6600 6800 0    60   ~ 0
SCL
Wire Wire Line
	1350 850  1600 850 
Wire Wire Line
	1700 850  1900 850 
Wire Wire Line
	2750 950  2750 1250
Connection ~ 2750 1050
Connection ~ 2750 1150
Wire Wire Line
	4750 1400 4850 1400
Wire Wire Line
	4800 1450 4800 1400
Connection ~ 4800 1400
Wire Wire Line
	3800 750  3900 750 
Wire Wire Line
	5450 6450 5450 7100
Connection ~ 5450 6800
Wire Wire Line
	5450 7100 6250 7100
Connection ~ 5450 6900
$Comp
L GND #PWR?
U 1 1 59B3C668
P 5850 7100
F 0 "#PWR?" H 5850 6850 50  0001 C CNN
F 1 "GND" H 5850 6950 50  0000 C CNN
F 2 "" H 5850 7100 50  0001 C CNN
F 3 "" H 5850 7100 50  0001 C CNN
	1    5850 7100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 59B3C703
P 5850 6400
F 0 "#PWR?" H 5850 6250 50  0001 C CNN
F 1 "+3V3" H 5850 6540 50  0000 C CNN
F 2 "" H 5850 6400 50  0001 C CNN
F 3 "" H 5850 6400 50  0001 C CNN
	1    5850 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 7100 6250 6900
Connection ~ 5850 7100
Wire Wire Line
	5850 6400 5850 6500
Wire Wire Line
	5450 6450 6450 6450
Connection ~ 5450 6700
Connection ~ 5850 6450
$Comp
L R_Small R?
U 1 1 59B3CC20
P 6350 6550
F 0 "R?" H 6300 6600 50  0000 L CNN
F 1 "10k" H 6300 6550 50  0000 L CNN
F 2 "" H 6350 6550 50  0001 C CNN
F 3 "" H 6350 6550 50  0001 C CNN
	1    6350 6550
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 59B3CCB5
P 6450 6550
F 0 "R?" H 6400 6600 50  0000 L CNN
F 1 "10k" H 6400 6550 50  0000 L CNN
F 2 "" H 6450 6550 50  0001 C CNN
F 3 "" H 6450 6550 50  0001 C CNN
	1    6450 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 6700 6600 6700
Connection ~ 6350 6700
Wire Wire Line
	6250 6800 6600 6800
Connection ~ 6450 6800
Connection ~ 6350 6450
Wire Wire Line
	6350 6650 6350 6700
Wire Wire Line
	6450 6650 6450 6800
Text Label 8150 3650 2    60   ~ 0
GND
$Comp
L C_Small C?
U 1 1 59B3D5FE
P 8050 5400
F 0 "C?" H 8060 5470 50  0000 L CNN
F 1 "100n" H 8060 5320 50  0000 L CNN
F 2 "" H 8050 5400 50  0001 C CNN
F 3 "" H 8050 5400 50  0001 C CNN
	1    8050 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5250 7600 5250
Wire Wire Line
	8050 5250 8050 5300
Wire Wire Line
	7600 5550 8150 5550
Wire Wire Line
	8050 5550 8050 5500
$Comp
L C_Small C?
U 1 1 59B3D6E1
P 7900 5400
F 0 "C?" H 7910 5470 50  0000 L CNN
F 1 "100n" H 7910 5320 50  0000 L CNN
F 2 "" H 7900 5400 50  0001 C CNN
F 3 "" H 7900 5400 50  0001 C CNN
	1    7900 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5550 8150 5900
Connection ~ 8150 5650
Connection ~ 8150 5750
Connection ~ 8150 5850
$Comp
L GND #PWR?
U 1 1 59B3D890
P 8150 5900
F 0 "#PWR?" H 8150 5650 50  0001 C CNN
F 1 "GND" H 8150 5750 50  0000 C CNN
F 2 "" H 8150 5900 50  0001 C CNN
F 3 "" H 8150 5900 50  0001 C CNN
	1    8150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5500 7900 5550
Connection ~ 8050 5550
Wire Wire Line
	8150 4850 8150 5250
Connection ~ 8150 5150
Connection ~ 8150 5050
Connection ~ 8150 4950
$Comp
L +3V3 #PWR?
U 1 1 59B3DAD5
P 8150 4850
F 0 "#PWR?" H 8150 4700 50  0001 C CNN
F 1 "+3V3" H 8150 4990 50  0000 C CNN
F 2 "" H 8150 4850 50  0001 C CNN
F 3 "" H 8150 4850 50  0001 C CNN
	1    8150 4850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 59B3DB6E
P 7750 5400
F 0 "C?" H 7760 5470 50  0000 L CNN
F 1 "100n" H 7760 5320 50  0000 L CNN
F 2 "" H 7750 5400 50  0001 C CNN
F 3 "" H 7750 5400 50  0001 C CNN
	1    7750 5400
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 59B3DBCA
P 7600 5400
F 0 "C?" H 7610 5470 50  0000 L CNN
F 1 "100n" H 7610 5320 50  0000 L CNN
F 2 "" H 7600 5400 50  0001 C CNN
F 3 "" H 7600 5400 50  0001 C CNN
	1    7600 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5250 7900 5300
Connection ~ 8050 5250
Wire Wire Line
	7600 5250 7600 5300
Connection ~ 7900 5250
Wire Wire Line
	7750 5300 7750 5250
Connection ~ 7750 5250
Wire Wire Line
	7600 5550 7600 5500
Connection ~ 7900 5550
Wire Wire Line
	7750 5500 7750 5550
Connection ~ 7750 5550
Text Label 9150 4550 0    60   ~ 0
MISO
Text Label 9150 4650 0    60   ~ 0
MOSI
Text Label 9150 4750 0    60   ~ 0
SCK
Text Label 9150 4850 0    60   ~ 0
~SD_CS
Text Label 9150 4950 0    60   ~ 0
~FLASH_CS
Text Label 8200 800  2    60   ~ 0
R/~W
Text Label 8200 900  2    60   ~ 0
~LDS
Text Label 9150 3550 0    60   ~ 0
~DTACK
Text Label 9150 3650 0    60   ~ 0
~AVEC
Text Label 9150 5050 0    60   ~ 0
~ETHER_CS
Text Label 1550 3650 2    60   ~ 0
~FLASH_CS
Text Label 950  2750 2    60   ~ 0
~SD_CS
$Comp
L MCP23S17 U?
U 1 1 59B3FBAC
P 8700 1600
F 0 "U?" H 8600 2625 50  0000 R CNN
F 1 "MCP23S17" H 8600 2550 50  0000 R CNN
F 2 "" H 8750 650 50  0001 L CNN
F 3 "" H 8950 2600 50  0001 C CNN
	1    8700 1600
	1    0    0    -1  
$EndComp
$Comp
L ENC28J60-I/SO U?
U 1 1 59B3F534
P 1800 6400
F 0 "U?" H 1250 7350 50  0000 L CNN
F 1 "ENC28J60-I/SO" H 2000 7350 50  0000 L CNN
F 2 "SOIC-28" H 1800 6400 50  0001 C CIN
F 3 "" H 1800 6400 50  0001 C CNN
	1    1800 6400
	1    0    0    -1  
$EndComp
Text Label 1100 6100 2    60   ~ 0
~ETHER_CS
$Comp
L MCP23S17 U?
U 1 1 59B3F671
P 7100 1600
F 0 "U?" H 7000 2625 50  0000 R CNN
F 1 "MCP23S17" H 7000 2550 50  0000 R CNN
F 2 "" H 7150 650 50  0001 L CNN
F 3 "" H 7350 2600 50  0001 C CNN
	1    7100 1600
	1    0    0    -1  
$EndComp
Text Label 8200 1100 2    60   ~ 0
A1
Text Label 8200 1200 2    60   ~ 0
A2
Text Label 8200 1300 2    60   ~ 0
A3
Text Label 8200 1400 2    60   ~ 0
A4
Text Label 8200 1500 2    60   ~ 0
A5
Text Label 8200 1700 2    60   ~ 0
A6
Text Label 8200 1800 2    60   ~ 0
A7
Text Label 8200 1900 2    60   ~ 0
A8
Text Label 8200 2000 2    60   ~ 0
A9
Text Label 8200 2100 2    60   ~ 0
A10
Text Label 8200 2200 2    60   ~ 0
A11
Text Label 8200 2300 2    60   ~ 0
A12
Text Label 8200 2400 2    60   ~ 0
A13
Text Label 6600 800  2    60   ~ 0
A14
Text Label 6600 900  2    60   ~ 0
A15
Text Label 6600 1000 2    60   ~ 0
A16
Text Label 6600 1100 2    60   ~ 0
A17
Text Label 6600 1200 2    60   ~ 0
A18
Text Label 6600 1300 2    60   ~ 0
A19
Text Label 6600 1400 2    60   ~ 0
A20
Text Label 6600 1500 2    60   ~ 0
A21
Text Label 6600 1700 2    60   ~ 0
A22
Text Label 6600 1800 2    60   ~ 0
A23
Text Label 8200 1000 2    60   ~ 0
~UDS
$Comp
L MCP23S17 U?
U 1 1 59B40198
P 10300 1600
F 0 "U?" H 10200 2625 50  0000 R CNN
F 1 "MCP23S17" H 10200 2550 50  0000 R CNN
F 2 "" H 10350 650 50  0001 L CNN
F 3 "" H 10550 2600 50  0001 C CNN
	1    10300 1600
	1    0    0    -1  
$EndComp
Text Label 9800 800  2    60   ~ 0
D0
Text Label 9800 900  2    60   ~ 0
D1
Text Label 9800 1000 2    60   ~ 0
D2
Text Label 9800 1100 2    60   ~ 0
D3
Text Label 9800 1200 2    60   ~ 0
D4
Text Label 9800 1300 2    60   ~ 0
D5
Text Label 9800 1400 2    60   ~ 0
D6
Text Label 9800 1500 2    60   ~ 0
D7
Text Label 9800 1700 2    60   ~ 0
D8
Text Label 9800 1800 2    60   ~ 0
D9
Text Label 9800 1900 2    60   ~ 0
D10
Text Label 9800 2000 2    60   ~ 0
D11
Text Label 9800 2100 2    60   ~ 0
D12
Text Label 9800 2200 2    60   ~ 0
D13
Text Label 9800 2300 2    60   ~ 0
D14
Text Label 9800 2400 2    60   ~ 0
D15
Text Label 9150 5150 0    60   ~ 0
~PE_CS
Text Label 9150 4150 0    60   ~ 0
CS0
Text Label 9150 4250 0    60   ~ 0
CS1
Text Label 9150 4350 0    60   ~ 0
CS2
Text Label 9150 4450 0    60   ~ 0
CS3
Text Label 9150 3750 0    60   ~ 0
~IPL0
Text Label 9150 3850 0    60   ~ 0
~IPL1
Text Label 9150 3950 0    60   ~ 0
~IPL2
Text Label 9150 4050 0    60   ~ 0
~IPL3
Text Label 6600 1900 2    60   ~ 0
~BR
Text Label 6600 2000 2    60   ~ 0
~BG
Wire Wire Line
	9200 2200 9200 2400
Connection ~ 9200 2300
$Comp
L GND #PWR?
U 1 1 59B41A4E
P 9200 2400
F 0 "#PWR?" H 9200 2150 50  0001 C CNN
F 1 "GND" H 9200 2250 50  0000 C CNN
F 2 "" H 9200 2400 50  0001 C CNN
F 3 "" H 9200 2400 50  0001 C CNN
	1    9200 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2300 7600 2400
$Comp
L GND #PWR?
U 1 1 59B41BD2
P 7600 2400
F 0 "#PWR?" H 7600 2150 50  0001 C CNN
F 1 "GND" H 7600 2250 50  0000 C CNN
F 2 "" H 7600 2400 50  0001 C CNN
F 3 "" H 7600 2400 50  0001 C CNN
	1    7600 2400
	1    0    0    -1  
$EndComp
Text Label 7600 2200 0    60   ~ 0
+3V3
Text Label 10800 2200 0    60   ~ 0
GND
Text Label 10800 2300 0    60   ~ 0
+3V3
Text Label 10800 2400 0    60   ~ 0
GND
Text Label 10800 1700 0    60   ~ 0
~PE_CS
Text Label 7600 1700 0    60   ~ 0
~PE_CS
Text Label 9200 1700 0    60   ~ 0
~PE_CS
Text Label 9200 1800 0    60   ~ 0
SCK
Text Label 9200 1900 0    60   ~ 0
MOSI
Text Label 9200 2000 0    60   ~ 0
MISO
Text Label 7600 1800 0    60   ~ 0
SCK
Text Label 7600 1900 0    60   ~ 0
MOSI
Text Label 7600 2000 0    60   ~ 0
MISO
Text Label 10800 1800 0    60   ~ 0
SCK
Text Label 10800 1900 0    60   ~ 0
MOSI
Text Label 10800 2000 0    60   ~ 0
MISO
NoConn ~ 10800 1200
NoConn ~ 10800 1300
NoConn ~ 7600 1200
NoConn ~ 7600 1300
NoConn ~ 9200 1200
NoConn ~ 9200 1300
Text Label 9150 5250 0    60   ~ 0
PS2_CLK
Text Label 9150 5350 0    60   ~ 0
PS2_DAT
Text Label 9150 5450 0    60   ~ 0
HS
Text Label 9150 5550 0    60   ~ 0
VS
Text Label 9150 5650 0    60   ~ 0
R
Text Label 9150 5750 0    60   ~ 0
G
Text Label 9150 5850 0    60   ~ 0
B
Wire Wire Line
	3800 650  3900 650 
Text Notes 7800 2800 0    60   ~ 0
Reicht ein CS für alle drei Portexpander?
$EndSCHEMATC
