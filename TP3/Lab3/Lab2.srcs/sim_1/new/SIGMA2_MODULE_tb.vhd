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
	x"029b24bd",
	x"06a1a871",
	x"18373219",
	x"150981ce",
	x"03a54cc0",
	x"06450733",
	x"029b8aca",
	x"1a555adf",
	x"0e3ed7e9",
	x"150ab9a8",
	x"16e76721",
	x"281a7a2a",
	x"0f102b75",
	x"255d4af8",
	x"3f5c0795",
	x"03255fcf",
	x"3dc46491",
	x"1cba3dbe",
	x"01de5f89",
	x"38f25660",
	x"30473e5b",
	x"00ef2204",
	x"1730db55",
	x"30f2e8df",
	x"3606b7e2",
	x"2d5deb40",
	x"0a3d663c",
	x"05c798be",
	x"3b347a21",
	x"10388661",
	x"1f4b3077",
	x"2684d3dc",
	x"34017e06",
	x"2fc42fbc",
	x"03473527",
	x"3fefaa8e",
	x"0fe27270",
	x"3798891b",
	x"02fd8066",
	x"2dc14593",
	x"34cde22b",
	x"0ddcefba",
	x"0a5eb536",
	x"33e29c1d",
	x"027b99f7",
	x"308d1240",
	x"2bbad38e",
	x"3fafe9ce",
	x"1da64e7d",
	x"1ab5c6c8",
	x"2f05be54",
	x"313664b7",
	x"034a825f",
	x"31b4a0da",
	x"2915815c",
	x"2c75b35a",
	x"23e62c28",
	x"3a7c4771",
	x"1ae0576d",
	x"32a0a2a8",
	x"06b99c56",
	x"16ce8af7"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"1fffffff",
	x"b3791278",
	x"88c537f6",
	x"fdb0ce2a",
	x"fef8a678",
	x"d343e3e8",
	x"2708eb79",
	x"76e4c6ea",
	x"ebc9c77b",
	x"6621e4dd",
	x"fce14704",
	x"99396793",
	x"cfd9f1b7",
	x"e12166fc",
	x"a65f1a9d",
	x"2c70772a",
	x"c991218f",
	x"3ce74b2a",
	x"f0c1b4e2",
	x"85da3739",
	x"52f7a05c",
	x"7ffea5a6",
	x"c09d3a3f",
	x"9e1d3f10",
	x"024874f6",
	x"6f545612",
	x"ff210de9",
	x"20dcd484",
	x"9a9cfd57",
	x"5b98a97d",
	x"e1bf25ce",
	x"21ca37bc",
	x"886a9a7d",
	x"5569a03c",
	x"76480659",
	x"8327a81f",
	x"f121a5ff",
	x"7d7f8952",
	x"12daedd7",
	x"ac43cbb3",
	x"72876149",
	x"287aeab2",
	x"4e4ea75f",
	x"c012e95b",
	x"9b1cda43",
	x"08364493",
	x"c2e0b44f",
	x"adc3a538",
	x"61f92d01",
	x"6a10c23a",
	x"e2d1d5f9",
	x"c22bb777",
	x"f1696c12",
	x"1ef8059d",
	x"9a637137",
	x"dd27916c",
	x"dd00d610",
	x"df310124",
	x"f4e73eff",
	x"ccb28cfb",
	x"7e9b59b8",
	x"cbcfc11c",
	x"4e4989f8"
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

