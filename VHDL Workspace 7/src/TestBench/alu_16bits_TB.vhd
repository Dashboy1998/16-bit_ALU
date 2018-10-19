library ieee;
library VHDL_Workspace_3;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use VHDL_Workspace_3.all;

-- Add your library and packages declaration here ...

entity alu_16bits_tb is
end alu_16bits_tb;

architecture TB_ARCHITECTURE of alu_16bits_tb is
	-- Component declaration of the tested unit
	component alu_16bits
		port(
			A : in STD_LOGIC_VECTOR(15 downto 0);
			B : in STD_LOGIC_VECTOR(15 downto 0);
			R : inout STD_LOGIC_VECTOR(15 downto 0);
			S2 : in STD_LOGIC;
			S1 : in STD_LOGIC;
			S0 : in STD_LOGIC;
			status : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal S2 : STD_LOGIC;
	signal S1 : STD_LOGIC;
	signal S0 : STD_LOGIC;
	signal R : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal status : STD_LOGIC_VECTOR(2 downto 0);
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : alu_16bits
	port map (
		A => A,
		B => B,
		R => R,
		S2 => S2,
		S1 => S1,
		S0 => S0,
		status => status
		);
	
	-- Add your stimulus here ...
	
	process	-- Testing process
	begin	
		-- Addition test 1000 + 2000
		S2 <= '0';
		S1 <= '0';
		S0 <= '0';
		A <= std_logic_vector(to_signed(1000, 16));
		B <= std_logic_vector(to_signed(2000, 16));
		wait for 500ns;
		
		-- Multiplication test 128 * 128 
		S2 <= '0';
		S1 <= '0';
		S0 <= '1';
		A <= std_logic_vector(to_signed(128, 16));
		B <= std_logic_vector(to_signed(128, 16));
		wait for 50ns;
		assert false
		report "End of testing"
		severity failure;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu_16bits of alu_16bits_tb is
	for TB_ARCHITECTURE
		for UUT : alu_16bits
			use entity work.alu_16bits(structural);
		end for;
	end for;
end TESTBENCH_FOR_alu_16bits;

