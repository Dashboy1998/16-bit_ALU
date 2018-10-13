library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	-- Add your library and packages declaration here ...
use work.testVector.all;	
	
entity adder_16bits_tb is
end adder_16bits_tb;

architecture TB_ARCHITECTURE of adder_16bits_tb is
	-- Component declaration of the tested unit
	component adder_16bits
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		C : in STD_LOGIC; 
		S : inout STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal C : STD_LOGIC;
	signal S : STD_LOGIC_VECTOR(15 downto 0); 
	signal delayA : STD_LOGIC_VECTOR(15 downto 0):=(others => '0');
	signal delayB : STD_LOGIC_VECTOR(15 downto 0):=(others => '0');
	signal answer : signed(15 downto 0):=(others => '0');
	signal clk : std_logic:='0';
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...
	
begin

	-- Unit Under Test port map
	UUT : adder_16bits
		port map (
			A => A,
			B => B,
			C => C,
			S => S
		);

	-- Add your stimulus here ...
	
	process
	begin 			  
		wait for 240 ns;
		clk <= not clk;
	end process;
	
	process
	begin
		for i in testAddition'left to testAddition'right loop
			B <= testAddition(i); 
			for j in testAddition'left to testAddition'right loop
				A<= testAddition(j); 
				wait for 480ns; 
			end loop;
		end loop;
	wait for 20ns;
	assert false
	report "End of data"
	severity failure;
	end process;
	
	
	--- test every 16384
	
	delayA <= A after 480ns;
	delayB <= B after 480ns;
	answer <= signed(delayA) + signed(delayB);
	C <= '0';
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder_16bits of adder_16bits_tb is
	for TB_ARCHITECTURE
		for UUT : adder_16bits
			use entity work.adder_16bits(structural);
		end for;
	end for;
end TESTBENCH_FOR_adder_16bits;

