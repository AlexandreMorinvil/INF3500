-------------------------------------------------------------------------------
-- sigma0.vhd: Banc de teste du module sigma0.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sigma2_tb is
end sigma2_tb;

architecture sigma2_tb of sigma2_tb is

  type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);

constant INPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"1f15c197",
	x"3afec27b",
	x"1f748ac3",
	x"3c0a4de5",
	x"20abcd6f",
	x"2de45d46",
	x"33e225f9",
	x"1a33f577",
	x"19c37195",
	x"3f521ac0",
	x"3e420039",
	x"3a1d1240",
	x"00fbe18b",
	x"21699665",
	x"3c37bcd9",
	x"1513ee54",
	x"1c8e2401",
	x"22b45860",
	x"3b22d163",
	x"01efb776",
	x"0c8f40d5",
	x"0a67738e",
	x"165c938e",
	x"2550fd19",
	x"3d2caf16",
	x"1ca16378",
	x"1d78073f",
	x"09e46e62",
	x"00ef8306",
	x"06ab2a5b",
	x"22816c90",
	x"209ed824",
	x"12f8dc12",
	x"3335af23",
	x"30410dc7",
	x"2900e2e0",
	x"014612da",
	x"06a05b6a",
	x"28774d5c",
	x"015390cd",
	x"3eeb272f",
	x"032f797d",
	x"0a1f73f7",
	x"1ee9fbcd",
	x"1e59ee0f",
	x"1553d257",
	x"1fae3e70",
	x"2e625372",
	x"339bffa9",
	x"07e88ba2",
	x"15532bcd",
	x"1be41b03",
	x"1e94e55e",
	x"2071c5bc",
	x"37368b46",
	x"03602771",
	x"3d4287be",
	x"235ef9ae",
	x"17bcca43",
	x"08d35d5f",
	x"05fedc87",
	x"00479737"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"1fffffff",
	x"5db95474",
	x"41b4eb74",
	x"a760bf90",
	x"5e801225",
	x"290fe61d",
	x"9eb6c86b",
	x"7d65cc0c",
	x"102fdfc8",
	x"f56eaea1",
	x"0124e8b9",
	x"f5ba8b97",
	x"c3a796eb",
	x"ee7c4bcc",
	x"abf6a9ba",
	x"5ac8d7ef",
	x"511d5f52",
	x"88a89feb",
	x"d20beb11",
	x"754ad146",
	x"01e3a9fb",
	x"7bbdb5b8",
	x"c1bba20f",
	x"3a04aec1",
	x"09a6f70d",
	x"001a43f7",
	x"ab736981",
	x"7c5a37b7",
	x"deb7c769",
	x"ecddaf5d",
	x"7c4ef2b5",
	x"7f3127eb",
	x"fa5bee93",
	x"117e6e84",
	x"2bc81277",
	x"cb196fb3",
	x"fdca17d9",
	x"309cce2f",
	x"c203ca73",
	x"6e090d2c",
	x"7e1b956c",
	x"906b7d11",
	x"243cf116",
	x"33aa121e",
	x"e713ab34",
	x"6674498b",
	x"581518ba",
	x"6c569c59",
	x"754c0550",
	x"abfe04ec",
	x"661a4199",
	x"5273867a",
	x"038b8daf",
	x"86b832c4",
	x"0d21d320",
	x"285931b3",
	x"ebb68478",
	x"da3d5aa8",
	x"e646ea11",
	x"b6482533",
	x"685c0f25",
	x"b995e756",
	x"8bc5bdd9"
	);



  signal input  : std_logic_vector(31 downto 0);
  signal output : std_logic_vector(31 downto 0);

begin

  SIGMA2_MODULE: entity work.sigma2
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

end sigma2_tb;

