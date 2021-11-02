library ieee;
use ieee.std_logic_1164.all;
use work.slt_32;


entity slt_32_t is
  
end slt_32_t;

architecture behavior of slt_32_t is
signal a,b,result : std_logic_vector(31 downto 0);

component slt_32 is
  port(
    a,b   : in  std_logic_vector(31 downto 0);
    result   : out std_logic_vector(31 downto 0));
end component slt_32;

begin
  test_comp : slt_32
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