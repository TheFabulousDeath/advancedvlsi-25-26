## Clock signal
set_property PACKAGE_PIN E3 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports {switches[0]}];
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports {switches[1]}];
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports {switches[2]}];
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports {switches[3]}];
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports {switches[4]}];
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports {switches[5]}];
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports {switches[6]}];
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports {switches[7]}];

## LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports {leds[0]}];
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports {leds[1]}];
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports {leds[2]}];
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports {leds[3]}];
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports {leds[4]}];
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {leds[5]}];
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports {leds[6]}];
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports {leds[7]}];

## Buttons
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { buttons[0] }]; # left
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { buttons[1] }]; # right
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { buttons[2] }]; # up 
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { buttons[3] }]; # down
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { buttons[4] }]; # center
