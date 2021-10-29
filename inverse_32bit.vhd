library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
--get inverse b
entity inverse_32bit is
  port (
    inv : in  std_logic;
    b   : in  std_logic_vector(31 downto 0);
    xorb : out std_logic_vector(31 downto 0)
  );
end inverse_32bit;

architecture structural of inverse_32bit is
signal inv_v: std_logic_vector(31 downto 0);
begin 
   inv_v(0) <= inv;
	inv_v(1) <= inv;
	inv_v(2) <= inv;
	inv_v(3) <= inv;
	inv_v(4) <= inv;
	inv_v(5) <= inv;
	inv_v(6) <= inv;
	inv_v(7) <= inv;
	inv_v(8) <= inv;
	inv_v(9) <= inv;
	inv_v(10) <= inv;
	inv_v(11) <= inv;
	inv_v(12) <= inv;
	inv_v(13) <= inv;
	inv_v(14) <= inv;
	inv_v(15) <= inv;
	inv_v(16) <= inv;
	inv_v(17) <= inv;
	inv_v(18) <= inv;
	inv_v(19) <= inv;
	inv_v(20) <= inv;
	inv_v(21) <= inv;
	inv_v(22) <= inv;
	inv_v(23) <= inv;
	inv_v(24) <= inv;
	inv_v(25) <= inv;
	inv_v(26) <= inv;
	inv_v(27) <= inv;
	inv_v(28) <= inv;
	inv_v(29) <= inv;
	inv_v(30) <= inv;
	inv_v(31) <= inv;
xor1: xor_gate_32 port map(inv_v, b, xorb);
end structural;