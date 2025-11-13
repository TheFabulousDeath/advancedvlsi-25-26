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
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports {switches[8]}];
set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS33 } [get_ports {switches[9]}];
set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {switches[10]}];
set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS33 } [get_ports {switches[11]}];
set_property -dict { PACKAGE_PIN T1   IOSTANDARD LVCMOS33 } [get_ports {switches[12]}];
set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS33 } [get_ports {switches[13]}];
set_property -dict { PACKAGE_PIN P3   IOSTANDARD LVCMOS33 } [get_ports {switches[14]}];
set_property -dict { PACKAGE_PIN P4   IOSTANDARD LVCMOS33 } [get_ports {switches[15]}];

## Buttons
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { buttons[0] }]; # left
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { buttons[1] }]; # right
set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { buttons[2] }]; # up 
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { buttons[3] }]; # down
set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { buttons[4] }]; # center

## Seven Segments
set_property -dict { PACKAGE_PIN L3   IOSTANDARD LVCMOS33 } [get_ports { cathodes[7] }]; #IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS33 } [get_ports { cathodes[6] }]; #IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN L5   IOSTANDARD LVCMOS33 } [get_ports { cathodes[5] }]; #IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN L4   IOSTANDARD LVCMOS33 } [get_ports { cathodes[4] }]; #IO_L17P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN K3   IOSTANDARD LVCMOS33 } [get_ports { cathodes[3] }]; #IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN M2   IOSTANDARD LVCMOS33 } [get_ports { cathodes[2] }]; #IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L6   IOSTANDARD LVCMOS33 } [get_ports { cathodes[1] }]; #IO_L4P_T0_D04_14 Sch=cg
set_property -dict { PACKAGE_PIN M4   IOSTANDARD LVCMOS33 } [get_ports { cathodes[0] }]; #IO_L19N_T3_A21_VREF_15 Sch=dp
set_property -dict { PACKAGE_PIN N6   IOSTANDARD LVCMOS33 } [get_ports { annodes[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN M6   IOSTANDARD LVCMOS33 } [get_ports { annodes[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN M3   IOSTANDARD LVCMOS33 } [get_ports { annodes[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN N5   IOSTANDARD LVCMOS33 } [get_ports { annodes[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS33 } [get_ports { annodes[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
set_property -dict { PACKAGE_PIN N4   IOSTANDARD LVCMOS33 } [get_ports { annodes[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
set_property -dict { PACKAGE_PIN L1   IOSTANDARD LVCMOS33 } [get_ports { annodes[6] }]; #IO_L23P_T3_35 Sch=an[6]
set_property -dict { PACKAGE_PIN M1   IOSTANDARD LVCMOS33 } [get_ports { annodes[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]
