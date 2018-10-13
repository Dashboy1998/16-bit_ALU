-- 2 Input NOR gate	 
library ieee;
use ieee.std_logic_1164.all;

entity nor2 is
	port(A, B: in std_logic:='0'; C: out std_logic:='0');
end entity nor2;

architecture nor2 of nor2 is
begin
	process(A,B)
	begin
		if(A = '0' and B = '0') then
			C <= '1' after 10ns;
		else
			C <= '0' after 10ns;  
		end if;
	end process;
end architecture nor2;