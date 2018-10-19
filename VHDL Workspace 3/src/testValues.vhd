library ieee; 
use ieee.std_logic_1164.all;

-- Array declaration of test vectors

package testVector is 
	type testVector is array (NATURAL range <>) of std_logic_vector(15 downto 0);
	--						             -16,384,   -256,    -1,      255,    16,383,  16,384
	constant testAddition: testVector:=( X"C000", X"FF00", X"FFFF", X"00FF", X"3FFF", X"4000"); -- Test values for 16-bit adder/subtractor/multiplier	   
end testVector;