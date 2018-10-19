-- 4 input AND gate
library ieee;
use ieee.std_logic_1164.all;
use work.gate_delay.all; -- Used to get default propagation delay


entity and4 is
	generic(pDelay: time := propagation);
	port(A, B, C, D: in std_logic:='0'; F: out std_logic:='0');
end entity and4;

architecture and4 of and4 is
begin
	F <= A and B and C and D after pDelay;
end architecture;