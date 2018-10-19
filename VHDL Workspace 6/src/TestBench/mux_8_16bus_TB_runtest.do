SetActiveLib -work
comp -include "$dsn\src\MUX_8-1_16Bus.vhd" 
comp -include "$dsn\src\TestBench\mux_8_16bus_TB.vhd" 
asim +access +r TESTBENCH_FOR_mux_8_16bus 
wave 
wave -noreg I0
wave -noreg I1
wave -noreg I2
wave -noreg I3
wave -noreg I4
wave -noreg I5
wave -noreg I6
wave -noreg I7
wave -noreg S
wave -noreg Z
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\mux_8_16bus_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_mux_8_16bus 
