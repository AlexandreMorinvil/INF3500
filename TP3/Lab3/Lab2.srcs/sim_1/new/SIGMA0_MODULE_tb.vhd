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
	x"1f8bff8c",
	x"206e9af1",
	x"3cc9a09a",
	x"1cc291bf",
	x"169221bd",
	x"16c10ac9",
	x"06af242c",
	x"07df266f",
	x"2e166cce",
	x"1309fe5d",
	x"13e87c30",
	x"2bb6fcf9",
	x"1513a16f",
	x"129507d7",
	x"1695782c",
	x"29e16d21",
	x"0c5dc17d",
	x"03568412",
	x"06cf07d8",
	x"29bff05c",
	x"18e1fe09",
	x"082c789c",
	x"08e7891d",
	x"30be5fcb",
	x"1de96553",
	x"252031ad",
	x"3bacd610",
	x"2292f242",
	x"1f55d0c9",
	x"13a3a034",
	x"2ea692f9",
	x"297bfa46",
	x"2be3130c",
	x"3ed377ca",
	x"00543c52",
	x"0683e409",
	x"2f6765eb",
	x"27b70cba",
	x"2471f4bf",
	x"09bd736f",
	x"2d129866",
	x"317d7202",
	x"1234931a",
	x"3286420c",
	x"21aefcab",
	x"15c2574d",
	x"1a8af069",
	x"37c77d22",
	x"0de1161a",
	x"00caa6f4",
	x"265e75e5",
	x"3830e3a6",
	x"28660744",
	x"15c36406",
	x"1cd1eaf4",
	x"127e843c",
	x"3855bfe7",
	x"1b06c83c",
	x"3182832f",
	x"25b63b36",
	x"1763eaf2",
	x"0e562202"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"d47c33c2",
	x"25f96149",
	x"ad61e698",
	x"408ebe08",
	x"00cac8a4",
	x"17d3d0e1",
	x"9c5b4c68",
	x"8e164b7d",
	x"b447d338",
	x"91d39394",
	x"448a4000",
	x"76d70627",
	x"80b9fc92",
	x"ae028917",
	x"91255afa",
	x"a6c590e4",
	x"3ffae680",
	x"fa55f3bd",
	x"036c9795",
	x"774fc14e",
	x"31889cee",
	x"77092f64",
	x"94f5d158",
	x"cb093ec2",
	x"4877fa68",
	x"44e791fe",
	x"0d32a80c",
	x"517ca08d",
	x"96deaae1",
	x"8bc8a55e",
	x"462b3530",
	x"b786adeb",
	x"1ed5ab74",
	x"7c3a0392",
	x"327445b4",
	x"6e78e907",
	x"79170efc",
	x"300e1608",
	x"ab37a231",
	x"acdaad16",
	x"02145639",
	x"e986dfae",
	x"ce11dd2a",
	x"05c8347b",
	x"96c01edb",
	x"f6450f96",
	x"ee2bcc27",
	x"7914e9ac",
	x"b7f042b9",
	x"1d097feb",
	x"9f693b13",
	x"50b3618e",
	x"a825d240",
	x"a8d06f4d",
	x"173f4c41",
	x"df6fc2b2",
	x"67d331b5",
	x"5c019a55",
	x"df159019",
	x"88307bea",
	x"5de389fe",
	x"cb0df208"
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

