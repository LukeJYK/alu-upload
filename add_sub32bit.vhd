library ieee;
use ieee.std_logic_1164.all;
use work.adder_32bit;
use work.inverse_32bit;
--get inverse b
entity add_sub32bit is
  port (
    a   : in  std_logic_vector(31 downto 0);
    b   : in  std_logic_vector(31 downto 0);
	 inv : in std_logic;
    carryout: out std_logic;
    sum : out std_logic_vector(31 downto 0)
  );
end add_sub32bit;

architecture structural of add_sub32bit is
signal xorb: std_logic_vector(31 downto 0);

begin
	inv1: entity inverse_32bit port map(inv, b, xorb);
	ADD: entity adder_32bit port map(a, xorb, inv, carryout, sum);
end structural;