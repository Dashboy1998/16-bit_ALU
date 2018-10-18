library ieee;			 
library gate_lib;		  
library VHDL_Workspace_3; -- 16 bit Adder
library VHDL_Workspace_4; -- 16 bit subtractor
library VHDL_Workspace_5; -- 16 bit multiplier
library VHDL_Workspace_6; -- 16 bit bus 8-1 Mux
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use gate_lib.all; 
use VHDL_Workspace_3.all; -- 16 bit Adder
use VHDL_Workspace_4.all; -- 16 bit subtractor
use VHDL_Workspace_5.all; -- 16 bit multiplier
use VHDL_Workspace_6.all; -- 16 bit bus 8-1 Mux

entity ALU_16bits is
	port(A, B: in std_logic_vector(15 downto 0):=(others=>'0');
		S: in std_logic_vector(2 downto 0):=(others=>'0');
		R: out std_logic_vector(15 downto 0):=(others=>'0'));
end ALU_16bits;

architecture structural of ALU_16bits is					
	component Adder_16bits
		port(
			A, B: in std_logic_vector(15 downto 0);
			C: in std_logic:='0';
			S: inout std_logic_vector(15 downto 0)
			);
	end component Adder_16bits;
	component subtractor_16bit
		port(
			A, B: in std_logic_vector(15 downto 0);
			D: inout std_logic_vector(15 downto 0)
			);
	end component subtractor_16bit;
	component multiplier_16bit
		port(
			A, B: in std_logic_vector(15 downto 0);
			P: inout std_logic_vector(31 downto 0)
			);
	end component multiplier_16bit;	
	component Mux_8_16Bus
		port(
			I0, I1, I2, I3, I4, I5, I6, I7: in std_logic_vector(15 downto 0):=(others => '0'); -- Inputs of mux
			S: in std_logic_vector(2 downto 0):=(others => '0');	-- Select Lines
			Z: out std_logic_vector(15 downto 0):=(others => '0') -- Output data
			);
	end component Mux_8_16Bus;
	signal Sum, Diff: std_logic_vector(15 downto 0):=(others=>'0');
	signal Pro: std_logic_vector(31 downto 0):=(others=>'0');
begin									
	Add: Adder_16bits port map(A, B, '0', Sum);	-- Addition
	Sub: subtractor_16bit port map(A, B, Diff);	-- Subtraction
	Mult: multiplier_16bit port map(A, B, Pro); -- Multiplication
	MUX: Mux_8_16Bus port map(Sum, Pro(15 downto 0), A, B, Diff, X"0000", X"0000", X"0000", S, R);
	
	-- Status Registors
	
	
end structural;