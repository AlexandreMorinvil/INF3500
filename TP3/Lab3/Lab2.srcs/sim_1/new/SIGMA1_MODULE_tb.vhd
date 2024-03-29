-------------------------------------------------------------------------------
-- sigma0.vhd: Banc de teste du module sigma0.
-- Alexandre Morinvil 1897222
-- Nicolas Valenchon 2032097
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sigma1_tb is
end sigma1_tb;

architecture sigma1_tb of sigma1_tb is

  type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);
constant INPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"11a2faa0",
	x"2a227c1d",
	x"04437395",
	x"14820f41",
	x"00ded257",
	x"29bf5666",
	x"207563b8",
	x"2c65f882",
	x"27fd15dc",
	x"27a86051",
	x"0f4b10e6",
	x"3d9a1a87",
	x"111f06a6",
	x"078a22fe",
	x"1e4d694d",
	x"327b50e9",
	x"2e083919",
	x"21c19200",
	x"054a9909",
	x"01b824b2",
	x"2f5eda8b",
	x"149e8157",
	x"018f302a",
	x"2391225c",
	x"23e93741",
	x"1da35b75",
	x"392c08ab",
	x"0f196fd0",
	x"1fd08071",
	x"3ac3173d",
	x"26336c7c",
	x"3f75a267",
	x"2be05241",
	x"13a4edfe",
	x"09fa7b77",
	x"011dd4eb",
	x"3cc679c5",
	x"2adf517b",
	x"2856516d",
	x"07187d95",
	x"32517b04",
	x"173ca1e6",
	x"0adfec1a",
	x"08420410",
	x"1eb2d6f2",
	x"04f8a3df",
	x"0c31d12b",
	x"24869775",
	x"15be9176",
	x"3f00b678",
	x"2b26f43f",
	x"1225c44b",
	x"0429f764",
	x"0035c934",
	x"261f5ce2",
	x"12efca8f",
	x"0ecaa483",
	x"0ca89202",
	x"1e3a8c93",
	x"3186b3a9",
	x"39dac989",
	x"12dd0345"
	);

constant OUTPUTS : vector32_t(0 to 63) := (
	x"00000000",
	x"ffffffff",
	x"0539efbd",
	x"e633c32a",
	x"07084f22",
	x"ad7738f6",
	x"798a4b13",
	x"8bc8f9a7",
	x"ad340732",
	x"2a085a4b",
	x"3591e5e6",
	x"9a8a7c1e",
	x"2174b626",
	x"811c98b7",
	x"c3050cf2",
	x"62cfa6cc",
	x"3b6e5a87",
	x"8447d6b0",
	x"43816d74",
	x"a04a3e6a",
	x"a07907b5",
	x"82548e96",
	x"d2b5d526",
	x"39f0425f",
	x"6ade1826",
	x"f39b18bc",
	x"1830796a",
	x"6b788388",
	x"2f87c03f",
	x"368a6e95",
	x"221c809e",
	x"72c7caa3",
	x"66aa35cf",
	x"6acb0ba2",
	x"bca3ddd6",
	x"95fa1823",
	x"4ffb6d26",
	x"bf8e2169",
	x"4f6863b6",
	x"ac669b3a",
	x"b22ce51b",
	x"6a82487a",
	x"58f28dda",
	x"3acee618",
	x"849c2948",
	x"e3220854",
	x"4f52640e",
	x"7ba29219",
	x"91b9d4f8",
	x"797d301d",
	x"29dcf69d",
	x"afa0ded0",
	x"e833e09b",
	x"b7c8f620",
	x"686b90e1",
	x"ec644b9d",
	x"1b72cf8b",
	x"1a4ca55a",
	x"f908b241",
	x"1c3a365c",
	x"c35d64ec",
	x"12b9fe80",
	x"f8a494e3",
	x"12688d24"
	);


  signal input  : std_logic_vector(31 downto 0);
  signal output : std_logic_vector(31 downto 0);

begin

  SIGMA1_MODULE: entity work.sigma1
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

end sigma1_tb;

