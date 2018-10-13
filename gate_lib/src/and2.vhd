-- 2 input AND gate
library ieee;
use ieee.std_logic_1164.all;


entity and2 is
	port(A, B: in std_logic:='0'; C: out std_logic:='0');
end entity and2;

architecture and2 of and2 is
begin
	process(A,B)
	begin
		if(A = '1' and B = '1') then
			C <= '1' after 10ns;
		else
			C <= '0' after 10ns;
		end if;
	end process;
end architecture;