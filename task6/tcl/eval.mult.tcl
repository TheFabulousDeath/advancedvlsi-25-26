read_vhdl ../vhdl/alu.vhd
read_vhdl ../vhdl/alu_controller.vhd
read_vhdl ../vhdl/control.vhd
read_vhdl ../vhdl/immediate_generator.vhd
read_vhdl ../vhdl/isa_riscv.vhd
read_vhdl ../vhdl/memory.vhd
read_vhdl ../vhdl/misc.vhd
read_vhdl ../vhdl/program_counter.vhd
read_vhdl ../vhdl/register_file.vhd
read_vhdl ../vhdl/rsa_unit.vhd
read_vhdl ../vhdl/single_cycle_cpu.vhd


synth_design -rtl -rtl_skip_mlo -top sccpu -mode out_of_context
start_gui
show_schematic [get_nets -hierarchical]
write_schematic -force -format pdf -orientation portrait ../schematics/sccpu.rtl.pdf
stop_gui

#synth_design -top mult_buffer
#create_clock -period 4.0 -name clk [get_ports clk]
#opt_design
#place_design
#route_design

#write_verilog -force ../netlists/mult.v

#report_timing -setup -hold -nworst 5 -file reports/mult.timing.rpt
#report_utilization -file reports/mult.util.rpt

#start_gui
#show_schematic [get_nets -hierarchical]
#write_schematic -force -format pdf -orientation portrait schematics/mult.pimp.pdf

exit
