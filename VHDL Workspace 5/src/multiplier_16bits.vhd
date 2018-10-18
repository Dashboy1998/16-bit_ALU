library ieee;			 
library gate_lib;		 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use gate_lib.all;		  	   

entity multiplier_16bit is
	port( 
		A, B: in std_logic_vector(15 downto 0);
		P: out std_logic_vector(31 downto 0)
		);
end multiplier_16bit;

architecture structural of multiplier_16bit is 
begin
	
	P <= std_logic_vector(signed(A) * signed(B));
	
end structural;