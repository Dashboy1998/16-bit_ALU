-- 2 input XOR gate
library ieee;
use ieee.std_logic_1164.all; 
use work.gate_delay.all; -- Used to get default propagation delay

entity xor2 is	
	generic(pDelay: time := propagation);
	port(A, B: in std_logic:='0'; C: out std_logic:='0');
end entity xor2;

architecture xor2 of xor2 is
begin
	process(A,B)
	begin
		if((A = '1' and B = '0') or (A = '0' and B = '1')) then
			C <= '1' after pDelay;
		else
			C <= '0' after pDelay;
		end if;
	end process;
end architecture xor2;