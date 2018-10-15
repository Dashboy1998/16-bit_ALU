library ieee;
library VHDL_Workspace_3;
library gate_lib;
use VHDL_Workspace_3.all;
use ieee.std_logic_1164.all;
use gate_lib.all;

entity multiplier_16bit is
	port( 
		A, B: in std_logic_vector(15 downto 0);
		P: out std_logic_vector(15 downto 0)
		);
end multiplier_16bit;

architecture structural of multiplier_16bit is
	component and2
		port(A,B: in std_logic; C : out std_logic);	
	end component and2;
	component halfAdder
	port(A,B: in std_logic; S, Cout : out std_logic);	
end component halfAdder;
component fullAdder
	port(A, B, Cin: in std_logic; S, Cout: out std_logic);	
end component fullAdder;
	signal nth_AND : std_logic(135 downto 0);
	signal nth_HF : std_logic(15 downto 1);
	signal nth_FA : std_logic(106 downto 2);
begin
	
	Product: for i in 0 to 15 generate
		begin
		ANDs: for j in 0 to i generate
			begin
			for k in 0 to j generate
				ANDn: and2 port map(
			end generate ANDn;
		end generate ANDs;
	end generate Product;
	
	
	--	Add: for i in 1 to 15 generate
	--		alias Cin : std_logic is Co(i-1); -- Alias to make the carry out of I-1 into the carry in of I
	--		begin	  
	--		AddX:fullAdder port map(A(i),B(i), Cin, S(i), Co(i));
	--	end generate Add;
	
end structural;