library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.sub_32;

entity slt_32 is
  port (
    a,b   : in  std_logic_vector(31 downto 0);
    result   : out std_logic_vector(31 downto 0)
  );
end slt_32;

architecture struct of slt_32 is
signal sub_result : std_logic_vector(31 DOWNTO 0);
signal sub_overflow : std_logic;
signal sub_cout : std_logic;
begin
    sub: entity sub_32 port map(a, b, sub_result, sub_overflow, sub_cout);
	 result(31 downto 1)<="0000000000000000000000000000000";
	 stl: xor_gate port map(sub_overflow, sub_result(31), result(0));
end struct;