library ieee;
library halfAdder;
library gate_lib;
use ieee.std_logic_1164.all;
use halfAdder.all;
use gate_lib.all;

entity fullAdder is
	port(
	A, B, Cin: in std_logic:='0';
	S, Cout: out std_logic:='0'
	);
end entity fullAdder;

architecture structural of fullAdder is	   
component or2
	port(A,B: in std_logic; C : out std_logic);	
end component or2;
component halfAdder
	port(A,B: in std_logic; S, Cout : out std_logic);	
end component halfAdder;
signal S1, Co1, Co2: std_logic;
begin
	AddAB: halfAdder port map(A, B, S1, Co2); -- Adds A and B
	AddS1Cin: halfAdder port map(S1, Cin, S, Co1); -- Adds S1 and Cin  
	ORC: or2 port map(Co1, Co2, Cout); -- ORs carries
	
end structural;