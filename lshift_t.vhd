library ieee;
use ieee.std_logic_1164.all;
use work.lshift;
entity lshift_t is
end lshift_t;

architecture behavior of lshift_t is
  signal a,shiftout :std_logic_vector(31 downto 0);
  signal sh : std_logic_vector(4 downto 0);
component lshift is
port(
  a: in std_logic_vector(31 downto 0);
  sh : in std_logic_vector(4 downto 0);
  shiftout : out std_logic_vector(31 downto 0)
  );
end component lshift;

begin
  test_comp : lshift
  port map(
    a=>a,
    sh=>sh,
    shiftout=>shiftout
  );
  testbench : process
    begin
    a<="11111111111111111111111111111111";
    sh<="00000";
    wait for 100ns;
    sh<="00001";
    wait for 100ns;
    sh<="00010";
    wait for 100ns;
    sh<="00011";
    wait for 100ns;
    sh<="00100";
    wait for 100ns;
    sh<="00101";
    wait for 100ns;
    sh<="00110";
    wait for 100ns;
    sh<="00111";
    wait for 100ns;
    sh<="01000";
    wait for 100ns;
    sh<="01001";
    wait for 100ns;
    sh<="01010";
    wait for 100ns;
    sh<="01011";
    wait for 100ns;
    sh<="01100";
    wait for 100ns;
    sh<="01101";
    wait for 100ns;
    sh<="01110";
    wait for 100ns;
    sh<="01111";
    wait for 100ns;
    sh<="10000";
    wait for 100ns;
    sh<="10001";
    wait for 100ns;
    sh<="10010";
    wait for 100ns;
    sh<="10011";
    wait for 100ns;
    sh<="11111";
    wait;
  end process;
end behavior;
