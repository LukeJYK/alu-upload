library ieee;
use ieee.std_logic_1164.all;
use work.sltu_32;


entity sltu_32_t is
  
end sltu_32_t;

architecture behavior of sltu_32_t is
signal a,b,result : std_logic_vector(31 downto 0);

component sltu_32 is
  port(
    a,b   : in  std_logic_vector(31 downto 0);
    result   : out std_logic_vector(31 downto 0));
end component sltu_32;

begin
  test_comp : sltu_32
  port map(
  a=>a,
  b=>b,
  result=>result
  );
  testbench : process
  begin
    a<="00000000000000000000000000000001";
    b<="00000000000000000000000000000000";
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
	 a<="10000000000000000000000000000100";
    b<="00000000000000000000000000000101";
	 wait for 50 ns;
    wait;
  end process;
end architecture behavior;