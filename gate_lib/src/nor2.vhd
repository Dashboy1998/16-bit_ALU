-- 2 Input NOR gate
entity nor2 is
	port(A, B: in bit; C: out bit);
end entity nor2;

architecture nor2 of nor2 is
begin
	process(A,B)
	begin
		if(A = '0' and B = '0') then
			C <= '1' after 10ns;
		else
			C <= '0' after 10ns;  
		end if;
	end process;
end architecture nor2;