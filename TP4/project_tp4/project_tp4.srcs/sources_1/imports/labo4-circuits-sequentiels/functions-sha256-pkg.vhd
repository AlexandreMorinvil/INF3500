-------------------------------------------------------------------------------
-- functions_sha256_pkg.vhd: auxiliary functions for the SHA256
-- Jeferson S. Silva
--
-- Modified: Sat 08 Feb 2020 08:55:51 PM EST
-- Signed-off-by: Olivier dion <olivier.dion@polymtl.ca>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package functions_sha256_pkg is

  -- Functions
  function ch(x, y, z : unsigned(31 downto 0)) return unsigned;
  function maj(x, y, z : unsigned(31 downto 0)) return unsigned;
  function sigma0(x : unsigned(31 downto 0)) return unsigned;
  function sigma1(x : unsigned(31 downto 0)) return unsigned;
  function sigma2(x : unsigned(31 downto 0)) return unsigned;
  function sigma3(x : unsigned(31 downto 0)) return unsigned;

end functions_sha256_pkg;

package body functions_sha256_pkg is
  function ch(x, y, z : unsigned(31 downto 0)) return unsigned is
  begin
    return (x and y) xor (not x and z);
  end function;

  function maj(x, y, z : unsigned(31 downto 0)) return unsigned is
  begin
    return (x and y) xor (x and z) xor (y and z);
  end function;

  function sigma0(x : unsigned(31 downto 0)) return unsigned is
  begin
    return rotate_right(x, 2) xor rotate_right(x, 13) xor rotate_right(x, 22);
  end function;

  function sigma1(x : unsigned(31 downto 0)) return unsigned is
  begin
    return rotate_right(x, 6) xor rotate_right(x, 11) xor rotate_right(x, 25);
  end function;

  function sigma2(x : unsigned(31 downto 0)) return unsigned is
  begin
    return rotate_right(x, 7) xor rotate_right(x, 18) xor shift_right(x, 3);
  end function;

  function sigma3(x : unsigned(31 downto 0)) return unsigned is
  begin
    return rotate_right(x, 17) xor rotate_right(x, 19) xor shift_right(x, 10);
  end function;

end functions_sha256_pkg;
