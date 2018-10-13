library ieee;
library fullAdder;
library halfAdder;
use ieee.std_logic_1164.all;
use fullAdder.all;
use halfAdder.all;

entity Adder_16bits is
	port(
	A, B: in std_logic_vector(15 downto 0):=(others => '0'); -- Two inputs
	C: in std_logic:='0'; -- Carry in 
	S: inout std_logic_vector(15 downto 0):=(others => '0')-- Overflow not needed for adder
	);
end entity Adder_16bits;

architecture structural of Adder_16bits is
component fullAdder
	port(A, B, Cin: in std_logic; S, Cout: out std_logic);	
end component fullAdder;
signal Co: std_logic_vector(15 downto 0); -- May not need #15
begin
	LSB: fullAdder port map(A(0), B(0), C, S(0), Co(0));
	
	Add: for i in 1 to 15 generate
		alias Cin : std_logic is Co(i-1); -- Alias to make the carry out of I-1 into the carry in of I
		begin	  
		AddX:fullAdder port map(A(i),B(i), Cin, S(i), Co(i));
	end generate Add;						 
	
	--mux: mux port map(Sum(i), Pro(i), A(i), B(i), Dif(i), 0, 0, S0, S1, S2, O(i));
	
end structural;