SetActiveLib -work
comp -include "$dsn\src\multiplier_16bits.vhd" 
comp -include "$dsn\src\TestBench\multiplier_16bit_TB.vhd" 
asim +access +r TESTBENCH_FOR_multiplier_16bit 
wave 
wave -noreg A
wave -noreg B
wave -noreg P
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\multiplier_16bit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_multiplier_16bit 
