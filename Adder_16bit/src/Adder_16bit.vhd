library ieee;
library fullAdder;
library halfAdder;
use ieee.std_logic_1164.all;
use fullAdder.all;
use halfAdder.all;

entity Adder_16bits is
	port(
	A, B: in std_logic_vector(15 downto 0); -- Two inputs
	S: inout std_logic_vector(15 downto 0)-- Overflow not needed for adder
	);
end entity Adder_16bits;

architecture structural of Adder_16bits is
component fullAdder
	port(A, B, Cin: in std_logic; S, Cout: out std_logic);	
end component fullAdder;
component halfAdder
	port(A,B: in std_logic; S, Cout : out std_logic);	
end component halfAdder;
signal Co: std_logic_vector(15 downto 0); -- May not need #15
begin
	LSB: halfAdder port map(A(0), B(0), S(0), Co(0));
	
	Add: for i in 15 downto 1 generate 
		begin
		AddX:fullAdder port map(A(i),B(i), Co(i-1), S(i), Co(i));
	end generate Add;
end structural;