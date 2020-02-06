-------------------------------------------------------------------------------
-- ch.vhd: fonction choose.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity choose_function is
	port (
		X, Y, Z : in std_logic;
		Cout : out std_logic
	);
end choose_function;

architecture Behavioral of choose_function is
signal T1, T2 : std_logic;
begin
	Cout <= T1 xor T2;
	T1 <= X and Y;
	T2 <= (not X) and Z;
end Behavioral;
