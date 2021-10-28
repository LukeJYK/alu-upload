library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
Entity half_adder is
port(x, y: in std_logic;
     sum, carryout: out std_logic);
end entity half_adder;

architecture structural of half_adder is

begin
  r1 : xor_gate port map(x, y, sum);
  r2 : and_gate port map(x, y, carryout);  
end structural;