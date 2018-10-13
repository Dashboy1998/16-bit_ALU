SetActiveLib -work
comp -include "$dsn\src\Adder_16bit.vhd" 
comp -include "$dsn\src\TestBench\adder_16bits_TB.vhd" 
asim +access +r TESTBENCH_FOR_adder_16bits 
wave 
wave -noreg A
wave -noreg B
wave -noreg S
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\adder_16bits_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_adder_16bits 
