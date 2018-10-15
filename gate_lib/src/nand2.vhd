-- 2 input NAND gate  
library ieee;
use ieee.std_logic_1164.all; 
use work.gate_delay.all; -- Used to get default propagation delay

entity nand2 is
	generic(pDelay: time := propagation);
	port(A, B: in std_logic:='0'; C: out std_logic:='0');
end entity nand2;

architecture nand2 of nand2 is
begin
	process(A,B)
	begin
		if(A='1' and B='1') then
			C <= '0' after pDelay;
		else
			C <= '1' after pDelay;
		end if;
	end process;
end architecture nand2;