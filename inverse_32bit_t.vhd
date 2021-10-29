library ieee;
use ieee.std_logic_1164.all;
use work.inverse_32bit;

entity inverse_32bit_t is 
end inverse_32bit_t;

architecture behavior of inverse_32bit_t is
signal b,xorb : std_logic_vector(31 downto 0);
signal  inv: std_logic;

component inverse_32bit is
  port(
    inv : in  std_logic;
    b   : in  std_logic_vector(31 downto 0);
    xorb : out std_logic_vector(31 downto 0)
  );
end component inverse_32bit;

begin
  test_comp : inverse_32bit
  port map(
  b=>b,
  inv=>inv,
  xorb=>xorb
  );
  testbench : process
  begin
    inv<='0';
    b<="00000000000000000000000000000000";
    wait for 50 ns;
    b<="00000000000000000000000000000111";
    inv<='1';
	 wait for 50 ns;
    wait;
    
  end process;
end architecture behavior;
