library ieee;
use ieee.std_logic_1164.all;
use work.adder_32bit;


entity adder_32bit_t is
  
end adder_32bit_t;

architecture behavior of adder_32bit_t is
signal a,b,sum : std_logic_vector(31 downto 0);
signal cout, cin : std_logic;

component adder_32bit is
  port(
    a : in std_logic_vector(31 downto 0);
    b : in std_logic_vector(31 downto 0);
    cin : in std_logic;
    sum : out std_logic_vector(31 downto 0);
  cout : out std_logic);
end component adder_32bit;

begin
  test_comp : adder_32bit
  port map(
  a=>a,
  b=>b,
  cin=>cin,
  cout=>cout,
  sum=>sum
  );
  testbench : process
  begin
    a<="00000000000000000000000000000000";
    b<="00000000000000000000000000000000";
    cin<='0';
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
    wait;
  end process;
end architecture behavior;

