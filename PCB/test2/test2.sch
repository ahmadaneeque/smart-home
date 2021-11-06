EESchema Schematic File Version 4
EELAYER 30 0
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
$Comp
L RF_Module:ESP-12E U8
U 1 1 5E262952
P 9400 1950
F 0 "U8" H 9400 2931 50  0000 C CNN
F 1 "ESP-12E" H 9700 2700 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 9400 1950 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 9050 2050 50  0001 C CNN
	1    9400 1950
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:VIPer22ADIP-E U3
U 1 1 5E276B60
P 4300 2350
F 0 "U3" H 4730 2396 50  0000 L CNN
F 1 "VIPer22ADIP-E" H 4730 2305 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4750 2400 50  0001 L CIN
F 3 "http://www.st.com/web/en/resource/technical/document/datasheet/CD00087939.pdf" H 4300 2350 50  0001 C CNN
	1    4300 2350
	1    0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U5
U 1 1 5E278F87
P 5300 2100
F 0 "U5" H 5300 2425 50  0000 C CNN
F 1 "PC817" H 5300 2334 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 5100 1900 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 5300 2100 50  0001 L CNN
	1    5300 2100
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5E27F22E
P 5650 2050
F 0 "R6" H 5720 2096 50  0000 L CNN
F 1 "2k" H 5720 2005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5580 2050 50  0001 C CNN
F 3 "~" H 5650 2050 50  0001 C CNN
	1    5650 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5E27F9BB
P 6100 1900
F 0 "R7" H 6170 1946 50  0000 L CNN
F 1 "2.5k" H 6170 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6030 1900 50  0001 C CNN
F 3 "~" H 6100 1900 50  0001 C CNN
	1    6100 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2000 5600 1900
Wire Wire Line
	5600 1900 5650 1900
$Comp
L Device:R R5
U 1 1 5E2884EE
P 5650 1700
F 0 "R5" H 5720 1746 50  0000 L CNN
F 1 "2k" H 5720 1655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5580 1700 50  0001 C CNN
F 3 "~" H 5650 1700 50  0001 C CNN
	1    5650 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1850 5650 1900
Connection ~ 5650 1900
Wire Wire Line
	5650 1550 6100 1550
Wire Wire Line
	6100 1550 6100 1750
$Comp
L Transformer:LL1587 T1
U 1 1 5E291354
P 5300 900
F 0 "T1" H 5300 1465 50  0000 C CNN
F 1 "LL1587" H 5300 1374 50  0000 C CNN
F 2 "transformer_custom:5v_1_A_flyback transformer 78_5_11" H 5300 900 50  0001 C CNN
F 3 "http://www.lundahl.se/wp-content/uploads/datasheets/1587.pdf" H 5300 900 50  0001 C CNN
	1    5300 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5E2955BF
P 1750 1100
F 0 "C2" H 1842 1146 50  0000 L CNN
F 1 "X2" H 1842 1055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L10.0mm_D6.0mm_P15.00mm_Horizontal" H 1750 1100 50  0001 C CNN
F 3 "~" H 1750 1100 50  0001 C CNN
	1    1750 1100
	1    0    0    1   
$EndComp
$Comp
L Device:CP1 C3
U 1 1 5E2AAA90
P 3000 1100
F 0 "C3" H 3115 1146 50  0000 L CNN
F 1 "33uf" H 3115 1055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm_P7.50mm" H 3000 1100 50  0001 C CNN
F 3 "~" H 3000 1100 50  0001 C CNN
	1    3000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 950  3000 800 
Wire Wire Line
	1750 1000 1750 800 
Wire Wire Line
	1750 1200 1750 1500
Wire Wire Line
	1750 800  1650 800 
Wire Wire Line
	1650 800  1650 1000
Wire Wire Line
	1650 1200 1650 1500
Wire Wire Line
	1650 1500 1750 1500
Wire Wire Line
	3000 1500 3250 1500
Connection ~ 3000 1500
Wire Wire Line
	4300 1950 4400 1950
Wire Wire Line
	4500 1950 4600 1950
Wire Wire Line
	4500 1950 4400 1950
Connection ~ 4500 1950
Connection ~ 4400 1950
Wire Wire Line
	4600 1950 4600 600 
Wire Wire Line
	4600 600  4900 600 
Connection ~ 4600 1950
Wire Wire Line
	4450 600  4600 600 
Connection ~ 4600 600 
Wire Wire Line
	3000 800  3600 800 
$Comp
L Device:C_Small C7
U 1 1 5E2EF0A8
P 3850 700
F 0 "C7" H 3942 746 50  0000 L CNN
F 1 "104" H 3942 655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3850 700 50  0001 C CNN
F 3 "~" H 3850 700 50  0001 C CNN
	1    3850 700 
	1    0    0    -1  
$EndComp
Connection ~ 3850 800 
Wire Wire Line
	3850 800  4900 800 
$Comp
L Device:R R1
U 1 1 5E2EFC18
P 3600 650
F 0 "R1" H 3670 696 50  0000 L CNN
F 1 "120k" H 3670 605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3530 650 50  0001 C CNN
F 3 "~" H 3600 650 50  0001 C CNN
	1    3600 650 
	1    0    0    -1  
$EndComp
Connection ~ 3600 800 
Wire Wire Line
	3600 800  3850 800 
Wire Wire Line
	3600 500  3850 500 
Wire Wire Line
	3850 500  3850 600 
Connection ~ 3850 600 
Wire Wire Line
	4600 2750 4500 2750
Connection ~ 4500 2750
Wire Wire Line
	4000 1000 4000 1500
Wire Wire Line
	4900 1200 4900 2750
Wire Wire Line
	4900 2750 4600 2750
Connection ~ 4600 2750
Wire Wire Line
	3550 1150 3550 1000
Wire Wire Line
	3550 1000 4000 1000
Wire Wire Line
	3250 1500 3550 1500
Wire Wire Line
	3550 1500 3550 1450
Connection ~ 3250 1500
Wire Wire Line
	6250 700  6250 1550
$Comp
L Device:CP1 C9
U 1 1 5E309225
P 6450 950
F 0 "C9" H 6565 996 50  0000 L CNN
F 1 "CP1" H 6565 905 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P5.00mm" H 6450 950 50  0001 C CNN
F 3 "~" H 6450 950 50  0001 C CNN
	1    6450 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 700  6450 700 
Wire Wire Line
	6450 700  6450 800 
Wire Wire Line
	5700 1100 5800 1100
$Comp
L power:GND #PWR012
U 1 1 5E30EA07
P 5800 1300
F 0 "#PWR012" H 5800 1050 50  0001 C CNN
F 1 "GND" H 5805 1127 50  0000 C CNN
F 2 "" H 5800 1300 50  0001 C CNN
F 3 "" H 5800 1300 50  0001 C CNN
	1    5800 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 1300 5800 1100
Connection ~ 5800 1100
Wire Wire Line
	5800 1100 6450 1100
$Comp
L power:GND #PWR06
U 1 1 5E31161B
P 3000 1800
F 0 "#PWR06" H 3000 1550 50  0001 C CNN
F 1 "GND" H 3005 1627 50  0000 C CNN
F 2 "" H 3000 1800 50  0001 C CNN
F 3 "" H 3000 1800 50  0001 C CNN
	1    3000 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5E312090
P 3000 1600
F 0 "C4" H 3092 1646 50  0000 L CNN
F 1 "C_Small" H 3092 1555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D10.5mm_W5.0mm_P7.50mm" H 3000 1600 50  0001 C CNN
F 3 "~" H 3000 1600 50  0001 C CNN
	1    3000 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1700 3000 1800
$Comp
L Device:C_Small C5
U 1 1 5E31D1DB
P 3500 2650
F 0 "C5" H 3592 2696 50  0000 L CNN
F 1 "C_Small" H 3592 2605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3500 2650 50  0001 C CNN
F 3 "~" H 3500 2650 50  0001 C CNN
	1    3500 2650
	1    0    0    -1  
$EndComp
Connection ~ 3500 2750
Wire Wire Line
	3500 2750 3250 2750
Wire Wire Line
	3500 2550 3800 2550
Wire Wire Line
	5000 2200 3500 2200
Wire Wire Line
	3500 2200 3500 2550
Connection ~ 3500 2550
Wire Wire Line
	4000 1500 5000 1500
Wire Wire Line
	5000 1500 5000 2000
Connection ~ 4000 1500
Wire Wire Line
	4000 1500 4000 1950
$Comp
L pspice:INDUCTOR L2
U 1 1 5E326950
P 6700 700
F 0 "L2" H 6700 915 50  0000 C CNN
F 1 "INDUCTOR" H 6700 824 50  0000 C CNN
F 2 "Inductor_THT:L_Axial_L12.0mm_D5.0mm_P5.08mm_Vertical_Fastron_MISC" H 6700 700 50  0001 C CNN
F 3 "~" H 6700 700 50  0001 C CNN
	1    6700 700 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5E327A07
P 6950 900
F 0 "R10" H 7020 946 50  0000 L CNN
F 1 "R" H 7020 855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6880 900 50  0001 C CNN
F 3 "~" H 6950 900 50  0001 C CNN
	1    6950 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 700  6950 750 
Wire Wire Line
	6450 1100 6950 1100
Wire Wire Line
	6950 1100 6950 1050
Connection ~ 6450 1100
$Comp
L power:+5V #PWR016
U 1 1 5E32E1BD
P 7200 600
F 0 "#PWR016" H 7200 450 50  0001 C CNN
F 1 "+5V" H 7215 773 50  0000 C CNN
F 2 "" H 7200 600 50  0001 C CNN
F 3 "" H 7200 600 50  0001 C CNN
	1    7200 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 700  7200 700 
Wire Wire Line
	7200 700  7200 600 
$Comp
L Device:Thermistor_NTC TH1
U 1 1 5E3355BA
P 650 1000
F 0 "TH1" H 748 1046 50  0000 L CNN
F 1 "Thermistor_NTC" H 748 955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 650 1050 50  0001 C CNN
F 3 "~" H 650 1050 50  0001 C CNN
	1    650  1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2200 5650 2250
Connection ~ 6100 1550
Wire Wire Line
	6100 1550 6250 1550
Connection ~ 6250 700 
Wire Wire Line
	5600 2200 5600 2250
Wire Wire Line
	5600 2250 5650 2250
$Comp
L Regulator_Linear:AZ1117-3.3 U1
U 1 1 5E37A0E0
P 1900 2750
F 0 "U1" H 1900 2992 50  0000 C CNN
F 1 "AZ1117-3.3" H 1900 2901 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223" H 1900 3000 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 1900 2750 50  0001 C CNN
	1    1900 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E37B279
P 1900 3200
F 0 "#PWR04" H 1900 2950 50  0001 C CNN
F 1 "GND" H 1905 3027 50  0000 C CNN
F 2 "" H 1900 3200 50  0001 C CNN
F 3 "" H 1900 3200 50  0001 C CNN
	1    1900 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5E37BD4D
P 1500 2450
F 0 "#PWR03" H 1500 2300 50  0001 C CNN
F 1 "+5V" H 1515 2623 50  0000 C CNN
F 2 "" H 1500 2450 50  0001 C CNN
F 3 "" H 1500 2450 50  0001 C CNN
	1    1500 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5E37C794
P 2250 2500
F 0 "#PWR05" H 2250 2350 50  0001 C CNN
F 1 "+3.3V" H 2265 2673 50  0000 C CNN
F 2 "" H 2250 2500 50  0001 C CNN
F 3 "" H 2250 2500 50  0001 C CNN
	1    2250 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2500 2250 2750
Wire Wire Line
	2250 2750 2200 2750
Wire Wire Line
	1500 2450 1500 2750
Wire Wire Line
	1500 2750 1600 2750
Wire Wire Line
	1900 3050 1900 3200
$Comp
L Diode:1N4007 D12
U 1 1 5E331E5A
P 4150 1000
F 0 "D12" H 4150 1216 50  0000 C CNN
F 1 "1N4007" H 4150 1125 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4150 825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4150 1000 50  0001 C CNN
	1    4150 1000
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D13
U 1 1 5E332C65
P 4300 600
F 0 "D13" H 4300 816 50  0000 C CNN
F 1 "1N4007" H 4300 725 50  0000 C CNN
F 2 "Diode_THT:D_DO-15_P3.81mm_Vertical_KathodeUp" H 4300 425 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4300 600 50  0001 C CNN
	1    4300 600 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5822 D15
U 1 1 5E3349BB
P 6000 700
F 0 "D15" H 6000 484 50  0000 C CNN
F 1 "1N5822" H 6000 575 50  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P5.08mm_Vertical_KathodeUp" H 6000 525 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 6000 700 50  0001 C CNN
	1    6000 700 
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 700  5850 700 
Connection ~ 4000 1000
Wire Wire Line
	3850 600  4150 600 
Wire Wire Line
	4300 1000 4900 1000
Wire Wire Line
	6150 700  6250 700 
$Comp
L power:+3.3V #PWR018
U 1 1 5E3565CB
P 9400 850
F 0 "#PWR018" H 9400 700 50  0001 C CNN
F 1 "+3.3V" H 9550 900 50  0000 C CNN
F 2 "" H 9400 850 50  0001 C CNN
F 3 "" H 9400 850 50  0001 C CNN
	1    9400 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5E35C705
P 9400 2800
F 0 "#PWR019" H 9400 2550 50  0001 C CNN
F 1 "GND" H 9405 2627 50  0000 C CNN
F 2 "" H 9400 2800 50  0001 C CNN
F 3 "" H 9400 2800 50  0001 C CNN
	1    9400 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5E35E564
P 9400 5850
F 0 "#PWR021" H 9400 5600 50  0001 C CNN
F 1 "GND" H 9405 5677 50  0000 C CNN
F 2 "" H 9400 5850 50  0001 C CNN
F 3 "" H 9400 5850 50  0001 C CNN
	1    9400 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR020
U 1 1 5E35F4CE
P 9400 3600
F 0 "#PWR020" H 9400 3450 50  0001 C CNN
F 1 "+3.3V" H 9550 3650 50  0000 C CNN
F 2 "" H 9400 3600 50  0001 C CNN
F 3 "" H 9400 3600 50  0001 C CNN
	1    9400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  4550 550  4550
Wire Wire Line
	550  4550 550  5100
Connection ~ 550  5100
Wire Wire Line
	2600 6950 2600 6350
Wire Wire Line
	2600 6950 3500 6950
Connection ~ 2600 6950
Wire Wire Line
	650  850  650  800 
Wire Wire Line
	600  1700 600  1900
Wire Wire Line
	600  1600 550  1600
Wire Wire Line
	550  1600 550  4550
Connection ~ 550  4550
Wire Wire Line
	3350 6450 3200 6450
Wire Wire Line
	2350 6450 2400 6450
$Comp
L power:+5V #PWR01
U 1 1 5E40AA29
P 750 3400
F 0 "#PWR01" H 750 3250 50  0001 C CNN
F 1 "+5V" H 765 3573 50  0000 C CNN
F 2 "" H 750 3400 50  0001 C CNN
F 3 "" H 750 3400 50  0001 C CNN
	1    750  3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  3400 750  3500
Wire Wire Line
	3450 4100 3350 4100
Wire Wire Line
	1700 4150 1600 4150
Wire Wire Line
	3250 4100 3200 4100
Wire Wire Line
	4150 4100 4050 4100
Wire Wire Line
	750  5400 750  7200
Wire Wire Line
	2500 5950 2600 5950
Wire Wire Line
	3250 5950 3200 5950
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 5E89F7FC
P 10850 1250
F 0 "J3" H 10822 1224 50  0000 R CNN
F 1 "Conn_01x07_Male" H 10822 1133 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 10850 1250 50  0001 C CNN
F 3 "~" H 10850 1250 50  0001 C CNN
	1    10850 1250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5E8DBADB
P 8200 1200
F 0 "R19" H 8270 1246 50  0000 L CNN
F 1 "R" H 8270 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8130 1200 50  0001 C CNN
F 3 "~" H 8200 1200 50  0001 C CNN
	1    8200 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 1050 8500 1050
Wire Wire Line
	9400 850  9400 1050
Connection ~ 9400 1050
Wire Wire Line
	9400 1050 9400 1150
Wire Wire Line
	7950 550  10400 550 
Wire Wire Line
	7950 1350 8200 1350
Connection ~ 8200 1350
Wire Wire Line
	8200 1350 8800 1350
Connection ~ 7950 1350
Wire Wire Line
	7450 1350 7400 1350
Wire Wire Line
	6950 1350 6950 1100
Connection ~ 6950 1100
$Comp
L Switch:SW_Push SW1
U 1 1 5E949164
P 6650 5700
F 0 "SW1" H 6650 5985 50  0000 C CNN
F 1 "SW_Push" H 6650 5894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 6650 5900 50  0001 C CNN
F 3 "~" H 6650 5900 50  0001 C CNN
	1    6650 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 800  7950 800 
Connection ~ 7950 800 
Wire Wire Line
	7950 800  7950 550 
Wire Wire Line
	7500 800  7400 800 
Wire Wire Line
	7400 800  7400 1350
Connection ~ 7400 1350
Wire Wire Line
	7400 1350 6950 1350
Wire Wire Line
	10150 1450 10000 1450
Wire Wire Line
	9400 2650 9400 2700
$Comp
L Device:R R20
U 1 1 5EA7B2BF
P 8500 1400
F 0 "R20" V 8500 1400 50  0000 C CNN
F 1 "R" H 8384 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8430 1400 50  0001 C CNN
F 3 "~" H 8500 1400 50  0001 C CNN
	1    8500 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5EAA8DD3
P 10550 1750
F 0 "#PWR022" H 10550 1500 50  0001 C CNN
F 1 "GND" H 10555 1577 50  0000 C CNN
F 2 "" H 10550 1750 50  0001 C CNN
F 3 "" H 10550 1750 50  0001 C CNN
	1    10550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 1550 10550 1550
Wire Wire Line
	10550 1550 10550 1700
$Comp
L Device:R R8
U 1 1 5E28002A
P 6100 2500
F 0 "R8" H 6170 2546 50  0000 L CNN
F 1 "2.5" H 6170 2455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6030 2500 50  0001 C CNN
F 3 "~" H 6100 2500 50  0001 C CNN
	1    6100 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5E2BEE3F
P 5800 2250
F 0 "C8" H 5915 2296 50  0000 L CNN
F 1 "100nf" H 5915 2205 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 5838 2100 50  0001 C CNN
F 3 "~" H 5800 2250 50  0001 C CNN
	1    5800 2250
	0    1    1    0   
$EndComp
$Comp
L Reference_Voltage:TL431KTP U6
U 1 1 5E27E571
P 5650 2350
F 0 "U6" V 5696 2281 50  0000 R CNN
F 1 "TL431D" V 5605 2281 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 5650 2100 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 5650 2350 50  0001 C CIN
	1    5650 2350
	0    1    -1   0   
$EndComp
Connection ~ 5650 2250
Wire Wire Line
	5650 2450 5650 2750
Wire Wire Line
	5650 2750 5750 2750
$Comp
L power:GND #PWR011
U 1 1 5E288AC5
P 5750 2750
F 0 "#PWR011" H 5750 2500 50  0001 C CNN
F 1 "GND" H 5755 2577 50  0000 C CNN
F 2 "" H 5750 2750 50  0001 C CNN
F 3 "" H 5750 2750 50  0001 C CNN
	1    5750 2750
	1    0    0    -1  
$EndComp
Connection ~ 5750 2750
Wire Wire Line
	5750 2750 6100 2750
Wire Wire Line
	6100 2650 6100 2750
Wire Wire Line
	6100 2050 6100 2250
Connection ~ 6100 2350
Wire Wire Line
	5750 2350 6100 2350
Wire Wire Line
	5950 2250 6100 2250
Connection ~ 6100 2250
Wire Wire Line
	6100 2250 6100 2350
Wire Wire Line
	10650 6050 10650 2400
$Comp
L Switch:SW_Push SW2
U 1 1 5F1A5B58
P 6650 5300
F 0 "SW2" H 6650 5585 50  0000 C CNN
F 1 "SW_Push" H 6650 5494 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 6650 5500 50  0001 C CNN
F 3 "~" H 6650 5500 50  0001 C CNN
	1    6650 5300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 5F2229E7
P 7700 5700
F 0 "SW5" H 7700 5985 50  0000 C CNN
F 1 "SW_Push" H 7700 5894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 7700 5900 50  0001 C CNN
F 3 "~" H 7700 5900 50  0001 C CNN
	1    7700 5700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 5F1FA565
P 7150 5300
F 0 "SW4" H 7150 5585 50  0000 C CNN
F 1 "SW_Push" H 7150 5494 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 7150 5500 50  0001 C CNN
F 3 "~" H 7150 5500 50  0001 C CNN
	1    7150 5300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 5F3E3F7D
P 7700 5300
F 0 "SW6" H 7700 5585 50  0000 C CNN
F 1 "SW_Push" H 7700 5494 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 7700 5500 50  0001 C CNN
F 3 "~" H 7700 5500 50  0001 C CNN
	1    7700 5300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW7
U 1 1 5F3E3F89
P 8200 5700
F 0 "SW7" H 8200 5985 50  0000 C CNN
F 1 "SW_Push" H 8200 5894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 8200 5900 50  0001 C CNN
F 3 "~" H 8200 5900 50  0001 C CNN
	1    8200 5700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW9
U 1 1 5F3E3F95
P 7700 800
F 0 "SW9" H 7700 1085 50  0000 C CNN
F 1 "SW_Push" H 7700 994 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 7700 1000 50  0001 C CNN
F 3 "~" H 7700 1000 50  0001 C CNN
	1    7700 800 
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW8
U 1 1 5F3E3F9B
P 8200 5300
F 0 "SW8" H 8200 5585 50  0000 C CNN
F 1 "SW_Push" H 8200 5494 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 8200 5500 50  0001 C CNN
F 3 "~" H 8200 5500 50  0001 C CNN
	1    8200 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1350 7950 800 
$Comp
L pspice:CAP C10
U 1 1 5E9311AD
P 7700 1350
F 0 "C10" V 7385 1350 50  0000 C CNN
F 1 "10uf" V 7476 1350 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 7700 1350 50  0001 C CNN
F 3 "~" H 7700 1350 50  0001 C CNN
	1    7700 1350
	0    1    1    0   
$EndComp
$Comp
L Triac_Thyristor:BT136-500 Q1
U 1 1 5E43BEAD
P 3750 6300
F 0 "Q1" H 3879 6346 50  0000 L CNN
F 1 "BT136-500" H 3879 6255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3950 6225 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 3750 6300 50  0001 L CNN
	1    3750 6300
	-1   0    0    -1  
$EndComp
$Comp
L Relay_SolidState:MOC3020M U2
U 1 1 5E5672C8
P 4800 6300
F 0 "U2" H 4800 6625 50  0000 C CNN
F 1 "MOC3020M" H 4800 6534 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 4600 6100 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 4800 6300 50  0001 L CNN
	1    4800 6300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4500 6400 3900 6400
$Comp
L Device:R R2
U 1 1 5E63174E
P 4200 6100
F 0 "R2" V 4407 6100 50  0000 C CNN
F 1 "470" V 4316 6100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4130 6100 50  0001 C CNN
F 3 "~" H 4200 6100 50  0001 C CNN
	1    4200 6100
	0    1    -1   0   
$EndComp
Wire Wire Line
	4500 6200 4450 6200
Wire Wire Line
	4450 6200 4450 6100
Wire Wire Line
	4450 6100 4350 6100
Wire Wire Line
	4050 6100 3750 6100
Wire Wire Line
	3750 6100 3750 6150
Wire Wire Line
	3500 5650 3500 6950
Connection ~ 3750 6100
$Comp
L power:GND #PWR07
U 1 1 5E85CC19
P 5200 6550
F 0 "#PWR07" H 5200 6300 50  0001 C CNN
F 1 "GND" H 5205 6377 50  0000 C CNN
F 2 "" H 5200 6550 50  0001 C CNN
F 3 "" H 5200 6550 50  0001 C CNN
	1    5200 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 6550 5200 6400
Wire Wire Line
	5200 6400 5100 6400
$Comp
L power:GNDPWR #PWR02
U 1 1 5E8C4689
P 1000 2250
F 0 "#PWR02" H 1000 2050 50  0001 C CNN
F 1 "GNDPWR" H 1004 2096 50  0000 C CNN
F 2 "" H 1000 2200 50  0001 C CNN
F 3 "" H 1000 2200 50  0001 C CNN
	1    1000 2250
	1    0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U7
U 1 1 5E8C7800
P 5950 6850
F 0 "U7" H 5950 7175 50  0000 C CNN
F 1 "PC817" H 5950 7084 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W8.89mm_SMDSocket_LongPads" H 5750 6650 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 5950 6850 50  0001 L CNN
	1    5950 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR010
U 1 1 5E8C9700
P 5600 7350
F 0 "#PWR010" H 5600 7150 50  0001 C CNN
F 1 "GNDPWR" H 5604 7196 50  0000 C CNN
F 2 "" H 5600 7300 50  0001 C CNN
F 3 "" H 5600 7300 50  0001 C CNN
	1    5600 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5E8CA8D8
P 6300 7100
F 0 "#PWR014" H 6300 6850 50  0001 C CNN
F 1 "GND" H 6305 6927 50  0000 C CNN
F 2 "" H 6300 7100 50  0001 C CNN
F 3 "" H 6300 7100 50  0001 C CNN
	1    6300 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5E8CB762
P 6300 6450
F 0 "R9" H 6370 6496 50  0000 L CNN
F 1 "10k" H 6370 6405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6230 6450 50  0001 C CNN
F 3 "~" H 6300 6450 50  0001 C CNN
	1    6300 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 6950 6300 6950
Wire Wire Line
	6300 6950 6300 7100
Wire Wire Line
	6300 6600 6300 6650
Wire Wire Line
	6300 6750 6250 6750
$Comp
L power:+3.3V #PWR013
U 1 1 5E9666E6
P 6300 6150
F 0 "#PWR013" H 6300 6000 50  0001 C CNN
F 1 "+3.3V" H 6315 6323 50  0000 C CNN
F 2 "" H 6300 6150 50  0001 C CNN
F 3 "" H 6300 6150 50  0001 C CNN
	1    6300 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 6150 6300 6300
Wire Wire Line
	6300 6650 6600 6650
Connection ~ 6300 6650
Wire Wire Line
	6300 6650 6300 6750
$Comp
L Device:R R4
U 1 1 5E9D0ECC
P 5600 5850
F 0 "R4" H 5670 5896 50  0000 L CNN
F 1 "1M" H 5670 5805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5530 5850 50  0001 C CNN
F 3 "~" H 5600 5850 50  0001 C CNN
	1    5600 5850
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D14
U 1 1 5E9D3DDB
P 5600 7150
F 0 "D14" V 5646 7071 50  0000 R CNN
F 1 "1N4007" V 5555 7071 50  0000 R CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5600 6975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5600 7150 50  0001 C CNN
	1    5600 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 5650 5600 5700
Wire Wire Line
	5600 6750 5650 6750
Wire Wire Line
	5650 6950 5600 6950
Wire Wire Line
	5600 6950 5600 7000
Wire Wire Line
	5600 7300 5600 7350
Wire Wire Line
	5600 6000 5600 6650
Wire Wire Line
	5100 6200 5200 6200
Wire Wire Line
	5200 6200 5200 5900
$Comp
L Device:R R3
U 1 1 5EBD3F52
P 5400 6850
F 0 "R3" H 5470 6896 50  0000 L CNN
F 1 "2.2k" H 5470 6805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5330 6850 50  0001 C CNN
F 3 "~" H 5400 6850 50  0001 C CNN
	1    5400 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6700 5400 6650
Wire Wire Line
	5400 6650 5600 6650
Connection ~ 5600 6650
Wire Wire Line
	5600 6650 5600 6750
Wire Wire Line
	5400 7000 5600 7000
Wire Wire Line
	600  1900 1000 1900
Wire Wire Line
	1000 2250 1000 1900
Connection ~ 1000 1900
Wire Wire Line
	1000 1900 1150 1900
Wire Wire Line
	2350 5950 2450 5950
Wire Wire Line
	750  7200 1450 7200
Wire Wire Line
	550  5100 1700 5100
Connection ~ 1700 5100
Wire Wire Line
	1700 5100 1700 4550
Wire Wire Line
	550  5100 550  6350
Wire Wire Line
	550  6350 550  6950
Connection ~ 550  6350
Wire Wire Line
	550  6350 850  6350
Wire Wire Line
	3450 5100 3450 4500
Wire Wire Line
	2250 850  2250 800 
Wire Wire Line
	2250 1500 2250 1450
Wire Wire Line
	3000 800  2550 800 
Wire Wire Line
	2550 800  2550 1150
Connection ~ 3000 800 
Wire Wire Line
	3000 1500 3000 1250
Wire Wire Line
	1950 1150 1950 1600
Wire Wire Line
	1950 1600 2750 1600
Wire Wire Line
	2750 1600 2750 1500
Wire Wire Line
	2750 1500 3000 1500
Wire Wire Line
	1850 6650 1750 6650
Wire Wire Line
	1750 6650 1750 6350
Wire Wire Line
	1750 800  2250 800 
Connection ~ 1750 800 
Wire Wire Line
	1750 1500 2250 1500
Connection ~ 1750 1500
$Comp
L Device:LED D22
U 1 1 5E3815CB
P 5550 4950
F 0 "D22" H 5550 4850 50  0000 C CNN
F 1 "LED" H 5543 5075 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 4950 50  0001 C CNN
F 3 "~" H 5550 4950 50  0001 C CNN
	1    5550 4950
	1    0    0    1   
$EndComp
$Comp
L Device:LED D21
U 1 1 5E37E6CF
P 5550 3750
F 0 "D21" H 5543 3966 50  0000 C CNN
F 1 "LED" H 5543 3875 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 3750 50  0001 C CNN
F 3 "~" H 5550 3750 50  0001 C CNN
	1    5550 3750
	1    0    0    1   
$EndComp
$Comp
L Device:LED D20
U 1 1 5E37B909
P 5550 3950
F 0 "D20" H 5543 4166 50  0000 C CNN
F 1 "LED" H 5543 4075 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 3950 50  0001 C CNN
F 3 "~" H 5550 3950 50  0001 C CNN
	1    5550 3950
	1    0    0    1   
$EndComp
$Comp
L Device:LED D19
U 1 1 5E378A1C
P 5550 4150
F 0 "D19" H 5543 4366 50  0000 C CNN
F 1 "LED" H 5543 4275 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 4150 50  0001 C CNN
F 3 "~" H 5550 4150 50  0001 C CNN
	1    5550 4150
	1    0    0    1   
$EndComp
$Comp
L Device:LED D18
U 1 1 5E375B7C
P 5550 4350
F 0 "D18" H 5543 4566 50  0000 C CNN
F 1 "LED" H 5543 4475 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 4350 50  0001 C CNN
F 3 "~" H 5550 4350 50  0001 C CNN
	1    5550 4350
	1    0    0    1   
$EndComp
$Comp
L Device:LED D17
U 1 1 5E372CBF
P 5550 4550
F 0 "D17" H 5543 4766 50  0000 C CNN
F 1 "LED" H 5543 4675 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 4550 50  0001 C CNN
F 3 "~" H 5550 4550 50  0001 C CNN
	1    5550 4550
	1    0    0    1   
$EndComp
$Comp
L Device:LED D16
U 1 1 5E36FD84
P 5550 4750
F 0 "D16" H 5550 4750 50  0000 C CNN
F 1 "LED" H 5543 4875 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5550 4750 50  0001 C CNN
F 3 "~" H 5550 4750 50  0001 C CNN
	1    5550 4750
	1    0    0    1   
$EndComp
Wire Wire Line
	3250 1500 3250 2750
$Comp
L Device:R R14
U 1 1 5E3F4B0F
P 5850 4550
F 0 "R14" V 5850 4550 50  0000 C CNN
F 1 "R" V 5966 4550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 4550 50  0001 C CNN
F 3 "~" H 5850 4550 50  0001 C CNN
	1    5850 4550
	0    -1   1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 5E4542E8
P 5850 3950
F 0 "R17" V 5850 3950 50  0000 C CNN
F 1 "R" V 5966 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 3950 50  0001 C CNN
F 3 "~" H 5850 3950 50  0001 C CNN
	1    5850 3950
	0    -1   1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5E4838C9
P 5850 4950
F 0 "R13" V 5850 4950 50  0000 C CNN
F 1 "R" V 5966 4950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 4950 50  0001 C CNN
F 3 "~" H 5850 4950 50  0001 C CNN
	1    5850 4950
	0    -1   1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5E3DCD8B
P 5850 4750
F 0 "R12" V 5850 4750 50  0000 C CNN
F 1 "R" V 5966 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 4750 50  0001 C CNN
F 3 "~" H 5850 4750 50  0001 C CNN
	1    5850 4750
	0    -1   1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 5E40C619
P 5850 4350
F 0 "R15" V 5850 4350 50  0000 C CNN
F 1 "R" V 5966 4350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 4350 50  0001 C CNN
F 3 "~" H 5850 4350 50  0001 C CNN
	1    5850 4350
	0    -1   1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5E43C87B
P 5850 4150
F 0 "R16" V 5850 4150 50  0000 C CNN
F 1 "R" V 5966 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 4150 50  0001 C CNN
F 3 "~" H 5850 4150 50  0001 C CNN
	1    5850 4150
	0    -1   1    0   
$EndComp
Wire Wire Line
	550  6950 1850 6950
Wire Wire Line
	1850 6650 1850 6950
Connection ~ 1850 6950
Wire Wire Line
	1850 6950 2600 6950
Wire Wire Line
	1700 5100 2500 5100
Wire Wire Line
	1550 5450 3200 5450
Wire Wire Line
	2500 4500 2500 5100
Connection ~ 2500 5100
Wire Wire Line
	2500 5100 3450 5100
Connection ~ 1400 3500
Wire Wire Line
	1400 3500 750  3500
Connection ~ 750  3500
Wire Wire Line
	1600 3600 1600 4150
Wire Wire Line
	1400 3500 2400 3500
Wire Wire Line
	2400 4150 2400 3500
Connection ~ 2400 3500
Wire Wire Line
	2400 3500 3250 3500
Wire Wire Line
	3250 4100 3250 3500
Connection ~ 3250 3500
Wire Wire Line
	750  3500 750  5250
Wire Wire Line
	2450 5950 2450 5250
Wire Wire Line
	3250 3500 4150 3500
Wire Wire Line
	1550 5450 1550 7450
Wire Wire Line
	1450 7200 1450 7450
Wire Wire Line
	2400 6450 2400 6700
Wire Wire Line
	2300 7450 2300 6700
Wire Wire Line
	1750 5200 1750 5950
Wire Wire Line
	4050 5500 3600 5500
Wire Wire Line
	1400 5650 1250 5650
$Comp
L Device:Fuse F1
U 1 1 5EF07739
P 550 1400
F 0 "F1" H 610 1446 50  0000 L CNN
F 1 "Fuse" H 610 1355 50  0000 L CNN
F 2 "Fuse:Fuse_Bourns_MF-RHT200" V 480 1400 50  0001 C CNN
F 3 "~" H 550 1400 50  0001 C CNN
	1    550  1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  1550 550  1600
Connection ~ 550  1600
Wire Wire Line
	550  1250 650  1250
Wire Wire Line
	650  1250 650  1150
Connection ~ 1150 1500
Wire Wire Line
	1150 1900 1150 1500
Connection ~ 1150 800 
Wire Wire Line
	650  800  1150 800 
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5E3565C9
P 800 1600
F 0 "J1" H 880 1592 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 880 1501 50  0000 L CNN
F 2 "Connector_Wago:Wago_734-132_1x02_P3.50mm_Vertical" H 800 1600 50  0001 C CNN
F 3 "~" H 800 1600 50  0001 C CNN
	1    800  1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1500 1150 1200
Wire Wire Line
	1250 1500 1150 1500
Wire Wire Line
	1250 1200 1250 1500
Wire Wire Line
	1250 800  1250 1000
Wire Wire Line
	1150 800  1150 1000
Wire Wire Line
	1250 800  1150 800 
$Comp
L Device:C_Small C1
U 1 1 5E294FF4
P 1150 1100
F 0 "C1" H 1242 1146 50  0000 L CNN
F 1 "C_Small" H 1242 1055 50  0000 L CNN
F 2 "Varistor:RV_Disc_D7mm_W3.5mm_P5mm" H 1150 1100 50  0001 C CNN
F 3 "~" H 1150 1100 50  0001 C CNN
	1    1150 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 616F20E5
P 10400 2400
F 0 "R11" H 10470 2446 50  0000 L CNN
F 1 "R" H 10470 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10330 2400 50  0001 C CNN
F 3 "~" H 10400 2400 50  0001 C CNN
	1    10400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2250 10050 2250
Wire Wire Line
	10400 2550 10400 2700
Wire Wire Line
	10400 2700 9400 2700
Connection ~ 9400 2700
Wire Wire Line
	9400 2700 9400 2800
Wire Wire Line
	3500 2750 4500 2750
$Comp
L Device:R_Network04_US RN1
U 1 1 61DCC1AC
P 8050 4150
F 0 "RN1" H 7800 4100 50  0000 L CNN
F 1 "R_Network04_US" H 7650 4350 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 8325 4150 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8050 4150 50  0001 C CNN
	1    8050 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5250 8700 5250
$Comp
L pspice:CAP C11
U 1 1 5EC1F078
P 9050 5650
F 0 "C11" V 9000 5650 50  0000 L CNN
F 1 "CAP" H 9050 5650 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 9050 5650 50  0001 C CNN
F 3 "~" H 9050 5650 50  0001 C CNN
	1    9050 5650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10650 1050 10400 1050
Wire Wire Line
	10650 1150 10150 1150
Wire Wire Line
	10150 1150 10150 1450
Wire Wire Line
	10650 1250 10200 1250
Wire Wire Line
	10200 1250 10200 1650
Wire Wire Line
	10200 1650 10000 1650
Wire Wire Line
	10000 1350 10250 1350
Wire Wire Line
	10400 550  10400 1050
Wire Wire Line
	9400 1050 10350 1050
Wire Wire Line
	10350 1050 10350 1350
Wire Wire Line
	10250 1350 10250 1450
Wire Wire Line
	10000 1850 10100 1850
Wire Wire Line
	10000 1750 10200 1750
Wire Wire Line
	10200 1750 10200 3400
$Comp
L MCU_ST_STM8:STM8S003F3P U9
U 1 1 5E34D929
P 9400 4650
F 0 "U9" H 9700 5400 50  0000 C CNN
F 1 "STM8S003F3P" H 9700 5550 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 9450 5750 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00024550.pdf" H 9350 4250 50  0001 C CNN
	1    9400 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3650 9400 3600
Wire Wire Line
	8700 5250 8700 5900
$Comp
L Switch:SW_Push SW3
U 1 1 5F1D1E47
P 7150 5700
F 0 "SW3" H 7150 5985 50  0000 C CNN
F 1 "SW_Push" H 7150 5894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 7150 5900 50  0001 C CNN
F 3 "~" H 7150 5900 50  0001 C CNN
	1    7150 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5300 6450 5700
Wire Wire Line
	6950 5300 6950 5700
Wire Wire Line
	6850 5300 6850 5450
Wire Wire Line
	6850 5450 7350 5450
Wire Wire Line
	8400 5450 8400 5300
Wire Wire Line
	6850 5700 6850 5900
Wire Wire Line
	6850 5900 7350 5900
Wire Wire Line
	8400 5900 8400 5700
Wire Wire Line
	7350 5700 7350 5900
Connection ~ 7350 5900
Wire Wire Line
	7350 5900 7900 5900
Wire Wire Line
	7900 5700 7900 5900
Connection ~ 7900 5900
Wire Wire Line
	7900 5900 8400 5900
Wire Wire Line
	7900 5300 7900 5450
Connection ~ 7900 5450
Wire Wire Line
	7900 5450 8400 5450
Wire Wire Line
	7350 5300 7350 5450
Connection ~ 7350 5450
Wire Wire Line
	7350 5450 7900 5450
Wire Wire Line
	8450 5450 8400 5450
Connection ~ 8400 5450
Connection ~ 8400 5900
Wire Wire Line
	10000 4450 10550 4450
Wire Wire Line
	10500 5800 10500 4550
Wire Wire Line
	10500 4550 10000 4550
Wire Wire Line
	7500 5300 7500 5700
$Comp
L Device:R R22
U 1 1 5E4B79A2
P 8850 5900
F 0 "R22" V 8850 5800 50  0000 L CNN
F 1 "R" V 8750 5850 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8780 5900 50  0001 C CNN
F 3 "~" H 8850 5900 50  0001 C CNN
	1    8850 5900
	0    -1   -1   0   
$EndComp
Connection ~ 8700 5900
Wire Wire Line
	8700 5900 8700 6050
Wire Wire Line
	8700 6050 10650 6050
Wire Wire Line
	8050 4450 8050 4350
Wire Wire Line
	7850 4350 7850 4750
$Comp
L power:LINE #PWR0101
U 1 1 6256762B
P 6600 6450
F 0 "#PWR0101" H 6600 6300 50  0001 C CNN
F 1 "LINE" H 6615 6623 50  0000 C CNN
F 2 "" H 6600 6450 50  0001 C CNN
F 3 "" H 6600 6450 50  0001 C CNN
	1    6600 6450
	1    0    0    -1  
$EndComp
$Comp
L power:LINE #PWR0102
U 1 1 62568A02
P 8750 3850
F 0 "#PWR0102" H 8750 3700 50  0001 C CNN
F 1 "LINE" H 8765 4023 50  0000 C CNN
F 2 "" H 8750 3850 50  0001 C CNN
F 3 "" H 8750 3850 50  0001 C CNN
	1    8750 3850
	1    0    0    -1  
$EndComp
$Comp
L power:Vdrive #PWR0103
U 1 1 6258FAAB
P 5200 5900
F 0 "#PWR0103" H 5000 5750 50  0001 C CNN
F 1 "Vdrive" H 5215 6073 50  0000 C CNN
F 2 "" H 5200 5900 50  0001 C CNN
F 3 "" H 5200 5900 50  0001 C CNN
	1    5200 5900
	-1   0    0    -1  
$EndComp
$Comp
L power:Vdrive #PWR0104
U 1 1 6259139C
P 8600 4000
F 0 "#PWR0104" H 8400 3850 50  0001 C CNN
F 1 "Vdrive" H 8615 4173 50  0000 C CNN
F 2 "" H 8600 4000 50  0001 C CNN
F 3 "" H 8600 4000 50  0001 C CNN
	1    8600 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3300 10250 3300
Wire Wire Line
	8300 3350 10100 3350
Wire Wire Line
	8350 3400 10200 3400
Wire Wire Line
	8250 4650 8800 4650
Wire Wire Line
	8750 3850 8750 3950
Wire Wire Line
	8750 3950 8800 3950
Wire Wire Line
	8600 4000 8600 4050
Wire Wire Line
	8600 4050 8800 4050
Wire Wire Line
	6500 2650 6500 2800
Wire Wire Line
	6500 2800 6550 2800
Wire Wire Line
	8800 2150 7550 2150
Wire Wire Line
	7550 2150 7550 3000
Wire Wire Line
	7550 3000 7350 3000
Wire Wire Line
	8800 2050 7600 2050
Wire Wire Line
	7600 2050 7600 3100
Wire Wire Line
	7600 3100 7350 3100
Wire Wire Line
	8800 2250 7650 2250
Wire Wire Line
	7650 2250 7650 3200
Wire Wire Line
	7650 3200 7350 3200
Wire Wire Line
	8800 2350 7700 2350
Wire Wire Line
	7700 2350 7700 3300
Wire Wire Line
	7700 3300 7350 3300
Wire Wire Line
	8800 2450 7750 2450
Wire Wire Line
	7750 2450 7750 3400
Wire Wire Line
	7750 3400 7350 3400
Wire Wire Line
	10050 2250 10050 2600
Wire Wire Line
	10050 2600 7800 2600
Wire Wire Line
	7800 2600 7800 3500
Wire Wire Line
	7800 3500 7350 3500
Connection ~ 10050 2250
Wire Wire Line
	10050 2250 10400 2250
Wire Wire Line
	10100 3350 10100 1850
Wire Wire Line
	10000 1550 10150 1550
Wire Wire Line
	10150 3100 7850 3100
Wire Wire Line
	7850 3100 7850 3600
Wire Wire Line
	7850 3600 7350 3600
Wire Wire Line
	10150 1550 10150 3100
Wire Wire Line
	6550 3000 5400 3000
Wire Wire Line
	2150 3000 2150 3400
Wire Wire Line
	2150 3400 800  3400
Wire Wire Line
	2250 3100 4400 3100
Wire Wire Line
	2500 3200 2500 4100
Wire Wire Line
	6550 3300 5200 3300
$Comp
L power:+5V #PWR0105
U 1 1 62B20B18
P 6500 2650
F 0 "#PWR0105" H 6500 2500 50  0001 C CNN
F 1 "+5V" H 6515 2823 50  0000 C CNN
F 2 "" H 6500 2650 50  0001 C CNN
F 3 "" H 6500 2650 50  0001 C CNN
	1    6500 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 62B5BEDC
P 6300 3800
F 0 "#PWR0106" H 6300 3650 50  0001 C CNN
F 1 "+5V" H 6315 3973 50  0000 C CNN
F 2 "" H 6300 3800 50  0001 C CNN
F 3 "" H 6300 3800 50  0001 C CNN
	1    6300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 4450 8800 4450
Wire Wire Line
	8300 4350 8800 4350
Wire Wire Line
	6550 3200 5250 3200
Wire Wire Line
	6550 3500 5100 3500
Wire Wire Line
	6550 3600 5050 3600
Wire Wire Line
	6550 3400 5150 3400
$Comp
L power:GND #PWR0107
U 1 1 62849060
P 6950 3800
F 0 "#PWR0107" H 6950 3550 50  0001 C CNN
F 1 "GND" H 6955 3627 50  0000 C CNN
F 2 "" H 6950 3800 50  0001 C CNN
F 3 "" H 6950 3800 50  0001 C CNN
	1    6950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3350 8300 4350
Wire Wire Line
	8350 3400 8350 4250
Wire Wire Line
	7850 3800 7850 3950
$Comp
L power:+3.3V #PWR0108
U 1 1 6202C6C5
P 7850 3800
F 0 "#PWR0108" H 7850 3650 50  0001 C CNN
F 1 "+3.3V" H 7865 3973 50  0000 C CNN
F 2 "" H 7850 3800 50  0001 C CNN
F 3 "" H 7850 3800 50  0001 C CNN
	1    7850 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3300 8250 4650
$Comp
L Transistor_Array:ULN2003 U4
U 1 1 5E350A7F
P 6950 3200
F 0 "U4" H 6950 3767 50  0000 C CNN
F 1 "ULN2801A" H 6950 3676 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 7000 2550 50  0001 L CNN
F 3 "http://www.promelec.ru/pdf/1536.pdf" H 7050 3000 50  0001 C CNN
	1    6950 3200
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5E46BE4C
P 5850 3750
F 0 "R18" V 5850 3750 50  0000 C CNN
F 1 "R" V 5966 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 3750 50  0001 C CNN
F 3 "~" H 5850 3750 50  0001 C CNN
	1    5850 3750
	0    -1   1    0   
$EndComp
Wire Wire Line
	6000 3750 6000 3950
Connection ~ 6000 3950
Wire Wire Line
	6000 3950 6000 4150
Connection ~ 6000 4150
Wire Wire Line
	6000 4150 6000 4350
Connection ~ 6000 4350
Wire Wire Line
	6000 4350 6000 4550
Connection ~ 6000 4550
Wire Wire Line
	6000 4550 6000 4750
Connection ~ 6000 4750
Wire Wire Line
	6000 4750 6000 4950
Wire Wire Line
	6300 3800 6300 3950
Wire Wire Line
	6300 3950 6000 3950
Wire Wire Line
	5400 3000 5400 3750
Wire Wire Line
	5400 3950 5300 3950
Wire Wire Line
	5300 3950 5300 3100
Wire Wire Line
	5300 3100 6550 3100
Wire Wire Line
	5250 3200 5250 4150
Wire Wire Line
	5250 4150 5400 4150
Connection ~ 5250 3200
Wire Wire Line
	5250 3200 2500 3200
Wire Wire Line
	5400 4350 5200 4350
Wire Wire Line
	5200 4350 5200 3300
Wire Wire Line
	5150 3400 5150 4550
Wire Wire Line
	5150 4550 5400 4550
Wire Wire Line
	5400 4750 5100 4750
Wire Wire Line
	5100 4750 5100 3500
Wire Wire Line
	5050 3600 5050 4950
Wire Wire Line
	5050 4950 5400 4950
Connection ~ 5050 3600
Wire Wire Line
	6600 6450 6600 6650
Wire Wire Line
	3500 5650 3750 5650
Wire Wire Line
	3750 6450 3750 7200
Wire Wire Line
	3750 5650 3750 6100
Connection ~ 3750 5650
Wire Wire Line
	3750 5650 5600 5650
Wire Wire Line
	9300 5650 9400 5650
Connection ~ 9400 5650
Wire Wire Line
	8800 5650 8800 5350
Wire Wire Line
	8500 1550 8800 1550
Wire Wire Line
	8500 1250 8500 1050
Connection ~ 8500 1050
Wire Wire Line
	8500 1050 9400 1050
Wire Wire Line
	9400 5650 9400 5850
$Comp
L power:+3.3V #PWR0110
U 1 1 634F1200
P 9200 5950
F 0 "#PWR0110" H 9200 5800 50  0001 C CNN
F 1 "+3.3V" H 9350 6000 50  0000 C CNN
F 2 "" H 9200 5950 50  0001 C CNN
F 3 "" H 9200 5950 50  0001 C CNN
	1    9200 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5950 9000 5950
Wire Wire Line
	9000 5950 9000 5900
Wire Wire Line
	6450 5700 6450 5800
Wire Wire Line
	6450 5800 10500 5800
Connection ~ 6450 5700
Wire Wire Line
	6950 5700 6950 5750
Wire Wire Line
	6950 5750 10550 5750
Connection ~ 6950 5700
Wire Wire Line
	10550 4450 10550 5750
Wire Wire Line
	8000 5300 8000 5700
Wire Wire Line
	8800 5050 7500 5050
Wire Wire Line
	7500 5050 7500 5300
Connection ~ 7500 5300
Wire Wire Line
	8800 4950 8000 4950
Wire Wire Line
	8000 4950 8000 5300
Connection ~ 8000 5300
Wire Wire Line
	8500 5900 8400 5900
$Comp
L Device:LED D23
U 1 1 5E36EFAD
P 10400 3950
F 0 "D23" H 10393 4166 50  0000 C CNN
F 1 "LED" H 10393 4075 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10400 3950 50  0001 C CNN
F 3 "~" H 10400 3950 50  0001 C CNN
	1    10400 3950
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 63228731
P 10400 3300
F 0 "#PWR0109" H 10400 3150 50  0001 C CNN
F 1 "+3.3V" H 10415 3473 50  0000 C CNN
F 2 "" H 10400 3300 50  0001 C CNN
F 3 "" H 10400 3300 50  0001 C CNN
	1    10400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 3300 10400 3500
Wire Wire Line
	10400 4100 10400 4350
Wire Wire Line
	10000 4350 10400 4350
Wire Wire Line
	10400 4350 10550 4350
Connection ~ 10400 4350
$Comp
L Device:R R21
U 1 1 6331B223
P 10400 3650
F 0 "R21" V 10400 3650 50  0000 C CNN
F 1 "R" V 10516 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10330 3650 50  0001 C CNN
F 3 "~" H 10400 3650 50  0001 C CNN
	1    10400 3650
	-1   0    0    -1  
$EndComp
Connection ~ 8450 4850
Wire Wire Line
	8450 4850 8450 5450
Wire Wire Line
	8450 4850 7950 4850
Wire Wire Line
	7950 4350 7950 4850
Wire Wire Line
	8450 4850 8800 4850
Wire Wire Line
	8800 4750 8500 4750
Wire Wire Line
	8500 5900 8500 4750
Connection ~ 8500 4750
Wire Wire Line
	8500 4750 7850 4750
Wire Wire Line
	8350 4250 8150 4250
Wire Wire Line
	8150 4250 8150 4350
Connection ~ 8350 4250
Wire Wire Line
	8350 4250 8350 4450
Wire Wire Line
	8300 4350 8300 4450
Wire Wire Line
	8300 4450 8050 4450
Connection ~ 8300 4350
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 63A5AC67
P 11000 2200
F 0 "J4" H 10972 2174 50  0000 R CNN
F 1 "Conn_01x04_Male" H 10972 2083 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 11000 2200 50  0001 C CNN
F 3 "~" H 11000 2200 50  0001 C CNN
	1    11000 2200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10700 1700 10550 1700
Connection ~ 10550 1700
Wire Wire Line
	10550 1700 10550 1750
$Comp
L power:+3.3V #PWR0111
U 1 1 63AE3159
P 10750 1900
F 0 "#PWR0111" H 10750 1750 50  0001 C CNN
F 1 "+3.3V" H 10900 1950 50  0000 C CNN
F 2 "" H 10750 1900 50  0001 C CNN
F 3 "" H 10750 1900 50  0001 C CNN
	1    10750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 2100 10550 2100
Wire Wire Line
	10550 2100 10550 4350
Wire Wire Line
	10800 2400 10650 2400
Wire Wire Line
	10700 2300 10800 2300
Wire Wire Line
	10700 1700 10700 2300
Wire Wire Line
	10750 1900 10750 2200
Wire Wire Line
	10750 2200 10800 2200
Wire Wire Line
	10350 1350 10650 1350
Wire Wire Line
	10650 1450 10250 1450
Connection ~ 10250 1450
Wire Wire Line
	10250 1450 10250 3300
$Comp
L Connector:Screw_Terminal_01x04 J5
U 1 1 63D6CD97
P 2400 7650
F 0 "J5" V 2272 7830 50  0000 L CNN
F 1 "Screw_Terminal_01x04" V 2363 7830 50  0000 L CNN
F 2 "Connector_Wago:Wago_734-134_1x04_P3.50mm_Vertical" H 2400 7650 50  0001 C CNN
F 3 "~" H 2400 7650 50  0001 C CNN
	1    2400 7650
	0    1    1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J2
U 1 1 63D6EA27
P 1550 7650
F 0 "J2" V 1422 7830 50  0000 L CNN
F 1 "Screw_Terminal_01x04" V 1513 7830 50  0000 L CNN
F 2 "Connector_Wago:Wago_734-134_1x04_P3.50mm_Vertical" H 1550 7650 50  0001 C CNN
F 3 "~" H 1550 7650 50  0001 C CNN
	1    1550 7650
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 7300 3600 5500
Wire Wire Line
	1250 5650 1250 7450
Wire Wire Line
	1250 7450 1350 7450
Wire Wire Line
	1650 7450 1650 7300
Wire Wire Line
	2200 7450 2200 6700
Wire Wire Line
	2200 6700 1450 6700
Wire Wire Line
	2300 6700 2400 6700
Wire Wire Line
	3350 6450 3350 7100
Wire Wire Line
	3350 7100 2400 7100
Wire Wire Line
	2400 7100 2400 7450
Wire Wire Line
	2500 7450 2500 7200
Wire Wire Line
	2500 7200 3750 7200
Wire Wire Line
	3600 7300 1650 7300
Wire Wire Line
	2400 4150 2300 4150
Wire Wire Line
	1400 3500 1400 4150
Wire Wire Line
	4150 3500 4150 4100
Wire Wire Line
	2250 3100 2250 3600
Wire Wire Line
	1450 6350 1450 6700
Wire Wire Line
	1400 4550 1400 5650
Wire Wire Line
	4050 4500 4050 5500
Wire Wire Line
	3200 6350 3200 6450
Wire Wire Line
	2350 6350 2350 6450
Wire Wire Line
	2450 5250 2500 5250
Wire Wire Line
	2300 5400 750  5400
Wire Wire Line
	3200 4500 3200 5450
$Comp
L Relay:SANYOU_SRD_Form_A K1
U 1 1 644E70C2
P 1100 4350
F 0 "K1" V 533 4350 50  0000 C CNN
F 1 "SANYOU_SRD_Form_A" V 624 4350 50  0000 C CNN
F 2 "Relay_THT:Relay_SPST_SANYOU_SRD_Series_Form_A" H 1450 4300 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 1100 4350 50  0001 C CNN
	1    1100 4350
	0    1    1    0   
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_A K2
U 1 1 644EE5AF
P 1150 6150
F 0 "K2" V 583 6150 50  0000 C CNN
F 1 "SANYOU_SRD_Form_A" V 674 6150 50  0000 C CNN
F 2 "Relay_THT:Relay_SPST_SANYOU_SRD_Series_Form_A" H 1500 6100 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 1150 6150 50  0001 C CNN
	1    1150 6150
	0    1    1    0   
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_A K3
U 1 1 644FC2E0
P 2000 4350
F 0 "K3" V 1433 4350 50  0000 C CNN
F 1 "SANYOU_SRD_Form_A" V 1524 4350 50  0000 C CNN
F 2 "Relay_THT:Relay_SPST_SANYOU_SRD_Series_Form_A" H 2350 4300 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 2000 4350 50  0001 C CNN
	1    2000 4350
	0    1    1    0   
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_A K4
U 1 1 644FCE63
P 2050 6150
F 0 "K4" V 1483 6150 50  0000 C CNN
F 1 "SANYOU_SRD_Form_A" V 1574 6150 50  0000 C CNN
F 2 "Relay_THT:Relay_SPST_SANYOU_SRD_Series_Form_A" H 2400 6100 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 2050 6150 50  0001 C CNN
	1    2050 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 4100 2500 4100
Wire Wire Line
	2600 4500 2500 4500
$Comp
L Relay:SANYOU_SRD_Form_A K5
U 1 1 644FEA84
P 2900 4300
F 0 "K5" V 2333 4300 50  0000 C CNN
F 1 "SANYOU_SRD_Form_A" V 2424 4300 50  0000 C CNN
F 2 "Relay_THT:Relay_SPST_SANYOU_SRD_Series_Form_A" H 3250 4250 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 2900 4300 50  0001 C CNN
	1    2900 4300
	0    1    1    0   
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_A K7
U 1 1 644FF62C
P 3750 4300
F 0 "K7" V 3183 4300 50  0000 C CNN
F 1 "SANYOU_SRD_Form_A" V 3274 4300 50  0000 C CNN
F 2 "Relay_THT:Relay_SPST_SANYOU_SRD_Series_Form_A" H 4100 4250 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 3750 4300 50  0001 C CNN
	1    3750 4300
	0    1    1    0   
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_A K6
U 1 1 64500196
P 2900 6150
F 0 "K6" V 2333 6150 50  0000 C CNN
F 1 "SANYOU_SRD_Form_A" V 2424 6150 50  0000 C CNN
F 2 "Relay_THT:Relay_SPST_SANYOU_SRD_Series_Form_A" H 3250 6100 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 2900 6150 50  0001 C CNN
	1    2900 6150
	0    1    1    0   
$EndComp
Connection ~ 5600 7000
$Comp
L Device:L_Core_Ferrite_Coupled L1
U 1 1 5E2B7C2B
P 1450 1100
F 0 "L1" H 1450 1381 50  0000 C CNN
F 1 "L_Core_Ferrite_Coupled" H 1450 1290 50  0000 C CNN
F 2 "Transformer_THT:Transformer_Toroid_Horizontal_D9.0mm_Amidon-T30" H 1450 1100 50  0001 C CNN
F 3 "~" H 1450 1100 50  0001 C CNN
	1    1450 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 5150 1450 5950
Wire Wire Line
	1450 5150 4400 5150
Connection ~ 2450 5250
Wire Wire Line
	2300 4550 2300 5400
Wire Wire Line
	1750 5200 4500 5200
Wire Wire Line
	750  5250 850  5250
Wire Wire Line
	850  5250 850  5950
Connection ~ 850  5250
Wire Wire Line
	850  5250 2450 5250
Wire Wire Line
	3250 5950 3250 5550
Wire Wire Line
	3250 5550 4600 5550
Wire Wire Line
	2500 5250 2500 5950
Wire Wire Line
	800  3400 800  4150
Wire Wire Line
	1600 3600 2250 3600
Wire Wire Line
	4250 3600 4250 3000
Wire Wire Line
	2150 3000 4250 3000
Wire Wire Line
	4250 3600 5050 3600
Connection ~ 5400 3000
Wire Wire Line
	4400 3100 4400 3000
Wire Wire Line
	4400 3000 5400 3000
Wire Wire Line
	5300 3100 4600 3100
Wire Wire Line
	4600 3100 4600 5550
Connection ~ 5300 3100
Wire Wire Line
	5200 3300 4500 3300
Wire Wire Line
	4500 3300 4500 5200
Connection ~ 5200 3300
Wire Wire Line
	5100 3500 4400 3500
Connection ~ 5100 3500
Wire Wire Line
	4400 3500 4400 5150
Wire Wire Line
	5150 3400 3350 3400
Connection ~ 5150 3400
Wire Wire Line
	3350 3400 3350 4100
$Comp
L Diode_Bridge:DF04M D1
U 1 1 64B5C654
P 2250 1150
F 0 "D1" H 2594 1196 50  0000 L CNN
F 1 "DF04M" H 2594 1105 50  0000 L CNN
F 2 "Diode_SMD:Diode_Bridge_Vishay_DFS" H 2400 1275 50  0001 L CNN
F 3 "http://www.vishay.com/docs/88571/dfm.pdf" H 2250 1150 50  0001 C CNN
	1    2250 1150
	1    0    0    1   
$EndComp
Connection ~ 6950 700 
Connection ~ 6450 700 
$Comp
L Device:CP1 C6
U 1 1 5E301E01
P 3550 1300
F 0 "C6" H 3665 1346 50  0000 L CNN
F 1 "16uf" H 3665 1255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 3550 1300 50  0001 C CNN
F 3 "~" H 3550 1300 50  0001 C CNN
	1    3550 1300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
