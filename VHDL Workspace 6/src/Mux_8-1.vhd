library ieee;
library gate_lib;
use gate_lib.all;		
use ieee.std_logic_1164.all;

entity Mux_8 is
	port(
		I0, I1, I2, I3, I4, I5, I6, I7: in std_logic:='0'; -- Inputs of mux
		S: in std_logic_vector(2 downto 0):=(others => '0');	-- Select Lines
		Z: out std_logic:='0' -- Output data
		);
end Mux_8;

architecture structural of Mux_8 is
	component and4
		generic(pDelay : time := 0 ns);
		port(A, B, C, D: in std_logic; F: out std_logic);	
	end component and4;
	component or_gate  
		generic(pDelay : time := 0 ns);
		port(A: in std_logic_vector; C : out std_logic);	
	end component or_gate;
	component not1
		generic(pDelay : time := 0 ns);
		port(A: in std_logic; B: out std_logic);
	end component not1;
	signal ANDn: std_logic_vector(0 to 7):=(others => '0');
	signal nS : std_logic_vector(2 downto 0):=(others => '0');
begin
	notS: for i in 0 to 2 generate -- Creates nots of the select lines
		begin
		Sn: not1 port map(S(i), nS(i));
	end generate;
	-- AND gates of the MUX
	AND_0: and4 port map (I0, nS(2), nS(1), nS(0), ANDn(0));
	AND_1: and4 port map (I1, nS(2), nS(1), S(0), ANDn(1));
	AND_2: and4 port map (I2, nS(2), S(1), nS(0), ANDn(2));
	AND_3: and4 port map (I3, nS(2), S(1), S(0), ANDn(3));
	AND_4: and4 port map (I4, S(2), nS(1), nS(0), ANDn(4));
	AND_5: and4 port map (I5, S(2), nS(1), S(0), ANDn(5));
	AND_6: and4 port map (I6, S(2), S(1), nS(0), ANDn(6));
	AND_7: and4 port map (I7, S(2), S(1), S(0), ANDn(7)); 
	
	O: or_gate port map(ANDn, Z); -- OR gate of the MUX
end structural;