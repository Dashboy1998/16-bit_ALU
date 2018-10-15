-- NOT gate
library ieee;
use ieee.std_logic_1164.all;   
use work.gate_delay.all; -- Used to get default propagation delay

entity not1 is 
	generic(pDelay: time := propagation);
	port(A: in std_logic:='0'; B: out std_logic:='0');
end entity not1;

architecture not1 of not1 is
begin
	process(A)
	begin
		if(A='1') then
			B <= '0' after pDelay;
		else
			B <= '1' after pDelay;
		end if;
	end process;
end architecture not1;