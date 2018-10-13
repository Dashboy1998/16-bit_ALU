library gate_lib;
use gate_lib.all;

entity halfAdder is
	port(
	A, B: in bit;
	S, Cout: out bit -- SUM and Carry bit
	);
end entity halfAdder;

architecture structural of halfAdder is	   
component and2
	port(A,B: in bit; C : out bit);	
end component and2;
component xor2
	port(A,B: in bit; C : out bit);	
end component xor2;
begin
	SUM: xor2 port map(A, B, S); -- Creates the sum bit
	Carry: and2 port map(A, B, Cout); -- Creates the carry bit
end structural;