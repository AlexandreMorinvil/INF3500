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
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"0a779ce5",
	x"0030ac16",
	x"055480fd",
	x"16930891",
	x"02bc8250",
	x"312269c1",
	x"0568d863",
	x"207382c9",
	x"1b2d8ae1",
	x"1e113029",
	x"2f74adcb",
	x"02c3156e",
	x"03d86caa",
	x"13f901ea",
	x"38d814be",
	x"2255cc58",
	x"30bb4e2d",
	x"1358d593",
	x"3683b435",
	x"1024e248",
	x"330a7c5b",
	x"336ffba1",
	x"1a39dc9a",
	x"308886f7",
	x"1a686095",
	x"0d824481",
	x"37cfddc7",
	x"2a7c6508",
	x"1e2ab6af",
	x"3011e692",
	x"126c1d05",
	x"1edd6813",
	x"0e9982e8",
	x"1a272420",
	x"31c6eb0d",
	x"27ab429c",
	x"0e2f47f2",
	x"3e88b16a",
	x"3f6c1a09",
	x"1f47341a",
	x"12d67cee",
	x"0f025a9d",
	x"2bf85393",
	x"2fb48ef0",
	x"2f2dc36f",
	x"0f9f69d4",
	x"1c5aaeb3",
	x"29d7fe76",
	x"23c4dd76",
	x"31ee4d20",
	x"1f1285e5",
	x"24ba0cef",
	x"385de374",
	x"383ffc7d",
	x"29740d10",
	x"24c2e992"
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
	x"1d2c3a4b",
	x"20e69fd9",
	x"1ce3a78f",
	x"0afe6e85",
	x"1415c94c",
	x"1975f510",
	x"1417fe2a",
	x"0c5a66dd",
	x"21f1f039",
	x"3a0475f1",
	x"3859d51c",
	x"30e494a0",
	x"07cbbd42",
	x"086abe3a",
	x"1ec4a20e",
	x"1b0ff6c1",
	x"041de30b",
	x"0382b197",
	x"2d84621a",
	x"16ef4f28",
	x"1c15eea4",
	x"3668e1a5",
	x"0918afc8",
	x"3176e8ab",
	x"2cd43d8f",
	x"13bbb3f5",
	x"09919913",
	x"17bf9d0e",
	x"04abb3bd",
	x"18dbc800",
	x"37d1b565",
	x"3e419b06",
	x"045eb18f",
	x"392a1d36",
	x"12cf7b95",
	x"10196c3a",
	x"086349d7",
	x"114cf8f5",
	x"1ccfd7ef",
	x"26433b3e",
	x"1a2137d8",
	x"22690c89",
	x"30ad022a",
	x"06df5999",
	x"29321543",
	x"15675b30",
	x"1f109373",
	x"2c6d85c0",
	x"0ca2d037",
	x"06326018",
	x"13b7dc61",
	x"15127118",
	x"0c306148",
	x"16f5745e",
	x"02b27afd",
	x"19d305f7"
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
	x"318a4176",
	x"0b5ff510",
	x"1da030c2",
	x"0dd66da3",
	x"2193a033",
	x"2be1a92a",
	x"10f3f899",
	x"25a65650",
	x"3d9e5962",
	x"30ed679b",
	x"09335cdb",
	x"266df924",
	x"0cb22b53",
	x"3636fd41",
	x"00340d52",
	x"1d39e036",
	x"2cc52cc8",
	x"35f452e8",
	x"125fb539",
	x"1e3a6c8a",
	x"0c0302f1",
	x"0c1f534e",
	x"1bf11136",
	x"0c009c16",
	x"2a05d771",
	x"01b09121",
	x"1e33c566",
	x"26bf8fbe",
	x"211c8e5a",
	x"1fe52cfe",
	x"2cc8f34f",
	x"238c515a",
	x"37863c2c",
	x"0b7b7b72",
	x"22df0fef",
	x"0b9ed9af",
	x"38b4dbda",
	x"27f36afb",
	x"207a79ab",
	x"238fd671",
	x"168d44c4",
	x"02cfaa08",
	x"0fafce5f",
	x"1a9b3047",
	x"12a360bd",
	x"06d40cf4",
	x"31e48155",
	x"01de50c5",
	x"2f802205",
	x"3747340e",
	x"3512b144",
	x"0b972872",
	x"29ddb94f",
	x"3331f193",
	x"11053e59",
	x"126874c2"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"00000000",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"00000000",
	x"ffffffff",
	x"ffffffff",
	x"39ac5953",
	x"0b6fdd10",
	x"1ce0b08f",
	x"0bd66da3",
	x"2117a063",
	x"1be1e12a",
	x"1493f8ba",
	x"05d656d9",
	x"25b3d123",
	x"3aec77b3",
	x"2853d518",
	x"24ecfc20",
	x"0fea2f53",
	x"246efc2b",
	x"18e4094e",
	x"1f2de466",
	x"0c5d62c9",
	x"27a493fb",
	x"24dc2118",
	x"1e3e4e8a",
	x"1c016ea0",
	x"3e78e1ef",
	x"09d88dac",
	x"3c0098a3",
	x"2845b7e5",
	x"01b291a1",
	x"09b19923",
	x"06bf8fbe",
	x"253ebafd",
	x"1ff5c86c",
	x"3ec0f74f",
	x"3f41194a",
	x"351ebc8c",
	x"197a5f72",
	x"12df6fe7",
	x"081dd93b",
	x"38b3d9da",
	x"117bfaf1",
	x"1c5e73ab",
	x"26cbf27b",
	x"160934c8",
	x"02cda889",
	x"24af8e4e",
	x"169f3897",
	x"39a221d3",
	x"05474d30",
	x"3db48377",
	x"284d84c1",
	x"0c80f237",
	x"0623700e",
	x"3312b461",
	x"0f172018",
	x"0990794b",
	x"133575de",
	x"10313a59",
	x"12ea15d2"
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

