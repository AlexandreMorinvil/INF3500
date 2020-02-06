-------------------------------------------------------------------------------
-- add3bits_tb.vhd: Banc d'essai additioneur a 3 bits.
-- Jeferson S. Silva
-------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity add3bits_tb is
end add3bits_tb;

architecture add3bits_tb of add3bits_tb is

	signal Cin	: std_logic;
	signal X	: std_logic;
	signal Y	: std_logic;
	signal Cout	: std_logic;
	signal S	: std_logic;

begin

	UUT: entity work.add3bits
		port map (
			Cin		=> Cin, 
			X		=> X,
			Y		=> Y,
			Cout	=> Cout,
			S		=> S
		);
	
	process
	begin
		Cin	<= '0';
		X	<= '0';
		Y	<= '0';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S)  = "00")			
			report "Erreur. Somme erronee. Entrees: Cin =  0, X = 0 et Y = 0" severity error;

		Cin	<= '0';
		X	<= '0';
		Y	<= '1';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S)  = "01")			
			report "Erreur. Somme erronee. Entrees: Cin =  0, X = 0 et Y = 1" severity error;

		Cin	<= '0';
		X	<= '1';
		Y	<= '0';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S) = "01")			
			report "Erreur. Somme erronee. Entrees: Cin =  0, X = 1 et Y = 0" severity error;

		Cin	<= '0';
		X	<= '1';
		Y	<= '1';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S)  = "10")			
			report "Erreur. Somme erronee. Entrees: Cin =  0, X = 1 et Y = 1" severity error;

		Cin	<= '1';
		X	<= '0';
		Y	<= '0';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S)  = "01")			
			report "Erreur. Somme erronee. Entrees: Cin =  1, X = 0 et Y = 0" severity error;

		Cin	<= '1';
		X	<= '0';
		Y	<= '1';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S)  = "10")			
			report "Erreur. Somme erronee. Entrees: Cin =  1, X = 0 et Y = 1" severity error;

		Cin	<= '1';
		X	<= '1';
		Y	<= '0';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S)  = "10")			
			report "Erreur. Somme erronee. Entrees: Cin =  1, X = 1 et Y = 0" severity error;

		Cin	<= '1';
		X	<= '1';
		Y	<= '1';                       
		wait for 10 ns;
		
		assert (unsigned'(Cout & S)  = "11")			
			report "Erreur. Somme erronee. Entrees: Cin =  1, X = 1 et Y = 1" severity error;
		
		assert (false)	
			report "La simulation est terminee." severity failure;
	end process;
	
end add3bits_tb;
