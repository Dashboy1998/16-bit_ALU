-- NOT gate

entity not1 is
	port(A: in bit; B: out bit);
end entity not1;

architecture not1 of not1 is
begin
	process(A)
	begin
		if(A='1') then
			B <= '0' after 10ns;
		else
			B <= '1' after 10ns;
		end if;
	end process;
end architecture not1;