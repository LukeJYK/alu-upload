library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.half_adder;

Entity full_adder is
port(in1, in2, carryin: in std_logic;
     sum, carryout: out std_logic);
end entity full_adder;

architecture structural of full_adder is

signal s1, s2, s3: std_logic;
begin
  H1: entity half_adder port map(in1, in2, s1, s2);
  H2: entity half_adder port map(s1, carryin, sum, s3);  
  O1: or_gate port map(s2, s3, carryout);
end structural;