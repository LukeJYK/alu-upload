library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.full_adder;

Entity adder_8bit is
port(
	x    : in std_logic_vector(7 downto 0);
	y    : in std_logic_vector(7 downto 0);
	carryin : in std_logic;
	sum     : out std_logic_vector(7 downto 0);
	carryout: out std_logic);
end entity adder_8bit;

architecture structural of adder_8bit is

signal carry1, carry2, carry3, carry4, carry5, carry6, carry7: std_logic;
begin
  F1: entity full_adder port map(x(0), y(0), carryin, sum(0), carry1);
  F2: entity full_adder port map(x(1), y(1), carry1, sum(1), carry2);
  F3: entity full_adder port map(x(2), y(2), carry2, sum(2), carry3);
  F4: entity full_adder port map(x(3), y(3), carry3, sum(3), carry4);
  F5: entity full_adder port map(x(4), y(4), carry4, sum(4), carry5);
  F6: entity full_adder port map(x(5), y(5), carry5, sum(5), carry6);
  F7: entity full_adder port map(x(6), y(6), carry6, sum(6), carry7);
  F8: entity full_adder port map(x(7), y(7), carry7, sum(7), carryout);
end structural;