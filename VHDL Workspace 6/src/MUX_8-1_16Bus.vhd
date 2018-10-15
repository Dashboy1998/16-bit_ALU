library ieee;
library gate_lib;
use gate_lib.all;	 
use ieee.std_logic_1164.all;

entity Mux_8_16Bus is
	port(
		I0, I1, I2, I3, I4, I5, I6, I7: in std_logic_vector(15 downto 0):=(others => '0'); -- Inputs of mux
		S: in std_logic_vector(2 downto 0):=(others => '0');	-- Select Lines
		Z: out std_logic_vector(15 downto 0):=(others => '0') -- Output data
		);
end Mux_8_16Bus;

architecture structural of Mux_8_16Bus is
	component mux_8
		port(I0, I1, I2, I3, I4, I5, I6, I7: in std_logic;
			S: in std_logic_vector(2 downto 0);
			Z: out std_logic
			);	
	end component mux_8;
	
begin
	
	MUX: for i in 0 to 15 generate -- Creates 16 8-1 Muxes
		begin
		MUXn: mux_8 port map(I0(i), I1(i), I2(i), I3(i), I4(i), I5(i), I6(i), I7(i), S, Z(i)); 
	end generate;
	
end structural;