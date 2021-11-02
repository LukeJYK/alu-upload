library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.adder_32;

entity sub_32 is
  port (
    a,b   : in  std_logic_vector(31 downto 0);
    result   : out std_logic_vector(31 downto 0);
    overflow : out std_logic;
    cout: out std_logic
  );
end sub_32;

architecture struct of sub_32 is

signal not_b : std_logic_vector(31 downto 0);
begin
    notb: not_gate_32 port map (b,not_b);
	 sub: entity adder_32 port map (a,not_b,'1',result,overflow,cout); --carry in of 1 to add 1 (2c)
end struct;