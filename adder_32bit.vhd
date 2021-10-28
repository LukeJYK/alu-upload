library ieee;
use ieee.std_logic_1164.all;
use work.adder_8bit;
entity adder_32bit is
  port (
    a   : in  std_logic_vector(31 downto 0);
    b   : in  std_logic_vector(31 downto 0);
    cin : in  std_logic;
    cout: out std_logic;
    sum : out std_logic_vector(31 downto 0)
  );
end adder_32bit;
architecture structural of adder_32bit is
  signal cout0,cout1,cout2,cout3 : std_logic;

begin 
  add1: entity adder_8bit
    port map(a(7 downto 0),b(7 downto 0),cin,sum(7 downto 0),cout0);
  add2: entity adder_8bit
    port map(a(15 downto 8),b(15 downto 8),cout0,sum(15 downto 8),cout1);
  add3: entity adder_8bit
    port map(a(23 downto 16),b(23 downto 16),cout1,sum(23 downto 16), cout2);
  add4: entity adder_8bit
    port map(a(31 downto 24),b(31 downto 24),cout2,sum(31 downto 24),cout);
end structural;