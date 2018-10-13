library fullAdder;
library halfAdder;
use fullAdder.all;
use halfAdder.all;

entity Adder_16bits is
	--type bit_vector is array (NATURAL range <>) of bit;
	port(
	A, B: in bit_vector(15 downto 0); -- Two inputs
	S: inout bit_vector(15 downto 0)-- Overflow not needed for adder
	);
end entity Adder_16bits;

architecture structural of Adder_16bits is
component fullAdder
	port(A, B, Cin: in bit; S, Cout: out bit);	
end component fullAdder;
component halfAdder
	port(A,B: in bit; S, Cout : out bit);	
end component halfAdder;
signal Co: bit_vector(15 downto 0); -- May not need #15
begin
	LSB: halfAdder port map(A(0), B(0), S(0), Co(0));
	
	Add: for i in 15 downto 1 generate 
		begin
		AddX:fullAdder port map(A(i),B(i), Co(i-1), S(i), Co(i));
	end generate Add;
end structural;