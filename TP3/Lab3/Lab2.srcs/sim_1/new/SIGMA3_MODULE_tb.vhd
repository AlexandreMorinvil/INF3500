-------------------------------------------------------------------------------
-- sigma0.vhd: Banc de teste du module sigma0.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sigma3_tb is
end sigma3_tb;

architecture sigma3_tb of sigma3_tb is

  type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);
constant INPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"18bff03c",
	x"035a9c03",
	x"3506a357",
	x"0a803b44",
	x"39aff66d",
	x"05f95b3c",
	x"2d537787",
	x"08b8bda1",
	x"0e8d5598",
	x"3ac3e495",
	x"1ea3db36",
	x"092fe2ca",
	x"21564042",
	x"34353abe",
	x"2bc2029f",
	x"2570fce6",
	x"3c6e75df",
	x"1838d4db",
	x"367739f1",
	x"3e18b590",
	x"39d748d5",
	x"296c547c",
	x"32d0cb49",
	x"281723d0",
	x"1a77647a",
	x"185f7ba3",
	x"025c24b5",
	x"21eb2222",
	x"2554d315",
	x"1cd462c1",
	x"1769be32",
	x"10e8646d",
	x"0eda43d8",
	x"16fe6eb8",
	x"204bbfad",
	x"06744e0b",
	x"281210ea",
	x"38c406d9",
	x"3a96e705",
	x"0d4487c7",
	x"15e98562",
	x"36fc8ae6",
	x"2e612e07",
	x"3ea255d9",
	x"106fe344",
	x"02b2090f",
	x"3183b06e",
	x"1fa92deb",
	x"2a172987",
	x"0a6033f8",
	x"32d7d1ec",
	x"06850d17",
	x"1ef21a0e",
	x"033498b1",
	x"2d7a241b",
	x"07b50de5",
	x"2bf67fb0",
	x"3a4e94bc",
	x"04090c8a",
	x"2b493e51",
	x"2e3ab432",
	x"2e020c09"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"003fffff",
	x"061fa0b4",
	x"1d813761",
	x"85cc3d8b",
	x"1ac8241e",
	x"05f5501f",
	x"86f8fc15",
	x"d53827de",
	x"49668b64",
	x"007ca5c2",
	x"8ed68ac0",
	x"96fa6473",
	x"0d3e0e4a",
	x"e8210111",
	x"3a05d1d2",
	x"41168019",
	x"61e68a29",
	x"f45b6227",
	x"70f0e12e",
	x"7bcb203b",
	x"4c759ee2",
	x"4d7e4e03",
	x"a0bbca8e",
	x"7cc10b00",
	x"759814c1",
	x"5eb4d3ac",
	x"52a3f8fa",
	x"96ccb66c",
	x"f55d2e00",
	x"f3e16334",
	x"bd3f98e8",
	x"e8da9336",
	x"3ebf1070",
	x"6994b026",
	x"fa8eb63b",
	x"a82b26c3",
	x"aec57ee7",
	x"4a62558f",
	x"83b98a7b",
	x"af6c9fa0",
	x"d318362b",
	x"f2183228",
	x"d4226283",
	x"b2c8eab7",
	x"60581010",
	x"0dce91c2",
	x"45a6cd8d",
	x"ae36be1d",
	x"b34f066a",
	x"71f9f583",
	x"1f819c70",
	x"12c72ac5",
	x"2728c2d1",
	x"4e417021",
	x"df4e6cda",
	x"5685ad9b",
	x"274fce6f",
	x"f024ed1a",
	x"98c709cb",
	x"a7d540c6",
	x"b8e86282",
	x"0c94dc77",
	x"478e3242"
	);


  signal input  : std_logic_vector(31 downto 0);
  signal output : std_logic_vector(31 downto 0);

begin

  SIGMA3_MODULE: entity work.sigma3
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

end sigma3_tb;

