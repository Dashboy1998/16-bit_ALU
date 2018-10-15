library ieee;
use ieee.std_logic_1164.all;
library gate_lib;
use gate_lib.all;

entity halfAdder is
	port(
	A, B: in std_logic:='0'; -- Inputs of half adder
	S, Cout: out std_logic:='0' -- SUM and Carry bit
	);
end entity halfAdder;

architecture structural of halfAdder is	   
component and2
	port(A,B: in std_logic; C : out std_logic);	
end component and2;
component xor2
	port(A,B: in std_logic; C : out std_logic);	
end component xor2;
begin
	SUM: xor2 port map(A, B, S); -- Creates the sum bit
	Carry: and2 port map(A, B, Cout); -- Creates the carry bit
end structural;