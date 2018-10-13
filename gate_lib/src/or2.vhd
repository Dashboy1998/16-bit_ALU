-- 2 input OR gate
library ieee;
use ieee.std_logic_1164.all;

entity or2 is
	port(A, B: in std_logic:='0'; C: out std_logic:='0');
end entity or2;

architecture or2 of or2 is
begin
	process(A,B)
	begin
		if(A = '0' and B = '0') then
			C <= '0' after 10ns;
		else
			C <= '1' after 10ns;
		end if;
	end process;
end architecture or2;
