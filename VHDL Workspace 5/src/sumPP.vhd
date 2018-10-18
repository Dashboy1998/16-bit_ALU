library ieee;			  
library gate_lib;
library VHDL_Workspace_2;
use ieee.std_logic_1164.all;
use gate_lib.all;
use VHDL_Workspace_2.all; 

entity sumPP is
	port(
		SUMin, A, B, Cin: in std_logic:='0';
		Cout, SUMout: out std_logic:='0'
		);						   
end sumPP;

architecture structural of sumPP is
	component and2
		port(A,B: in std_logic; C : out std_logic);	
	end component and2;
	component fullAdder
		port(A, B, Cin: in std_logic; S, Cout: out std_logic);	
	end component fullAdder;
	signal ANDin: std_logic:='0';
begin
	PP: and2 port map(A, B, ANDin); -- ANDs A and B (Terminatines if partial product
	FA: fullAdder port map(SUMin, ANDin, Cin, SUMout, Cout); -- Adds partial product with Sum in
end structural;