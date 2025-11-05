## Clock signal
##Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN Y9 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
##Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN F22 [get_ports {switches[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[0]}]
##Bank = 34, Pin name = IO_25_34,							Sch name = SW1
set_property PACKAGE_PIN G22 [get_ports {switches[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[1]}]
##Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = SW2
set_property PACKAGE_PIN H22 [get_ports {switches[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[2]}]
##Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = SW3
set_property PACKAGE_PIN F21 [get_ports {switches[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[3]}]
##Bank = 34, Pin name = IO_L19N_T3_VREF_34,					Sch name = SW4
set_property PACKAGE_PIN H19 [get_ports {switches[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[4]}]
##Bank = 34, Pin name = IO_L20P_T3_34,						Sch name = SW5
set_property PACKAGE_PIN H18 [get_ports {switches[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[5]}]
##Bank = 34, Pin name = IO_L20N_T3_34,						Sch name = SW6
set_property PACKAGE_PIN H17 [get_ports {switches[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[6]}]
##Bank = 34, Pin name = IO_L10P_T1_34,						Sch name = SW7
set_property PACKAGE_PIN M15 [get_ports {switches[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switches[7]}]
## LEDs
##Bank = 34, Pin name = IO_L24N_T3_34,						Sch name = LED0
set_property PACKAGE_PIN T22 [get_ports {leds[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]
##Bank = 34, Pin name = IO_L21N_T3_DQS_34,					Sch name = LED1
set_property PACKAGE_PIN T21 [get_ports {leds[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]
##Bank = 34, Pin name = IO_L24P_T3_34,						Sch name = LED2
set_property PACKAGE_PIN U22 [get_ports {leds[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[2]}]
##Bank = 34, Pin name = IO_L23N_T3_34,						Sch name = LED3
set_property PACKAGE_PIN U21 [get_ports {leds[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[3]}]
##Bank = 34, Pin name = IO_L12P_T1_MRCC_34,					Sch name = LED4
set_property PACKAGE_PIN V22 [get_ports {leds[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[4]}]
##Bank = 34, Pin name = IO_L12N_T1_MRCC_34,					Sch	name = LED5
set_property PACKAGE_PIN W22 [get_ports {leds[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[5]}]
##Bank = 34, Pin name = IO_L22P_T3_34,						Sch name = LED6
set_property PACKAGE_PIN U19 [get_ports {leds[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[6]}]
##Bank = 34, Pin name = IO_L22N_T3_34,						Sch name = LED7
set_property PACKAGE_PIN U14 [get_ports {leds[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {leds[7]}]

set_property PACKAGE_PIN N15 [get_ports {buttons[0]}]; # left
	set_property IOSTANDARD LVCMOS33 [get_ports {buttons[0]}]
set_property PACKAGE_PIN R18 [get_ports {buttons[1]}]; # right
	set_property IOSTANDARD LVCMOS33 [get_ports {buttons[1]}]
set_property PACKAGE_PIN T18 [get_ports {buttons[2]}]; # up
	set_property IOSTANDARD LVCMOS33 [get_ports {buttons[2]}]
set_property PACKAGE_PIN R16 [get_ports {buttons[3]}]; # down
	set_property IOSTANDARD LVCMOS33 [get_ports {buttons[3]}]
set_property PACKAGE_PIN P16 [get_ports {buttons[4]}]; # center
	set_property IOSTANDARD LVCMOS33 [get_ports {buttons[4]}]
