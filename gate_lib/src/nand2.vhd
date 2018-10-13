-- 2 input NAND gate  

entity nand2 is
	port(A, B: in bit; C: out bit);
end entity nand2;

architecture nand2 of nand2 is
begin
	process(A,B)
	begin
		if(A='1' and B='1') then
			C <= '0' after 10ns;
		else
			C <= '1' after 10ns;
		end if;
	end process;
end architecture nand2;