-------------------------------------------------------------------------------
-- sigma0.vhd: Banc de teste du module sigma0.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sigma0_tb is
end sigma0_tb;

architecture sigma0_tb of sigma0_tb is

  type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);
constant INPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"3a2d1407",
	x"166fbdcb",
	x"04565440",
	x"3c013f2a",
	x"0048a6a4",
	x"12420758",
	x"2f967474",
	x"25ded534",
	x"3771daf3",
	x"11285391",
	x"2cb61b14",
	x"3867866a",
	x"0313f024",
	x"025dd70f",
	x"1957fd85",
	x"16d86f5c",
	x"3cda0353",
	x"0d7193dd",
	x"1e018a1d",
	x"16632d0b",
	x"0ff3358e",
	x"07852f73",
	x"0d59ee21",
	x"176792ea",
	x"1c5011d2",
	x"308b08bb",
	x"0b6adbc8",
	x"26baa0da",
	x"21e2b30c",
	x"38880e0e",
	x"3cde1036",
	x"26e1b92b",
	x"33de2a1b",
	x"0cd2d337",
	x"3e439980",
	x"015596a0",
	x"33fb23ca",
	x"2d53e76e",
	x"2348dcad",
	x"1fbe826c",
	x"15b0ceda",
	x"09c76b5d",
	x"3dffdbb2",
	x"2d394a2d",
	x"297901f5",
	x"26f8671d",
	x"2e1b3b74",
	x"1f93f5f6",
	x"301021bb",
	x"0c06e039",
	x"383189c9",
	x"088dbe4a",
	x"35b546b8",
	x"37a2afa8",
	x"24f8c376",
	x"2f184218",
	x"3568236b",
	x"1d5017d6",
	x"288b1a31",
	x"3097fcc4",
	x"042baa40",
	x"2aa31a9b"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"dae28881",
	x"95347056",
	x"fa44b7b3",
	x"72ad0733",
	x"17a8bbed",
	x"364d738f",
	x"f1953110",
	x"db824b2c",
	x"dd2e01ef",
	x"798cd9e2",
	x"0be0b3c7",
	x"23518a47",
	x"ce24749a",
	x"0fb35b24",
	x"f58b21bb",
	x"1eebdd4f",
	x"bda22af7",
	x"1bfb7b4e",
	x"1140e6f3",
	x"21745402",
	x"e35a8ac5",
	x"aec4bbeb",
	x"55e69572",
	x"8cc2f7db",
	x"49c3ae85",
	x"a5d9aab4",
	x"77f5cd89",
	x"65fcf579",
	x"1ad59351",
	x"de6bff21",
	x"76c6ba0e",
	x"8605f5dc",
	x"e48678b8",
	x"11c00e68",
	x"cdf71485",
	x"e30fef01",
	x"7e207fe4",
	x"ffb82bf1",
	x"8ec999e0",
	x"ee86ed11",
	x"3087f666",
	x"0534e0cb",
	x"ad80d1e5",
	x"ff0f8ff5",
	x"a1f0df10",
	x"90cb5a9f",
	x"bcca6ebc",
	x"6783d99c",
	x"815b642f",
	x"59493c09",
	x"c662871e",
	x"468a03dd",
	x"edb61cd2",
	x"fa17b621",
	x"7182cf88",
	x"7a0f08f8",
	x"768e0f4e",
	x"79bbb700",
	x"b7c34676",
	x"b5f76b4c",
	x"fda3cbdd",
	x"921bff14"
	);


  signal input  : std_logic_vector(31 downto 0);
  signal output : std_logic_vector(31 downto 0);

begin

  SIGMA0_MODULE: entity work.sigma0
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

end sigma0_tb;

