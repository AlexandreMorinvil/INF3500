-------------------------------------------------------------------------------
-- sha256_top.vhd: TOP SHA256
-- Jeferson S. Silva
--
-- Modified: Fri 14 Feb 2020 04:39:32 PM EST
-- Signed-of-by: Olivier Dion <olivier.dion@polymtl.ca>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256_top is
  port (
    clk             : in    std_logic;
    rst             : in    std_logic;

    sha256_din_en   : in    std_logic;
    sha256_din      : in    std_logic_vector(15 downto 0);

    sha256_dout     : out   std_logic_vector(15 downto 0);
    sha256_dout_val : out   std_logic
    );
end sha256_top;

architecture sha256_top of sha256_top is

  function sha256_padder (din : std_logic_vector(15 downto 0)) return std_logic_vector is
    variable din_padded : std_logic_vector(511 downto 0);
  begin
    -- Padding the inputs
    din_padded(512 - 1 downto 512 - 16) :=  din;
    din_padded(512 - 16 - 1)            :=  '1';
    din_padded(512 - 16 - 2 downto 64)  :=  (others => '0');
    din_padded(63 downto 0)             :=  std_logic_vector(to_unsigned(16, 64));

    return din_padded;
  end function;

  signal sha256_dout_int  : std_logic_vector(255 downto 0);
  signal debouncer_out    : std_logic;
  signal pulse_in         : std_logic;
  signal new_input        : std_logic;

begin

  debouncer_inst: entity work.debouncer
    generic map (
      W => 20
    )
    port map (
      clk    => clk,
      rst    => rst,
      input  => sha256_din_en,
      output => pulse_in
      );

  pulse_inst: entity work.pulse
    port map(
      clk    => clk,
      rst    => rst,
      input  => pulse_in,
      output => new_input
      );

  sha_inst: entity work.sha256
    port map (
      clk           => clk,
      reset         => rst,

      new_input     => new_input,
      input         => sha256_padder(sha256_din),

      output        => sha256_dout_int,
      output_valid  => sha256_dout_val
      );

  sha256_dout <= sha256_dout_int(15 downto 0);

end sha256_top;
