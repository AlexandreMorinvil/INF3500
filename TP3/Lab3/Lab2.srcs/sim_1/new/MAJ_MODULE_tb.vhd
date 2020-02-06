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
	x"0eb974ca",
	x"1259efd1",
	x"112e85ce",
	x"39950a76",
	x"2ce5ff07",
	x"27457e29",
	x"269a82b9",
	x"0dbec0d8",
	x"099383b3",
	x"0b599550",
	x"263960c2",
	x"2d930236",
	x"3e47131c",
	x"0ed0f3ed",
	x"209ddfd0",
	x"20c2798f",
	x"16b37c3b",
	x"15620cd7",
	x"25a69574",
	x"3896d514",
	x"04f1aabc",
	x"2c7a5515",
	x"0cbaaaf1",
	x"1a34f422",
	x"3dc644fb",
	x"098451e0",
	x"250adb3d",
	x"30d9d54b",
	x"3ce00a04",
	x"3021669f",
	x"0dd430f9",
	x"081ec44c",
	x"3118ef90",
	x"007062e9",
	x"369b047a",
	x"0e344818",
	x"10b1800e",
	x"2d46d085",
	x"076fb9c3",
	x"3e2750cb",
	x"1596f898",
	x"1a77016b",
	x"312abe87",
	x"321da5b7",
	x"21a026f9",
	x"230b5dc3",
	x"25b0c82b",
	x"1d989359",
	x"0acd87ac",
	x"078971e4",
	x"382ed1c1",
	x"2fb05962",
	x"0f89a3dd",
	x"042fbc56",
	x"255cda0d",
	x"1d59d8b3"
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
	x"32e8af68",
	x"0f373bd0",
	x"03bce183",
	x"13a38158",
	x"00ea66da",
	x"3f12bd3a",
	x"1bd8a846",
	x"11f48094",
	x"3ab52d6b",
	x"18b0e9ab",
	x"28872c29",
	x"2c4f2ed5",
	x"2addeb09",
	x"05b7946a",
	x"3f27e6b0",
	x"35903dba",
	x"21a02a4f",
	x"32c748f0",
	x"1fe3cb0f",
	x"11ae2611",
	x"19227687",
	x"15bc98e4",
	x"2def8428",
	x"2ff6d5de",
	x"01b579b0",
	x"1bebaa1c",
	x"0fc6f292",
	x"2d561e4d",
	x"3612da72",
	x"006304a2",
	x"37736a8c",
	x"1e8f61bf",
	x"17a0da29",
	x"0a2d20ab",
	x"12c5b20c",
	x"028181c1",
	x"12ad32e2",
	x"328b34a0",
	x"2398beb5",
	x"1c638d16",
	x"0ab03558",
	x"333c4318",
	x"001333db",
	x"3607adac",
	x"2e8c26f7",
	x"3cb668db",
	x"3ae3a080",
	x"0a1ad6a3",
	x"34cedfd9",
	x"146a6ae1",
	x"3384fd59",
	x"16623248",
	x"3feda8ca",
	x"1b040450",
	x"0e796ac9",
	x"15fe501e"
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
	x"2a8a5946",
	x"3aa7f47f",
	x"158f2ee4",
	x"23a892d2",
	x"3bae3578",
	x"3d354cf8",
	x"001df36d",
	x"03f65e45",
	x"030e8c3d",
	x"0a84ff71",
	x"2345c3d8",
	x"17940586",
	x"1d4a151d",
	x"0eaaabd1",
	x"0a34cb48",
	x"358af8d4",
	x"20288e58",
	x"0832ae31",
	x"365e5290",
	x"2d7c339f",
	x"2edc9ad7",
	x"3e63ecd7",
	x"07c37e34",
	x"31e56a86",
	x"36436035",
	x"1f80663c",
	x"0d2dcc66",
	x"2a5af95a",
	x"112364bf",
	x"07027f06",
	x"3c6ed30d",
	x"2dce1118",
	x"146dad6f",
	x"2bdf900d",
	x"12a6bdba",
	x"24c825f2",
	x"037b9bf2",
	x"36c63459",
	x"1c7b0bb2",
	x"13ad1d46",
	x"2c520ca3",
	x"0060d721",
	x"265e8de6",
	x"0cfbbba4",
	x"2bdfb48d",
	x"379001ce",
	x"14cc24fd",
	x"0b8b52cc",
	x"1a3e3f6b",
	x"2fb2e9f5",
	x"2489bf47",
	x"34cdafad",
	x"1eeeadaa",
	x"16e0bf5e",
	x"12e716ca",
	x"0310c866"
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
	x"2aa87d4a",
	x"1a37ffd1",
	x"11aea5c6",
	x"33a18252",
	x"28ee775a",
	x"3f157c38",
	x"0298a26d",
	x"01f6c0d4",
	x"0b978d3b",
	x"0a90fd71",
	x"220560c8",
	x"2d970696",
	x"3e4f131d",
	x"0eb2b3e9",
	x"2a35cfd0",
	x"3582799e",
	x"20a02e5b",
	x"10620cf1",
	x"37e6d314",
	x"39be3715",
	x"0cf0ba97",
	x"3c7adcd5",
	x"0debae30",
	x"3bf4f486",
	x"35c760b1",
	x"1b80623c",
	x"0d0eda36",
	x"285add4b",
	x"34224a36",
	x"00236686",
	x"3d76728d",
	x"0c8e411c",
	x"1528ef29",
	x"0a7d20a9",
	x"1287b43a",
	x"068001d0",
	x"12b992e2",
	x"36c63481",
	x"077bbbb3",
	x"1e271d46",
	x"0c923c98",
	x"12744329",
	x"201abfc7",
	x"361fada4",
	x"2b8c26fd",
	x"379249cb",
	x"34e0a0a9",
	x"0b9ad2c9",
	x"1ace9fe9",
	x"07aa69e5",
	x"308cfd41",
	x"36e03b68",
	x"1feda9ca",
	x"1624bc56",
	x"067d5ac9",
	x"1558d836"
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

