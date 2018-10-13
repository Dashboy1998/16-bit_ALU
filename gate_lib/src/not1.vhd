-- NOT gate
library ieee;
use ieee.std_logic_1164.all;

entity not1 is
	port(A: in std_logic:='0'; B: out std_logic:='0');
end entity not1;

architecture not1 of not1 is
begin
	process(A)
	begin
		if(A='1') then
			B <= '0' after 10ns;
		else
			B <= '1' after 10ns;
		end if;
	end process;
end architecture not1;