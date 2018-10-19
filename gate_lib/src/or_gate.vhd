-- n input OR gate
library ieee;
use ieee.std_logic_1164.all;  
use work.gate_delay.all; -- Used to get default propagation delay

entity or_gate is  
	generic(pDelay: time := propagation);
	port(A: in std_logic_vector; C: out std_logic:='0');
end entity or_gate;

architecture or_gate of or_gate is
begin
	process(A)
	begin
		C <= '0' after pDelay;
		for i in A'right downto A'left loop
			if(A(i) = '1') then
				C <= '1' after pDelay;
				exit;
			end if;
		end loop;
	end process;
end architecture or_gate;
