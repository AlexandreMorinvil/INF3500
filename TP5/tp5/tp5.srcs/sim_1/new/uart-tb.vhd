----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2020 10:09:01 AM
-- Design Name: 
-- Module Name: uart-tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;

entity uart_tb is
  generic(
    BUS_FREQUENCY : integer   := 1E8;    -- Usually the same as the clk' frequency
    BAUD_RATE     : integer   := 57_600; -- See the uart standard baud rate
    DATA_WIDTH    : integer   := 8;      -- UART Data field width
    PARITY_EN     : boolean   := true;   -- Enables parity check/generation
    PARITY_TYPE   : std_logic := '1'     -- Parity type: '0' - even, '1' - odd
    );
end uart_tb;

architecture uart_tb of uart_tb is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';

    -- TX pins
    signal tx_pdata      :   std_logic_vector(DATA_WIDTH - 1 downto 0);  -- Parallel RX data
    signal tx_send_data  :   std_logic := '0';                                  -- Send data enable
    signal tx_busy       :  std_logic;                                  -- UART TX busy
    signal tx_sdata      :  std_logic;                                  -- Serial TX DATA_WIDTH

    -- RX pins
    signal rx_sdata       : std_logic := '1';                                 -- Serial data
    signal rx_pdata       :   std_logic_vector(DATA_WIDTH - 1 downto 0); -- Parallel TX data
    signal rx_pdata_valid :   std_logic;                                 -- Parallel RX data valid
    signal rx_frame_err   :   std_logic;                                 -- Frame error
    signal rx_parity_err  :   std_logic;                                  -- Parity error
constant period_baud : time :=17361 ns;

begin
  uut: entity work.uart
    port map (
    clk => clk,
    rst => rst,

    -- TX pins
    tx_pdata     => tx_pdata,  -- Parallel RX data
    tx_send_data  => tx_send_data,                                 -- Send data enable
    tx_busy    => tx_busy,                          -- UART TX busy
    tx_sdata     =>tx_sdata,                                 -- Serial TX DATA_WIDTH

    -- RX pins
    rx_sdata     =>rx_sdata,                               -- Serial data
    rx_pdata     =>rx_pdata, -- Parallel TX data
    rx_pdata_valid => rx_pdata_valid,                          -- Parallel RX data valid
    rx_frame_err  =>rx_frame_err,                         -- Frame error
    rx_parity_err =>rx_parity_err                                 -- Parity error
      );
  clk <= not clk after 5 ns;
  process
  begin
      rst <= '1';
      wait for 10 ns;
      rst <= '0';
      wait for 10 ns;
      -- test du tx : fonctionne bien, à refaire plus proprement
--      tx_pdata <= "10000001";
--      wait for period_baud;
--      tx_send_data <= '1';
--      wait for 100 ns;
--      tx_send_data <= '0';
--      wait for 100*period_baud;
      rx_sdata <= '1';

      wait for period_baud*5;
      rx_sdata <= '0';
      wait for period_baud;
      rx_sdata <= '1';
      wait for period_baud;
      rx_sdata <= '0';
      wait for period_baud;
      rx_sdata <= '1';
      wait for period_baud;
      rx_sdata <= '0';
      wait for period_baud;
      rx_sdata <= '1';
      wait for period_baud;
      rx_sdata <= '0';
      wait for period_baud;
      rx_sdata <= '1';
      wait for period_baud;
      rx_sdata <= '0';
      wait for period_baud;
      rx_sdata <= '1';
      wait for period_baud;
      rx_sdata <= '1';
      wait for period_baud;
      rx_sdata <= '1';
      wait for 100*period_baud;


--      wait for 100 ns;
--      assert rx_pdata = "11111111"
--        report
--"failed"
--        severity error;

    wait for 50 ns;

    assert false report "Simulation ended" severity failure;
  end process;


end uart_tb;
