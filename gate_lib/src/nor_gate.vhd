-- n input NOR gate
library ieee;
use ieee.std_logic_1164.all;  
use work.gate_delay.all; -- Used to get default propagation delay

entity nor_gate is  
	generic(pDelay: time := propagation);
	port(A: in std_logic_vector; C: out std_logic:='0');
end entity nor_gate;

architecture nor_gate of nor_gate is
begin
	process(A)
	begin
		C <= '1' after pDelay;
		for i in A'right to A'left loop
			if(A(i) = '1') then
				C <= '0' after pDelay;
				exit;
			end if;
		end loop;
	end process;
end architecture nor_gate;
