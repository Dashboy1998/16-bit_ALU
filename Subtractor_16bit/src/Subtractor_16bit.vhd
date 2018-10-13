library ieee;
library adder_16bit;
library gate_lib;
use Adder_16bit.all;
use ieee.std_logic_1164.all;
use gate_lib.all;

entity subtractor_16bit is
	port(
		A, B: in std_logic_vector(15 downto 0);
		D: out std_logic_vector(15 downto 0) -- difference
	);
end subtractor_16bit;

architecture structural of subtractor_16bit is  
component Adder_16bits
	port(
	A, B: in std_logic_vector(15 downto 0);
	C: in std_logic;
	S: inout std_logic_vector(15 downto 0)
	);
end component Adder_16bits;
component not1
	port(A: in std_logic; B: out std_logic);
end component not1;
signal Bn: std_logic_vector(15 downto 0);
begin
	notB: for i in 0 to 15 generate
		begin
			notBi: not1 port map(B(i), Bn(i));
		end generate notB;
	
	sub: Adder_16bits port map(A, Bn, '1', D);
	
end structural;