library halfAdder;
library gate_lib;
use halfAdder.all;
use gate_lib.all;

entity fullAdder is
	port(
	A, B, Cin: in bit;
	S, Cout: out bit
	);
end entity fullAdder;

architecture structural of fullAdder is	   
component or2
	port(A,B: in bit; C : out bit);	
end component or2;
component halfAdder
	port(A,B: in bit; S, Cout : out bit);	
end component halfAdder;
signal S1, Co1, Co2: bit;
begin
	AddBCin: halfAdder port map(B, Cin, S1, Co1); -- Adds B and C  
	AddAS1: halfAdder port map(A, S1, S, Co2); -- Adds A and S1
	ORC: or2 port map(Co1, Co2, Cout); -- ORs carries
	
end structural;