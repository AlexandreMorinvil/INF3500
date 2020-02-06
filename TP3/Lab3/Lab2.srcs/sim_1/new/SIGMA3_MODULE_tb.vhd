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
	x"1dc1825b",
	x"1881af23",
	x"09b9d4a8",
	x"262ee2be",
	x"3adc4756",
	x"0f3bdabe",
	x"1e400a42",
	x"3fc09363",
	x"099eb52b",
	x"0a9ae7e5",
	x"3077aea3",
	x"179530ed",
	x"13d3be01",
	x"214265fb",
	x"3ea1384c",
	x"246b31db",
	x"00bf3831",
	x"0320ea13",
	x"3a9650ed",
	x"3d6dd957",
	x"2b612c41",
	x"01ac4cf2",
	x"140b8363",
	x"3671d53d",
	x"20b362ea",
	x"0027290b",
	x"2ace29c0",
	x"24359c19",
	x"05e7b313",
	x"0bdd1880",
	x"29069b41",
	x"08a20b25",
	x"26ab8fd2",
	x"1c633326",
	x"05769a59",
	x"2708c44d",
	x"2b66566f",
	x"3bd94c7f",
	x"2dbb02a3",
	x"00684c2d",
	x"37785c64",
	x"172971c0",
	x"188936f3",
	x"37a46811",
	x"2f7dbd55",
	x"3645a7ce",
	x"3ff14f45",
	x"1dd03bf3",
	x"278ae91d",
	x"1c6de938",
	x"039e06cb",
	x"2665287f",
	x"396e71c1",
	x"1067e445",
	x"331269e3",
	x"0387e911",
	x"02f29979",
	x"0cc578e8",
	x"3fed441d",
	x"2a45f1b6",
	x"0c19a0ac",
	x"182276c3"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"003fffff",
	x"5c3b15d1",
	x"b98045c7",
	x"9ab18810",
	x"24c6f4f7",
	x"d00f0157",
	x"8368e07b",
	x"0936d3e3",
	x"9e9c9591",
	x"7a817c4a",
	x"c8d46c75",
	x"7919a55f",
	x"1246137d",
	x"738b986d",
	x"a0323d26",
	x"17fcab7b",
	x"0aa3d286",
	x"2304f339",
	x"514e2bf6",
	x"7ef95b85",
	x"e7d00bbe",
	x"212f7996",
	x"41989a15",
	x"fc394e6c",
	x"ce73fdef",
	x"c4d7a545",
	x"c921f56a",
	x"c5998e74",
	x"d71aff91",
	x"ba74879c",
	x"a33d825f",
	x"d7c67eeb",
	x"d54401ba",
	x"39694009",
	x"fe12578c",
	x"b75fa761",
	x"2c1c45c1",
	x"766aa5a0",
	x"d56e7419",
	x"ece9e77d",
	x"bd841b2e",
	x"9b5cb989",
	x"2e616d7e",
	x"eaba6587",
	x"c9d15e4e",
	x"e31c8c75",
	x"8c2d413e",
	x"3d189e90",
	x"cb0e575b",
	x"29b46def",
	x"5d51af53",
	x"ecd7ffe9",
	x"599fe927",
	x"cad3c576",
	x"e8cd2464",
	x"c1fceb5f",
	x"b92cde2e",
	x"b724569d",
	x"0f2d2525",
	x"dc73e9bc",
	x"669543f2",
	x"8426e169",
	x"42bee242"
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

