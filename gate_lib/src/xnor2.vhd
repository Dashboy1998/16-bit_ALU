-- 2 input XNOR gate
library ieee;
use ieee.std_logic_1164.all;

entity xnor2 is
	port(A, B: in std_logic:='0'; C: out std_logic:='0');
end entity xnor2;

architecture xnor2 of xnor2 is
begin
	process(A,B)
	begin
		if((A = '1' and B = '0') or (A = '0' and B = '1')) then
			C <= '0' after 10ns;
		else
			C <= '1' after 10ns;
		end if;
	end process;
end architecture xnor2;