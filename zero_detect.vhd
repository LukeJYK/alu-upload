library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity zero_detect is
  port (
    a   : in  std_logic_vector(31 downto 0);
    zero : out std_logic
  );
end zero_detect;

architecture struct of zero_detect is
signal or1 : std_logic_vector(15 downto 0);
signal or2 : std_logic_vector(7 downto 0);
signal or3 : std_logic_vector(3 downto 0);
signal or4 : std_logic_vector(1 downto 0);
signal or5 : std_logic;
	
begin
    --layer1
	Loop1: for i in 0 to 15 generate begin
    s0: or_gate port map(a(i), a(31-i), or1(i));
	end generate;
	--layer2
	Loop2: for i in 0 to 7 generate begin
    s1: or_gate port map(or1(i), or1(15-i), or2(i));
	end generate;
	--layer3
	Loop3: for i in 0 to 3 generate begin
    s2: or_gate port map(or2(i), or2(7-i), or3(i));
	end generate;
	--layer4
	Loop4: for i in 0 to 1 generate begin
    s3: or_gate port map(or3(i), or3(3-i), or4(i));
	end generate;
	--final
	s4: or_gate port map(or4(0), or4(1), or5);
	s5: not_gate port map(or5, zero);
end struct;