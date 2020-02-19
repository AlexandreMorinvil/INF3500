-------------------------------------------------------------------------------
-- sigma0.vhd: Banc de teste du module ch.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ch_tb is
end ch_tb;

architecture ch_tb of ch_tb is

    type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);
constant INPUTS_1 : vector32_t(0 to 63) := (
	x"1f9970e6",
	x"2c832f07",
	x"33ba1e89",
	x"16ca9358",
	x"36be77b1",
	x"19353610",
	x"3e77aedb",
	x"34fa7707",
	x"3922883b",
	x"07fecdad",
	x"2012d436",
	x"251596f2",
	x"220cacc7",
	x"20e43e3b",
	x"272f65f7",
	x"0564b151",
	x"308da149",
	x"3e040f4c",
	x"355c742a",
	x"2e6a828b",
	x"3fc31163",
	x"05d7359e",
	x"2b526589",
	x"0124d33a",
	x"0711966a",
	x"2d6d8122",
	x"3d335581",
	x"1d49c622",
	x"02687562",
	x"22b44af6",
	x"2eccb22c",
	x"3f8b663c",
	x"02811cfc",
	x"1eb26369",
	x"37d49a57",
	x"07d474b0",
	x"251ee39e",
	x"1fc6bffc",
	x"102bfb7d",
	x"278976d6",
	x"3550855a",
	x"0beb695e",
	x"241cefc8",
	x"37ca8434",
	x"33ace1f4",
	x"3af4a96e",
	x"309bdc16",
	x"37af5482",
	x"06957ae0",
	x"28d1793c",
	x"0787cdf2",
	x"328c0da9",
	x"12763141",
	x"0fc8af08",
	x"3be89995",
	x"0e2dd1bd",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff"
	);

constant INPUTS_2 : vector32_t(0 to 63) := (
	x"3a0343eb",
	x"2abcec40",
	x"363237ed",
	x"011a0d0a",
	x"067e8d60",
	x"1f69cb85",
	x"307fe495",
	x"30d40403",
	x"37f001d5",
	x"10a64ea6",
	x"1ad8fbd8",
	x"3814a154",
	x"3d6b6d2d",
	x"18a10ca3",
	x"276d98b2",
	x"151383d0",
	x"154e70fc",
	x"2b251faa",
	x"3ed7f2cf",
	x"3fbd4c82",
	x"15814285",
	x"1fd6531c",
	x"1c5d7c89",
	x"27fd2c9f",
	x"1bb428bc",
	x"24739187",
	x"122cc0ec",
	x"1bf43391",
	x"25a33a43",
	x"171392ac",
	x"359d81b4",
	x"16405ced",
	x"11555b6f",
	x"0868c97b",
	x"3372954d",
	x"3438de7c",
	x"05587c42",
	x"25ff9211",
	x"0c1884d1",
	x"142eb636",
	x"01069672",
	x"0c7e1fbf",
	x"37e66a0c",
	x"1bac7841",
	x"14c2eb61",
	x"01e42b04",
	x"335c8d7b",
	x"25b7dcf5",
	x"023c0222",
	x"17cb5f91",
	x"3364c448",
	x"19100eda",
	x"04a8e579",
	x"35a88a45",
	x"01950e4e",
	x"266cb8a7",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff"
	);

constant INPUTS_3 : vector32_t(0 to 63) := (
	x"010aa1da",
	x"0b09872e",
	x"006b7419",
	x"2ec2d344",
	x"1e6d8367",
	x"29d66f8c",
	x"178f24e6",
	x"117eb3c7",
	x"062693f6",
	x"089187ce",
	x"0814d49f",
	x"22c6597a",
	x"0c165907",
	x"2c95ed96",
	x"28b6d9e0",
	x"09bbfbd3",
	x"3ee451d2",
	x"3c5a85b2",
	x"0a1d8bf4",
	x"06bad87a",
	x"2046b536",
	x"39af2a21",
	x"031960d7",
	x"2196c145",
	x"05396fca",
	x"23fe9813",
	x"24e3cb33",
	x"3fe06a3d",
	x"1e43e1cf",
	x"028b9de7",
	x"1761d867",
	x"231ff79a",
	x"27b85d3b",
	x"16b4892e",
	x"1d630e7a",
	x"0f184bc2",
	x"01f2e3af",
	x"363254a6",
	x"00de8a2b",
	x"1806954e",
	x"3197247f",
	x"0d56963e",
	x"27375ce5",
	x"18e29d03",
	x"07d73ab0",
	x"094d2d18",
	x"0d7b2ac1",
	x"119c53dc",
	x"32aa2af4",
	x"2a5baf81",
	x"2c9e888e",
	x"2d5fa0fd",
	x"351521af",
	x"3e2318f9",
	x"05c399c5",
	x"30d0efc0",
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"ffffffff",
	x"ffffffff"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"1a03c1fa",
	x"2b88ac28",
	x"32737699",
	x"280a410c",
	x"0e7f8566",
	x"39e34b8c",
	x"31ffa4b5",
	x"31d484c3",
	x"372413d5",
	x"08a74ee6",
	x"0814d099",
	x"22d6c958",
	x"2c1a7d05",
	x"0cb1cda7",
	x"2fbd98b2",
	x"0d9bcbd2",
	x"1e6c70da",
	x"2a5e8fba",
	x"3e55fbde",
	x"2eb858f2",
	x"1585a415",
	x"3dfe1b3d",
	x"085964df",
	x"21b6005f",
	x"033869a8",
	x"26f39913",
	x"10e0cab2",
	x"3be02a1d",
	x"1c23b0cf",
	x"021b97a5",
	x"35adc867",
	x"1614d5ae",
	x"2539596f",
	x"0824c96f",
	x"3b73946d",
	x"0c185f72",
	x"05f86023",
	x"25f6d212",
	x"00dc8053",
	x"1c0eb71e",
	x"0187a477",
	x"0c7e9f3e",
	x"27277a2d",
	x"1ba81903",
	x"14d3fb60",
	x"01ed2d14",
	x"3d78aed3",
	x"25b757dc",
	x"323e0234",
	x"02cbdf91",
	x"2b1cc44c",
	x"1d53acdc",
	x"252121ef",
	x"35ab9af1",
	x"05830844",
	x"36fcbee5",
	x"00000000",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"ffffffff"
	);


  signal input_1  : std_logic_vector(31 downto 0);
  signal input_2  : std_logic_vector(31 downto 0);
  signal input_3  : std_logic_vector(31 downto 0);
  signal output     : std_logic_vector(31 downto 0);

begin

  CH_MODULE: entity work.ch
    port map (
      X => input_1,
      Y => input_2,
      Z => input_3,
      o => output
      );

  process
  begin

    for i in 0 to 64 - 1 loop

      input_1 <= INPUTS_1(i);
      input_2 <= INPUTS_2(i);
      input_3 <= INPUTS_3(i);

      wait for 10 ns;

      assert(output = OUTPUTS(i))
        report "Simulation failed" severity failure;

    end loop;

    assert (false)
      report "Simulation successful" severity error;

  end process;

end ch_tb;

