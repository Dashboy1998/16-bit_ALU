SetActiveLib -work
comp -include "$dsn\src\fullAdder.vhd" 
comp -include "$dsn\src\TestBench\fulladder_TB.vhd" 
asim +access +r TESTBENCH_FOR_fulladder 
wave 
wave -noreg A
wave -noreg B
wave -noreg Cin
wave -noreg S
wave -noreg Cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fulladder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fulladder 
