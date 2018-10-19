SetActiveLib -work
comp -include "$dsn\src\ALU_16bit.vhd" 
comp -include "$dsn\src\TestBench\alu_16bits_TB.vhd" 
asim +access +r TESTBENCH_FOR_alu_16bits 
wave 
wave -noreg A
wave -noreg B
wave -noreg R
wave -noreg S2
wave -noreg S1
wave -noreg S0
wave -noreg status
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\alu_16bits_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_alu_16bits 
