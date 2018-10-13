-- 2 input XOR gate

entity xor2 is
	port(A, B: in bit; C: out bit);
end entity xor2;

architecture xor2 of xor2 is
begin
	process(A,B)
	begin
		if((A = '1' and B = '0') or (A = '0' and B = '1')) then
			C <= '1' after 10ns;
		else
			C <= '0' after 10ns;
		end if;
	end process;
end architecture xor2;