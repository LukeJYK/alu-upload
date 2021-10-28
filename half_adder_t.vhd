library ieee;
use ieee.std_logic_1164.all;
use work.half_adder;
Entity half_adder_t is
end half_adder_t;

architecture behavior of half_adder_t is
signal x,y,sum,carryout: std_logic;

component half_adder is
  port(
    x : in std_logic;
    y : in std_logic;
    carryout : out std_logic;
    sum : out std_logic
  );
end component half_adder;

begin
  test_comp : half_adder
  port map(
  x=>x,
  y=>y,
  carryout=>carryout,
  sum=>sum
  );
  testbench : process
  begin
    x<='0';
    y<='0';
    wait for 50 ns;
    x<='1';
    y<='0';
    wait for 50 ns;
    x<='1';
    y<='1';
    wait for 50 ns;
    x<='0';
    y<='1';
    wait;
  end process;
end architecture behavior;
