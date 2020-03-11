-------------------------------------------------------------------------------
--      INF3500 - Conception et rï¿½alisation de systï¿½mes numï¿½riques
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
use ieee.std_logic_unsigned.all;

-- Importation des fonctions du SHA-256 utilisant le type 'unsigned'
--
-- Vous pouvez importer vos propre entitï¿½s et faire des ports maps ..
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
  type state_type is (IDLE, DONE, majW, majT, majVar, majH);

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

      constant H_initial : vector32_t(0 to 7) := (
        X"6a09e667", 
        X"bb67ae85", 
        X"3c6ef372", 
        X"a54ff53a", 
        X"510e527f", 
        X"9b05688c", 
        X"1f83d9ab", 
        X"5be0cd19"
      );

    -- Vos variables au besoin ici
      variable W : vector32_t(0 to 63);
      variable T1, T2 : std_logic_vector(31 downto 0);
      variable a, b, c, d, e, f, g, h : std_logic_vector(31 downto 0);
      variable Hash : vector32_t(0 to 7);
      variable i : natural range 0 to 64 := 0; -- i doit aller jusqu'au depassement de la valeur pour sortir de la boucle, donc meme si les valeurs qui nous interessent sont entre 0 et 63, quand i sera egal à 64 alors on passera à l'état suivant

  begin

    if (reset = '1') then
      -- Reset me
      Hash(0) := H_initial(0);
      Hash(1) := H_initial(1);
      Hash(2) := H_initial(2);
      Hash(3) := H_initial(3);
      Hash(4) := H_initial(4);
      Hash(5) := H_initial(5);
      Hash(6) := H_initial(6);
      Hash(7) := H_initial(7);
      a := H_initial(0);
      b := H_initial(1);
      c := H_initial(2);
      d := H_initial(3);
      e := H_initial(4);
      f := H_initial(5);
      g := H_initial(6);
      h := H_initial(7);
      output_valid <= '0';
      state <= IDLE;
    elsif (rising_edge(clk)) then

      case state is

        -- Wait for new inputs
        when IDLE =>
           if(new_input = '1') then
              output_valid <= '0';
              a := Hash(0);
              b := Hash(1);
              c := Hash(2);
              d := Hash(3);
              e := Hash(4);
              f := Hash(5);
              g := Hash(6);
              h := Hash(7);
            end if;
            i := 0;
            state <= majW;

        when majW =>
          if i < 16 then
            W(i) := input(511-i*32 downto 512-(i+1)*32);
          else
            W(i) := std_logic_vector(sigma3(unsigned(W(i-2)))) + W(i-7) + std_logic_vector(sigma2(unsigned(W(i-15)))) + W(i - 16);
          end if;
          state <= majT;

        when majT =>
          T1 := h + std_logic_vector(sigma1(unsigned(e))) + std_logic_vector(ch(unsigned(e),unsigned(f),unsigned(g))) + K(i) + W(i);
          T2 := std_logic_vector(sigma0(unsigned(a))) + std_logic_vector(maj(unsigned(a),unsigned(b),unsigned(c)));
          i := i + 1;
          state <= majVar;

        when majVar =>
          h := g;
          g := f;
          f := e;
          e := d + T1;
          d := c;
          c := b;
          b := a;
          a := T1 + T2;
          if i < 64 then
            state <= majW;
          else
            state <= majH;
          end if;
        
          when majH =>
            Hash(0) := Hash(0) + a;
            Hash(1) := Hash(1) + b;
            Hash(2) := Hash(2) + c;
            Hash(3) := Hash(3) + d;
            Hash(4) := Hash(4) + e;
            Hash(5) := Hash(5) + f;
            Hash(6) := Hash(6) + g;
            Hash(7) := Hash(7) + h;
            state <= DONE;

        -- Wait until new_input is set to 0 to avoid hashing 2 times
        -- the same blob
        when DONE =>
          output <= Hash(0) & Hash(1) & Hash(2) & Hash(3) & Hash(4) & Hash(5) & Hash(6) & Hash(7);
          output_valid <= '1';
          if (new_input = '1') then
            state <= IDLE;
          else
            state <= DONE;
          end if;

        when others =>
          state <= IDLE;
          -- erreur

      end case;

    end if;

  end process;
end sha256;
