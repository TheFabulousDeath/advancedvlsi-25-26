## Clock signal
set_property PACKAGE_PIN Y9 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property -dict { PACKAGE_PIN F22   IOSTANDARD LVCMOS33 } [get_ports {switches[0]}];
set_property -dict { PACKAGE_PIN G22   IOSTANDARD LVCMOS33 } [get_ports {switches[1]}];
set_property -dict { PACKAGE_PIN H22   IOSTANDARD LVCMOS33 } [get_ports {switches[2]}];
set_property -dict { PACKAGE_PIN F21   IOSTANDARD LVCMOS33 } [get_ports {switches[3]}];
set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports {switches[4]}];
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports {switches[5]}];
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports {switches[6]}];
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports {switches[7]}];

## LEDs
set_property -dict { PACKAGE_PIN T22   IOSTANDARD LVCMOS33 } [get_ports {leds[0]}];
set_property -dict { PACKAGE_PIN T21   IOSTANDARD LVCMOS33 } [get_ports {leds[1]}];
set_property -dict { PACKAGE_PIN U22   IOSTANDARD LVCMOS33 } [get_ports {leds[2]}];
set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS33 } [get_ports {leds[3]}];
set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS33 } [get_ports {leds[4]}];
set_property -dict { PACKAGE_PIN W22   IOSTANDARD LVCMOS33 } [get_ports {leds[5]}];
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports {leds[6]}];
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports {leds[7]}];

## Buttons
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { rst }];
