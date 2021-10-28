library ieee;
use ieee.std_logic_1164.all;
use work.adder_8bit;

entity adder_8bit_t is
  
end adder_8bit_t;

architecture behavior of adder_8bit_t is
signal x,y,sum : std_logic_vector(7 downto 0);
signal carryin, carryout : std_logic;

component adder_8bit is
  port(
    x : in std_logic_vector(7 downto 0);
    y : in std_logic_vector(7 downto 0);
    carryin : in std_logic;
    carryout : out std_logic;
    sum : out std_logic_vector(7 downto 0)
  );
end component adder_8bit;

begin
  test_comp : adder_8bit
  port map(
  x=>x,
  y=>y,
  carryin=>carryin,
  carryout=>carryout,
  sum=>sum
  );
  testbench : process
  begin
    x<="00000000";
    y<="00000000";
    carryin<='0';
    wait for 50 ns;
    x<="00000001";
    y<="00000000";
    wait for 50ns;
    x<="00000001";
    y<="00000001";
    wait for 50 ns;
    x<="00000001";
    y<="00000010";
    wait for 50 ns;
    x<="00000001";
    y<="01111111";
    wait for 50 ns;
    x<="00000001";
    y<="11111111";
    wait;
  end process;
end architecture behavior;
