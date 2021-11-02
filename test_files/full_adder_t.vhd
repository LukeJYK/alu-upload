library ieee;
use ieee.std_logic_1164.all;
use work.full_adder;

Entity full_adder_t is
end full_adder_t;

architecture behavior of full_adder_t is
signal in1,in2,carryin,sum,carryout: std_logic;

component full_adder is
  port(
    in1 : in std_logic;
    in2 : in std_logic;
	 carryin: in std_logic;
    carryout : out std_logic;
    sum : out std_logic
  );
end component full_adder;

begin
  test_comp : full_adder
  port map(
  in1=>in1,
  in2=>in2,
  carryin=>carryin,
  carryout=>carryout,
  sum=>sum
  );
  testbench : process
  begin
    in1<='0';
    in2<='0';
	 carryin<='0';
    wait for 50 ns;
    in1<='1';
    in2<='0';
	 carryin<='1';
    wait for 50 ns;
    in1<='1';
    in2<='1';
	 carryin<='1';
    wait for 50 ns;
    in1<='0';
    in2<='1';
	 carryin<='1';
    wait;
  end process;
end architecture behavior;