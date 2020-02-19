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
	x"3f6cd60e",
	x"2b88aa36",
	x"3bbb6a30",
	x"3da7af08",
	x"2d92de18",
	x"076fab0c",
	x"00f625c1",
	x"38c91383",
	x"276dcded",
	x"245b34d1",
	x"041dab9b",
	x"1c275d6c",
	x"3d715e74",
	x"20d173ce",
	x"36721640",
	x"357e6761",
	x"11b90b4d",
	x"0a556c77",
	x"3ffd99e5",
	x"0fa47332",
	x"3c4bf0c0",
	x"23a0c976",
	x"37d3426d",
	x"2cc957de",
	x"175a69ca",
	x"12e8e9a4",
	x"0450f16c",
	x"28b76f96",
	x"337eee16",
	x"381d2e05",
	x"235d1c25",
	x"031345b7",
	x"33fe3001",
	x"2b2687d3",
	x"1aaa498b",
	x"119a04d2",
	x"13077a94",
	x"22274675",
	x"0ff45042",
	x"1a6424a7",
	x"0df2cf8b",
	x"3fbda581",
	x"093fd49e",
	x"16235825",
	x"39814554",
	x"09409ac0",
	x"151c86a2",
	x"1a643b6c",
	x"3e21a508",
	x"0500642a",
	x"1ae4a001",
	x"2bcc41ca",
	x"3c294874",
	x"008855e5",
	x"12fb2220",
	x"385c63c0",
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
	x"1819b812",
	x"3edd6849",
	x"270dd411",
	x"39ad8cfd",
	x"2edc090f",
	x"0ebf85dd",
	x"3a548099",
	x"3f34ca60",
	x"3205fb46",
	x"08e6995b",
	x"19d07429",
	x"208037f9",
	x"2c15d741",
	x"36465ba7",
	x"148dbae6",
	x"17772f07",
	x"2cb40c3e",
	x"1e4be1db",
	x"3be01ea5",
	x"029c33fa",
	x"1cf38e26",
	x"3d1deb3e",
	x"0baa64e7",
	x"0f4aa472",
	x"3b8ff397",
	x"21dd6f47",
	x"3a924ce1",
	x"0bf9253e",
	x"013153db",
	x"34e66b9d",
	x"324e4d76",
	x"2277d05d",
	x"2ca5e4ee",
	x"260c7219",
	x"2fdb133a",
	x"3a30a2fe",
	x"372ad97b",
	x"02e076c1",
	x"0bc03e6f",
	x"02682b83",
	x"30a37edd",
	x"34e95dcd",
	x"2a4e610a",
	x"247af77a",
	x"03de1b22",
	x"27ebc9a5",
	x"13e2bcae",
	x"1e2341a1",
	x"22d38b03",
	x"1824a8e0",
	x"352140af",
	x"03b15fea",
	x"1ae71fec",
	x"088a0447",
	x"073b480f",
	x"2a517173",
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
	x"11243df9",
	x"210e0cce",
	x"20289783",
	x"3a4a4c8c",
	x"268139f6",
	x"34dae9a1",
	x"2aed9b6f",
	x"293c2cb5",
	x"0420f75c",
	x"30964614",
	x"07d865e4",
	x"1c60a09c",
	x"0f8b465a",
	x"309f1faf",
	x"14beeca8",
	x"32cab822",
	x"06f601c9",
	x"3f4ed42b",
	x"1d44072e",
	x"37aaf255",
	x"057fed36",
	x"3b37ef6e",
	x"33132c98",
	x"3c876b76",
	x"2f70d2da",
	x"25673991",
	x"2e21f1bc",
	x"1b82caf4",
	x"067c61a4",
	x"17a484db",
	x"14efc71b",
	x"2198f16f",
	x"25fd4b2e",
	x"22b03bc2",
	x"2cc5f6e9",
	x"20e066b6",
	x"273c21c3",
	x"14862ef0",
	x"31f7e30b",
	x"2ac907c7",
	x"2da8765e",
	x"269b2339",
	x"38240313",
	x"325c74d4",
	x"1b1d36ac",
	x"141d9fa8",
	x"32712245",
	x"167f3f3c",
	x"2c1e4b07",
	x"1836fb74",
	x"23d15d95",
	x"142f578d",
	x"3c1af47c",
	x"144aac03",
	x"373fe1a6",
	x"20c4bb87",
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
	x"1808b9f3",
	x"2a8e2cc8",
	x"2309d593",
	x"3bedcc8c",
	x"2e9129ee",
	x"36bfc1ad",
	x"2a5d9aaf",
	x"39342e34",
	x"2205fb54",
	x"10c65255",
	x"03d0646d",
	x"0040b5f8",
	x"2e9b564a",
	x"304e5fa7",
	x"148cfae8",
	x"17f6bf03",
	x"06f6088c",
	x"3f4bf05b",
	x"3be01eaf",
	x"328eb377",
	x"1d778d36",
	x"3917ef3e",
	x"03826cf5",
	x"1c4e2c72",
	x"3b2af392",
	x"25cf7915",
	x"2a3140f0",
	x"1bb1a576",
	x"053043b2",
	x"37a4aadf",
	x"36eecf3e",
	x"229bf05d",
	x"24a56b2e",
	x"22943a11",
	x"2ecfb76a",
	x"307062f6",
	x"373a5953",
	x"16a06ec1",
	x"3bc3b34b",
	x"22e923c3",
	x"20aa7edd",
	x"34ab07b9",
	x"380e430b",
	x"247e74f0",
	x"039c33a8",
	x"155d8da8",
	x"3361a4e7",
	x"1e3b0530",
	x"221fcb07",
	x"1836bb74",
	x"31315d95",
	x"17a357cf",
	x"1833bc6c",
	x"14caac47",
	x"273fc186",
	x"28d0f947",
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

