-------------------------------------------------------------------------------
-- sigma0.vhd: Banc de teste du module sigma0.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sigma1_tb is
end sigma1_tb;

architecture sigma1_tb of sigma1_tb is

  type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);
constant INPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"1ac72c5c",
	x"39677098",
	x"1c1b1c87",
	x"211e7275",
	x"2ff11c74",
	x"0dec1615",
	x"2c213ff3",
	x"1cb64b5e",
	x"2f8b9f9c",
	x"14a6e512",
	x"367745b7",
	x"2e9e6d3b",
	x"2d9aa62f",
	x"10465ca1",
	x"15b79182",
	x"1cc1a536",
	x"29df12b2",
	x"1d00ff86",
	x"1a552833",
	x"21b36b2b",
	x"0e10c7dd",
	x"20d8d235",
	x"3cdd9dda",
	x"30f3bfa3",
	x"14227698",
	x"23da98d0",
	x"383b43b6",
	x"2329c9df",
	x"14822bfa",
	x"105a552c",
	x"0bee9637",
	x"0a69b5c5",
	x"3c561f4a",
	x"1b3704cd",
	x"2652eafe",
	x"2e6e51f4",
	x"2bc04001",
	x"141c9ee4",
	x"36dfded7",
	x"30df6db6",
	x"3c1b83c5",
	x"1dbc5258",
	x"286503c4",
	x"198d7706",
	x"2e3bf46f",
	x"0e1583b9",
	x"034ccef4",
	x"0ab25892",
	x"00b1fe05",
	x"36ae8b4c",
	x"37d946c7",
	x"1d3317b2",
	x"2e057cbf",
	x"14d93306",
	x"106af0cb",
	x"24de3274",
	x"12fa0b05",
	x"29f17488",
	x"0bb8ffc1",
	x"1cabbd94",
	x"3ccc0f6f",
	x"3b9c7727"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"987e6a59",
	x"c05afd30",
	x"811dac9f",
	x"15196097",
	x"a6b40045",
	x"609d075c",
	x"224af94e",
	x"4894e0ea",
	x"46f4111a",
	x"b9628642",
	x"519dc865",
	x"04e937ee",
	x"b400ce5a",
	x"334d4131",
	x"e3dca9be",
	x"1e6205ae",
	x"716b1ebc",
	x"68c860ef",
	x"e09e0788",
	x"10576e51",
	x"87fa6f80",
	x"fe4e62c2",
	x"bd7a00da",
	x"017a0111",
	x"a269419e",
	x"b7c77921",
	x"b386317a",
	x"d38c2d8f",
	x"d60565e0",
	x"38e9f416",
	x"ed85dc0f",
	x"98520964",
	x"eab977a0",
	x"364ddc7e",
	x"8e28fee5",
	x"d9148e9a",
	x"e4aa799d",
	x"429d83e2",
	x"e9d2cf1b",
	x"01b3bd43",
	x"61960fe1",
	x"f55c6acd",
	x"5aa57abb",
	x"3e1e877e",
	x"2ca71f38",
	x"99d84839",
	x"a8ea20a3",
	x"0347d62c",
	x"8c5dd347",
	x"0e19c9e7",
	x"289afda8",
	x"a7bcb332",
	x"69e38aca",
	x"14087ce0",
	x"005bc315",
	x"f10ed91d",
	x"09ec35e4",
	x"4918bfe8",
	x"20707465",
	x"b72ff18f",
	x"37131e22",
	x"b63291cf"
	);




  signal input  : std_logic_vector(31 downto 0);
  signal output : std_logic_vector(31 downto 0);

begin

  SIGMA1_MODULE: entity work.sigma1
    port map (
      X => input,
      o => output
      );

  process
  begin

    for i in 0 to 64 - 1 loop

      input <= INPUTS(i);

      wait for 10 ns;

      assert(output = OUTPUTS(i))
        report "Simulation failed" severity failure;

    end loop;

    assert (false)
      report "Simulation successful" severity error;

  end process;

end sigma1_tb;

