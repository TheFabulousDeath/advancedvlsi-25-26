## Clock signal
set_property PACKAGE_PIN E3 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property -dict { PACKAGE_PIN U9   IOSTANDARD LVCMOS33 } [get_ports {switches[0]}];
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports {switches[1]}];
set_property -dict { PACKAGE_PIN R7   IOSTANDARD LVCMOS33 } [get_ports {switches[2]}];
set_property -dict { PACKAGE_PIN R6   IOSTANDARD LVCMOS33 } [get_ports {switches[3]}];
set_property -dict { PACKAGE_PIN R5   IOSTANDARD LVCMOS33 } [get_ports {switches[4]}];
set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports {switches[5]}];
set_property -dict { PACKAGE_PIN V6   IOSTANDARD LVCMOS33 } [get_ports {switches[6]}];
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports {switches[7]}];

## LEDs
set_property -dict { PACKAGE_PIN T8   IOSTANDARD LVCMOS33 } [get_ports {leds[0]}];
set_property -dict { PACKAGE_PIN V9   IOSTANDARD LVCMOS33 } [get_ports {leds[1]}];
set_property -dict { PACKAGE_PIN R8   IOSTANDARD LVCMOS33 } [get_ports {leds[2]}];
set_property -dict { PACKAGE_PIN T6   IOSTANDARD LVCMOS33 } [get_ports {leds[3]}];
set_property -dict { PACKAGE_PIN T5   IOSTANDARD LVCMOS33 } [get_ports {leds[4]}];
set_property -dict { PACKAGE_PIN T4   IOSTANDARD LVCMOS33 } [get_ports {leds[5]}];
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports {leds[6]}];
set_property -dict { PACKAGE_PIN U6   IOSTANDARD LVCMOS33 } [get_ports {leds[7]}];

## Buttons
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { buttons[0] }]; # left
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { buttons[1] }]; # right
set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { buttons[2] }]; # up 
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { buttons[3] }]; # down
set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { buttons[4] }]; # center
