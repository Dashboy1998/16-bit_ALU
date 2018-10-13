-- 2 input OR gate

entity or2 is
	port(A, B: in bit; C: out bit);
end entity or2;

architecture or2 of or2 is
begin
	process(A,B)
	begin
		if(A = '0' and B = '0') then
			C <= '0' after 10ns;
		else
			C <= '1' after 10ns;
		end if;
	end process;
end architecture or2;
