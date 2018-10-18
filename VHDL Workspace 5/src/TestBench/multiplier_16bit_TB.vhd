library ieee;
library VHDL_Workspace_3;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use VHDL_Workspace_3.testVector.all;

	-- Add your library and packages declaration here ...

entity multiplier_16bit_tb is
end multiplier_16bit_tb;

architecture TB_ARCHITECTURE of multiplier_16bit_tb is
	-- Component declaration of the tested unit
	component multiplier_16bit
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		P : out STD_LOGIC_VECTOR(31 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal delayA : STD_LOGIC_VECTOR(15 downto 0):=(others => '0');
	signal delayB : STD_LOGIC_VECTOR(15 downto 0):=(others => '0');
	signal answer : signed(31 downto 0):=(others => '0');
	signal clk : std_logic:='0';
	-- Observed signals - signals mapped to the output ports of tested entity
	signal P : STD_LOGIC_VECTOR(31 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : multiplier_16bit
		port map (
			A => A,
			B => B,
			P => P
		);

	-- Add your stimulus here ...
	
	process
	begin 			  
		wait for 500 ns;
		clk <= not clk;
	end process;
	
	process
	begin
		for i in testAddition'left to testAddition'right loop
			B <= testAddition(i); 
			for j in testAddition'left to testAddition'right loop
				A<= testAddition(j); 
				wait until clk'event and clk = '0'; 
			end loop;
		end loop;
	wait for 20ns;
	assert false
	report "End of data"
	severity failure;
	end process;
	
	delayA <= A when clk'event and clk = '0';
	delayB <= B when clk'event and clk = '0';
	answer <= signed(delayA) * signed(delayB);
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_multiplier_16bit of multiplier_16bit_tb is
	for TB_ARCHITECTURE
		for UUT : multiplier_16bit
			use entity work.multiplier_16bit(structural);
		end for;
	end for;
end TESTBENCH_FOR_multiplier_16bit;

