-------------------------------------------------------------------------------
--      INF3500 - Conception et réalisation de systèmes numériques
--      Laboratoire #4
--      By Olivier Dion and Milan Lachance
--      Date: 03-04-2019
--      Version: 1
--
--      Modified:  [DATE]
--      By: [NOMS] [MATRICULE]
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Importation des fonctions du SHA-256 utilisant le type 'unsigned'
--
-- Vous pouvez importer vos propre entités et faire des ports maps ..
library work;
use work.functions_sha256_pkg.all;

entity sha256 is
  port (
    clk          : in std_logic;                       -- Rising edge clock
    reset        : in std_logic;                       -- Positive logic

    new_input    : in std_logic;                       -- Predicate: Is 'input' a new input?
    input        : in std_logic_vector(511 downto 0);  -- The current block to hash

    output       : out std_logic_vector(255 downto 0); -- The digest
    output_valid : out std_logic                       -- Prdicate: Is the digest valid?
    );
end sha256;

architecture sha256 of sha256 is

  -- Types
  type vector32_t is array (integer range <>) of std_logic_vector(31 downto 0);

  -- Ajoutez des états à votre machine
  type state_type is (IDLE, DONE);

  -- Vos signaux ici
  signal state : state_type := IDLE;


begin

  process(CLK, reset) is

    -- Vector of Constants
    constant K : vector32_t(0 to 63) := (
      X"428a2f98", X"71374491", X"b5c0fbcf", X"e9b5dba5",
      X"3956c25b", X"59f111f1", X"923f82a4", X"ab1c5ed5",
      X"d807aa98", X"12835b01", X"243185be", X"550c7dc3",
      X"72be5d74", X"80deb1fe", X"9bdc06a7", X"c19bf174",
      X"e49b69c1", X"efbe4786", X"0fc19dc6", X"240ca1cc",
      X"2de92c6f", X"4a7484aa", X"5cb0a9dc", X"76f988da",
      X"983e5152", X"a831c66d", X"b00327c8", X"bf597fc7",
      X"c6e00bf3", X"d5a79147", X"06ca6351", X"14292967",
      X"27b70a85", X"2e1b2138", X"4d2c6dfc", X"53380d13",
      X"650a7354", X"766a0abb", X"81c2c92e", X"92722c85",
      X"a2bfe8a1", X"a81a664b", X"c24b8b70", X"c76c51a3",
      X"d192e819", X"d6990624", X"f40e3585", X"106aa070",
      X"19a4c116", X"1e376c08", X"2748774c", X"34b0bcb5",
      X"391c0cb3", X"4ed8aa4a", X"5b9cca4f", X"682e6ff3",
      X"748f82ee", X"78a5636f", X"84c87814", X"8cc70208",
      X"90befffa", X"a4506ceb", X"bef9a3f7", X"c67178f2"
      );

    -- Vos variables au besoin ici

  begin

    if (reset = '1') then
      -- Reset me

    elsif (rising_edge(clk)) then

      case state is

        -- Wait for new inputs
        when IDLE =>



        -- Wait until new_input is set to 0 to avoid hashing 2 times
        -- the same blob
        when DONE =>
          if (new_input = '0') then
            state <= IDLE;
          else
            state <= DONE;
          end if;

      end case;

    end if;

  end process;

end sha256;
