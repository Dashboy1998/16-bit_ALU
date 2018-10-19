library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

	-- Add your library and packages declaration here ...

entity mux_8_16bus_tb is
end mux_8_16bus_tb;

architecture TB_ARCHITECTURE of mux_8_16bus_tb is
	-- Component declaration of the tested unit
	component mux_8_16bus
	port(
		I0 : in STD_LOGIC_VECTOR(15 downto 0);
		I1 : in STD_LOGIC_VECTOR(15 downto 0);
		I2 : in STD_LOGIC_VECTOR(15 downto 0);
		I3 : in STD_LOGIC_VECTOR(15 downto 0);
		I4 : in STD_LOGIC_VECTOR(15 downto 0);
		I5 : in STD_LOGIC_VECTOR(15 downto 0);
		I6 : in STD_LOGIC_VECTOR(15 downto 0);
		I7 : in STD_LOGIC_VECTOR(15 downto 0);
		S : in STD_LOGIC_VECTOR(2 downto 0);
		Z : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal I0 : STD_LOGIC_VECTOR(15 downto 0);
	signal I1 : STD_LOGIC_VECTOR(15 downto 0);
	signal I2 : STD_LOGIC_VECTOR(15 downto 0);
	signal I3 : STD_LOGIC_VECTOR(15 downto 0);
	signal I4 : STD_LOGIC_VECTOR(15 downto 0);
	signal I5 : STD_LOGIC_VECTOR(15 downto 0);
	signal I6 : STD_LOGIC_VECTOR(15 downto 0);
	signal I7 : STD_LOGIC_VECTOR(15 downto 0);
	signal S : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Z : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...
	signal clk : std_logic:='0';
begin

	-- Unit Under Test port map
	UUT : mux_8_16bus
		port map (
			I0 => I0,
			I1 => I1,
			I2 => I2,
			I3 => I3,
			I4 => I4,
			I5 => I5,
			I6 => I6,
			I7 => I7,
			S => S,
			Z => Z
		);

	-- Add your stimulus here ...
	process
	begin 			  
		wait for 10 ns;
		clk <= not clk after 10ns;
	end process;
	
	process
	begin					
		for i in 0 to 7 loop -- Loops through all the select values
			S <= std_logic_vector(to_unsigned(i, 3));
			wait until clk'event and clk = '1';
			wait for 10ns;
		end loop;
		wait for 5ns;
		assert false
		report "End of testing"
		severity failure;
	end process;
	
	-- Sets the value of the inputs
	I0 <= X"0000";
	I1 <= X"0001";
	I2 <= X"0002";
	I3 <= X"0003";
	I4 <= X"0004";
	I5 <= X"0005";
	I6 <= X"0006";
	I7 <= X"0007";
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mux_8_16bus of mux_8_16bus_tb is
	for TB_ARCHITECTURE
		for UUT : mux_8_16bus
			use entity work.mux_8_16bus(structural);
		end for;
	end for;
end TESTBENCH_FOR_mux_8_16bus;

