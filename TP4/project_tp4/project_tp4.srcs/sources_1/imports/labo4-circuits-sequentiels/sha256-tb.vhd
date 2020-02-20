-------------------------------------------------------------------------------
-- sha256_tb.vhd: TB SHA256
-- Jeferson S. Silva
--
-- Modified: Fri 14 Feb 2020 04:09:36 PM EST
-- Signed-off-by: Olivier Dion <olivier.dion@polymtl.ca>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;

entity sha256_tb is
end sha256_tb;

architecture sha256_tb of sha256_tb is
  signal clk      : std_logic := '0';
  signal rst      : std_logic := '0';
  signal din      : std_logic_vector(15 downto 0);
  signal dout     : std_logic_vector(15 downto 0);
  signal dv       : std_logic;
  signal din_en   : std_logic;

  type test_tuple is array (0 to 1) of std_logic_vector(15 downto 0);
  type test_vector is array (integer range<>) of test_tuple;

  constant TESTS_VECTOR : test_vector(0 to 7) := (
    (X"6162", X"0603"),
    (X"BEEF", X"9C7C"),
    (X"DEAD", X"931C"),
    (X"BADD", X"1C6F"),
    (X"BABE", X"3E84"),
    (X"2BAD", X"E19E"),
    (X"FEED", X"09BC"),
    (X"0000", X"CFC7")
    );

  function logic2str(vector: std_logic_vector) return string is
  begin
    return integer'image(to_integer(unsigned(vector)));
  end function;

begin

  uut: entity work.sha256_top
    port map (
      clk             => clk,
      rst             => rst,

      sha256_din_en   => din_en,
      sha256_din      => din,
      sha256_dout     => dout,
      sha256_dout_val => dv
      );

  clk <= not clk after 5 ns;
  din_en <= '1';

  process
  begin

    for i in 0 to TESTS_VECTOR'length - 1 loop

      rst <= '1';
      wait for 10 ns;
      rst <= '0';
      wait for 10 ns;

      din <= TESTS_VECTOR(i)(0);

      wait until dv = '1';

      wait for 100 ns;
      assert dout = TESTS_VECTOR(i)(1)
        report
        "Hash failed at index " & integer'image(i) & ".  " &
        "Input was " & logic2str(TESTS_VECTOR(i)(0)) &
        " ouput was " & logic2str(dout) &
        " but expected " & logic2str(TESTS_VECTOR(i)(1)) & "."

        severity error;
    end loop;

    wait for 50 ns;

    assert false report "Simulation ended" severity failure;
  end process;

end sha256_tb;
