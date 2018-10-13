
	-- Add your library and packages declaration here ...

entity adder_16bits_tb is
end adder_16bits_tb;

architecture TB_ARCHITECTURE of adder_16bits_tb is
	-- Component declaration of the tested unit
	component adder_16bits
	port(
		A : in BIT_VECTOR(15 downto 0);
		B : in BIT_VECTOR(15 downto 0);
		S : inout BIT_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : BIT_VECTOR(15 downto 0);
	signal B : BIT_VECTOR(15 downto 0);
	signal S : BIT_VECTOR(15 downto 0);
	signal test : BIT_VECTOR(31 downto 0);
	signal clk : bit;
	signal testing : boolean:= true;
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : adder_16bits
		port map (
			A => A,
			B => B,
			S => S
		);

	-- Add your stimulus here ...
	
	process(clk)
	begin 
		test <= test + 1;
		if(test = "11111111111111111111111111111111") then
			testing <= false;
		end if;
	end process;
	
	clk <= not clk after 200ns when testing;
	A <= test(15 downto 0);
	B <= test(31 downto 16);
	
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder_16bits of adder_16bits_tb is
	for TB_ARCHITECTURE
		for UUT : adder_16bits
			use entity work.adder_16bits(structural);
		end for;
	end for;
end TESTBENCH_FOR_adder_16bits;

