library ieee;
library gate_lib;
use gate_lib.all;
use ieee.std_logic_1164.all;

entity Mux_8 is
	port(
	I: in std_logic_vector(7 downto 0):=(others => '0'); -- Inputs of mux
	S: in std_logic_vector(2 downto 0):=(others => '0');	-- Select Lines
	Z: out std_logic:='0' -- Output data
	);
end Mux_8;

architecture structural of Mux_8 is
begin
end structural;