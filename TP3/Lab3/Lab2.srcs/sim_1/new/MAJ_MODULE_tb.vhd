-------------------------------------------------------------------------------
-- sigma0.vhd: Banc de teste du module maj.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity maj_tb is
end maj_tb;

architecture maj_tb of maj_tb is

  type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);

constant INPUTS_1 : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"12c69cee",
	x"02420065",
	x"1eb341f4",
	x"36f2f317",
	x"3bd8a767",
	x"39ffb6ee",
	x"30341f3d",
	x"1bcc5919",
	x"3e56a7ab",
	x"1b158d02",
	x"3ef6eed9",
	x"1acacd77",
	x"15957d8b",
	x"0c0a5cdf",
	x"3a4ab8d1",
	x"1637d463",
	x"32adeac1",
	x"2739722a",
	x"33e18218",
	x"35cfd67d",
	x"07bab8fb",
	x"20105fff",
	x"2f0d5296",
	x"2fffd6d8",
	x"1b171fd8",
	x"304d16e7",
	x"3804fb1e",
	x"1b2868f4",
	x"22a26ae3",
	x"0d413adb",
	x"031f1b76",
	x"06dbe6c3",
	x"26fc5f9d",
	x"250e3946",
	x"1414e853",
	x"1d1be6a7",
	x"2ec76371",
	x"23ea9f00",
	x"2d41315d",
	x"0b9ff172",
	x"31e861bc",
	x"015c2e53",
	x"06e32726",
	x"350ff864",
	x"14c4f1ce",
	x"157bb4f9",
	x"0e586137",
	x"2a450b2f",
	x"2b853ce3",
	x"3633a21a",
	x"2d61a404",
	x"2b8b4df5",
	x"0554a428",
	x"1c825c51",
	x"1963e6f1",
	x"31e02f48"
	);

constant INPUTS_2 : vector32_t(0 to 63) := (
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"3f9da6bc",
	x"11b5d7a7",
	x"2aa41a55",
	x"00355e27",
	x"215107ab",
	x"24adeb96",
	x"3b882d77",
	x"3ca98006",
	x"3e1cb3f3",
	x"271ee906",
	x"0fdbd48a",
	x"11d2a6c7",
	x"21b4e882",
	x"32ccf052",
	x"04088eb3",
	x"17f606b8",
	x"030d1835",
	x"36ce8743",
	x"045c6c0a",
	x"064b6c9f",
	x"3f9a91d9",
	x"0cccef12",
	x"0c461393",
	x"2c3c73aa",
	x"1e97e62c",
	x"16433a69",
	x"2d970945",
	x"32a4fb7c",
	x"1c3d8ddd",
	x"21bd2363",
	x"1fc33404",
	x"25135e26",
	x"3d084f87",
	x"181aa186",
	x"171fa3a5",
	x"0307662a",
	x"28f6e5b9",
	x"31cb3fcf",
	x"242316ef",
	x"19320478",
	x"0ec8e4f1",
	x"3413b2a4",
	x"1aa7c197",
	x"22b74674",
	x"0f41619a",
	x"36472de2",
	x"0128d241",
	x"326d8bef",
	x"30645614",
	x"2f0d7ad1",
	x"0802b885",
	x"241c7d29",
	x"18b8c8ab",
	x"099ece2b",
	x"08b52ae7",
	x"15bdc0d4"
	);

constant INPUTS_3 : vector32_t(0 to 63) := (
	x"00000000",
	x"00000000",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"ffffffff",
	x"ffffffff",
	x"1285b19d",
	x"0305de18",
	x"0d216cde",
	x"28bcf212",
	x"1715a119",
	x"0f5fb833",
	x"1ecb54cd",
	x"0b38d673",
	x"21f62539",
	x"071bd784",
	x"1e18920b",
	x"093fd3fb",
	x"0c33f00e",
	x"1c397a86",
	x"218f32de",
	x"2614271b",
	x"2fa03d94",
	x"178cb923",
	x"1d18ea7a",
	x"3d6a58b2",
	x"120d79b9",
	x"1df9dab2",
	x"11419706",
	x"2ca77414",
	x"188fa65a",
	x"3db86bfe",
	x"02758798",
	x"0423fd02",
	x"02bd0144",
	x"03901542",
	x"38450233",
	x"0069a5ac",
	x"2dedea35",
	x"181cb025",
	x"04a189cd",
	x"0b7344b6",
	x"207d08db",
	x"250a9dc2",
	x"131ce44e",
	x"05ef8b30",
	x"1d0632d4",
	x"0258dca1",
	x"002ee088",
	x"187dfa9c",
	x"3da791ab",
	x"2b96debe",
	x"386bdc44",
	x"0cf11aea",
	x"174288e0",
	x"3d291f80",
	x"1fcf0a36",
	x"2f8b707e",
	x"24b85bdf",
	x"3984f9c1",
	x"00f3f802",
	x"3843b228"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"ffffffff",
	x"1285b4bc",
	x"0305d625",
	x"0ea148d4",
	x"20b4f217",
	x"3351a72b",
	x"2dffbab6",
	x"3a881d7d",
	x"1ba8d013",
	x"3e56a7bb",
	x"071fcd06",
	x"1edad68b",
	x"19dac7f7",
	x"05b5f88a",
	x"1c0878d6",
	x"200abad3",
	x"1636063b",
	x"23ad3895",
	x"378cb323",
	x"1558ea1a",
	x"354b5cbf",
	x"179ab9f9",
	x"0cd8dfb2",
	x"0d451396",
	x"2cbf7698",
	x"1a97a658",
	x"34493aef",
	x"28158b1c",
	x"1220f974",
	x"02bd09c5",
	x"01913343",
	x"1b471236",
	x"045be6a6",
	x"2dec4f95",
	x"181eb106",
	x"1415a9c5",
	x"0b1366a6",
	x"28f761f9",
	x"21ca9fc2",
	x"2501344f",
	x"09bf8170",
	x"1dc860f4",
	x"0058bea1",
	x"02a7e186",
	x"303ffa74",
	x"1dc5f18a",
	x"3757bcfa",
	x"0868d045",
	x"2a650bef",
	x"33441ce0",
	x"3f293a90",
	x"0d43a804",
	x"2f8b7d7d",
	x"04b8c8ab",
	x"1986dc41",
	x"08f3eae3",
	x"31e1a248"
	);

  signal input_1  : std_logic_vector(31 downto 0);
  signal input_2  : std_logic_vector(31 downto 0);
  signal input_3  : std_logic_vector(31 downto 0);
  signal output     : std_logic_vector(31 downto 0);

begin

  MAJ_MODULE: entity work.maj
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

end maj_tb;

