library ieee;
use ieee.std_logic_1164.all;
use work.adder_32;


entity adder_32_t is
  
end adder_32_t;

architecture behavior of adder_32_t is
signal a,b,result : std_logic_vector(31 downto 0);
signal cout, cin, overflow : std_logic;

component adder_32 is
  port(
    a,b   : in  std_logic_vector(31 downto 0);
    cin: in std_logic;
    result   : out std_logic_vector(31 downto 0);
    overflow : out std_logic;
    cout: out std_logic);
end component adder_32;

begin
  test_comp : adder_32
  port map(
  a=>a,
  b=>b,
  cin=>cin,
  cout=>cout,
  result=>result,
  overflow=>overflow
  );
  testbench : process
  begin
    a<="00000000000000000000000000000000";
    b<="00000000000000000000000000000000";
    cin<='0';
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="00000000000000000000000000000000";
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="00000000000000000000000000000001";
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="00000000000000000000000000000010";
    wait for 50 ns;
	 --test overflow
    a<="00000000000000000000000000000001";
    b<="01111111111111111111111111111111";
    wait for 50 ns;
    a<="00000000000000000000000000000001";
    b<="11111111111111111111111111111111";
	 wait for 50 ns;
    wait;
  end process;
end architecture behavior;
