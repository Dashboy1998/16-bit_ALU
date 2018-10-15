library ieee;
library gate_lib;
use gate_lib.all;
use ieee.std_logic_1164.all;

entity nMux is
	port(
	I: in std_logic_vector; -- Inputs of mux
	S: in std_logic_vector;	-- Select Lines
	Z: out std_logic:='0' -- Output data
	);
end nMux;

architecture structural of nMux is
component and_gate
	generic(pDelay : time := 0 ns);
	port(A: in std_logic_vector; C : out std_logic);	
end component and_gate;
component or_gate  
	generic(pDelay : time := 0 ns);
	port(A: in std_logic_vector; C : out std_logic);	
end component or_gate;
signal ANDn: std_logic_vector(I'right to I'left);
signal input : std_logic_vector(I'right to I'left);
begin
	input <= I;
	ANDi: for i in I'right to I'left generate
		begin
			ANDx: and_gate port map (input, ANDn(i));
		end generate;
	
	O: or_gate port map(ANDn, Z);
end structural;