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
	x"178e566f",
	x"258829f2",
	x"24718bae",
	x"33200cba",
	x"13cfb10b",
	x"3d22d7eb",
	x"21adf431",
	x"164a720a",
	x"21a1174a",
	x"32611213",
	x"05d788b1",
	x"359c14a7",
	x"3944619d",
	x"30167041",
	x"06e8fbd5",
	x"0f6a7862",
	x"283dce60",
	x"306a1fc1",
	x"34bf4133",
	x"1afce97d",
	x"0c9527e0",
	x"1215b94b",
	x"385a934e",
	x"01ce32a9",
	x"1810aa5c",
	x"35a25709",
	x"1b1d399c",
	x"20c99307",
	x"1b7c29ff",
	x"22ae6a95",
	x"16078e85",
	x"118c742b",
	x"19e278ea",
	x"3527d2f8",
	x"2900c55d",
	x"3ba76013",
	x"23d38d28",
	x"129032ab",
	x"3a107068",
	x"2ddbb734",
	x"3a9ee6b7",
	x"27390598",
	x"3c9f46dd",
	x"3f5da66c",
	x"3b96b584",
	x"2b87f719",
	x"20b92ae2",
	x"39135d0f",
	x"13503f6e",
	x"313477f6",
	x"0a49ef8c",
	x"06d382de",
	x"38e08641",
	x"3885946b",
	x"1062dee0",
	x"30a86e0a"
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
	x"311fadbc",
	x"0d988a1f",
	x"04737fd4",
	x"1c0e9934",
	x"19ea218b",
	x"2d981e2c",
	x"01901c4e",
	x"1532596f",
	x"3d59fb4c",
	x"3403b31d",
	x"03ae0722",
	x"2034d43c",
	x"2d0ea88c",
	x"0fec9eea",
	x"06e4a216",
	x"1267b58c",
	x"2567d0ca",
	x"013540fd",
	x"2eac23e1",
	x"338da5c1",
	x"38c8fb72",
	x"1dd1d830",
	x"35219e26",
	x"271e7fab",
	x"02d575e3",
	x"1f0a98cb",
	x"2241437d",
	x"1d7fc68e",
	x"23b2f969",
	x"36b70289",
	x"0b2aed6a",
	x"0d4ddc19",
	x"034b1142",
	x"2c827693",
	x"195ee263",
	x"34917670",
	x"1c87c09c",
	x"032a0d82",
	x"1a01dbcd",
	x"220ad622",
	x"10946894",
	x"25bc2d61",
	x"15184bff",
	x"06693c33",
	x"02216e37",
	x"1cd95fa8",
	x"2cc9643c",
	x"0d8da013",
	x"389c2084",
	x"0bf56741",
	x"049f5abb",
	x"3fcc25a3",
	x"0b7a5e67",
	x"36939685",
	x"30c3f0a2",
	x"2b2b5337"
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
	x"156cfcbf",
	x"0d8c653f",
	x"2d45b805",
	x"14a3078d",
	x"2facec57",
	x"044846a6",
	x"1d5499eb",
	x"315bafd8",
	x"35309ff0",
	x"2e00bf66",
	x"12801c49",
	x"27f2bdba",
	x"0df43235",
	x"2303bb98",
	x"1bfc6804",
	x"19b4dd46",
	x"0232cbc3",
	x"2defa4c4",
	x"1ddf8ef1",
	x"33e26afa",
	x"15aac929",
	x"00f6b7e5",
	x"305f91d8",
	x"08ed29ca",
	x"2adc20e6",
	x"33191b63",
	x"0716a66c",
	x"31b83916",
	x"2e4a0964",
	x"056e351a",
	x"203fbd54",
	x"36dacab0",
	x"09b8df02",
	x"305ac051",
	x"3bf7c824",
	x"01dc18da",
	x"1f6d4a0e",
	x"38d8a3c3",
	x"1b7f3f63",
	x"16751c46",
	x"0d7224c5",
	x"0db30799",
	x"08766886",
	x"13d20215",
	x"38cf2155",
	x"2cc5ab6c",
	x"24205bf1",
	x"3dd161d7",
	x"20d32fda",
	x"10407c46",
	x"3ea3cafb",
	x"0e42b38f",
	x"3a4aa463",
	x"23e36aa1",
	x"364705eb",
	x"0e2705af"
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
	x"116eacbc",
	x"0d8c4c1f",
	x"0d753b85",
	x"14830b35",
	x"3dea6d5f",
	x"2d48162c",
	x"1dd01dca",
	x"3513ddda",
	x"35119bf8",
	x"3c01bf75",
	x"13861468",
	x"2276bd3c",
	x"2db432ac",
	x"03059bd8",
	x"1ff4a214",
	x"12f6b504",
	x"2227c1c3",
	x"0da5a0c5",
	x"2dec8fe1",
	x"338ea3c3",
	x"19aaeb69",
	x"10f39ea4",
	x"30059296",
	x"092f3beb",
	x"22dc20e2",
	x"171b186b",
	x"0603877c",
	x"1179aa16",
	x"27322969",
	x"27e6178b",
	x"223abd50",
	x"275ede99",
	x"015a9742",
	x"245a5291",
	x"1bf7c861",
	x"30d978d8",
	x"1cafc20e",
	x"2a4881c2",
	x"1b6f5f4b",
	x"322e9e62",
	x"15f460d4",
	x"2dba0701",
	x"14786adf",
	x"06cb2431",
	x"02492455",
	x"0cc15f6c",
	x"24897131",
	x"0dc120d3",
	x"30932094",
	x"01746f40",
	x"34ab4afb",
	x"0ec03183",
	x"0a6a2663",
	x"33e3fe81",
	x"3647d1ab",
	x"2e2f43a7"
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

