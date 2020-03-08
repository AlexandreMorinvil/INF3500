-------------------------------------------------------------------------------
-- SPDX-License-Identifier: GPL-2.0-or-later
-- Copyright (C) 2019 Olivier Dion <olivier.dion@polymtl.ca>, Milan Lachance
-- Copyright (C) 2020 Olivier Dion <olivier.dion@polymtl.ca>
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debouncer is

  generic (
    W : integer := 10
    );

  port (
    rst    : in std_logic;
    clk    : in std_logic;
    input  : in std_logic;
    output : out std_logic
    );
end debouncer;

architecture Behavioral of debouncer is

  signal counter : std_logic_vector(W - 1 downto 0) := (others => '0');

begin

  process(rst, clk) is
  begin

    if (rst = '1') then
      counter <= (others => '0');
      output  <= '0';
    elsif rising_edge(clk) then

      if (input = '0') then
        counter <= (others => '0');
        output  <= '0';
      elsif (counter = 2**W - 1) then
        output <= '1';
        counter <= counter;
      else
        output <= '0';
        counter <= counter + 1;
      end if;

    end if;

  end process;

end Behavioral;
