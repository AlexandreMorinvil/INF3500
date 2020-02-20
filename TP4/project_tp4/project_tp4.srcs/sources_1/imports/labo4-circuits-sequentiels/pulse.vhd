-------------------------------------------------------------------------------
-- SPDX-License-Identifier: GPL-2.0-or-later
-- Copyright (C) 2019 Olivier Dion <olivier.dion@polymtl.ca>, Milan Lachance
-- Copyright (C) 2020 Olivier Dion <olivier.dion@polymtl.ca>
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulse is
  port (
    rst    : in std_logic;
    clk    : in std_logic;
    input  : in std_logic;
    output : out std_logic
    );
end pulse;

architecture Behavioral of pulse is

  signal state : std_logic;

begin

  process(rst, clk) is
  begin

    if (rst = '1') then
      state  <= '0';
      output <= '0';
    elsif (rising_edge(clk)) then
      state  <= input;
      output <= input and not state;
    end if;

  end process;

end Behavioral;
