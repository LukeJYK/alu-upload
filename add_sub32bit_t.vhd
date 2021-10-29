library ieee;
use ieee.std_logic_1164.all;
use work.add_sub32bit;

entity add_sub32bit_t is 
end add_sub32bit_t;

architecture behavior of add_sub32bit_t is
signal a,b,sum : std_logic_vector(31 downto 0);
signal carryout,inv: std_logic;

component add_sub32bit is
  port(
    a : in std_logic_vector(31 downto 0);
    b : in std_logic_vector(31 downto 0);
    inv : in std_logic;
    carryout : out std_logic;
    sum : out std_logic_vector(31 downto 0)
  );
end component add_sub32bit;

begin
  test_comp : add_sub32bit
  port map(
  a=>a,
  b=>b,
  inv=>inv,
  carryout=>carryout,
  sum=>sum
  );
  testbench : process
  begin
    inv<='0';
    a<="00000000000000000000000000000000";
    b<="00000000000000000000000000000000";
    
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="00000000000000000000000000000000";
    wait for 50ns;
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="00000000000000000000000000000001";
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="00000000000000000000000000000010";
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="01111111111111111111111111111111";
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="11111111111111111111111111111111";
    wait for 50 ns;
    a<="11111111111111111111111111111111";
    b<="00000000000000000000000000000111";
    inv<='1';
    wait;
    
  end process;
end architecture behavior;
