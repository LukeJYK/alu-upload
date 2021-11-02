library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.full_adder;

entity adder_32 is
  port (
    a,b   : in  std_logic_vector(31 downto 0);
    cin: in std_logic;
    result   : out std_logic_vector(31 downto 0);
    overflow : out std_logic;
    cout: out std_logic
  );
end adder_32;

architecture struct of adder_32 is

signal cout_32 : std_logic_vector(31 downto 0);
begin
    zeroadd: entity full_adder port map (a(0), b(0), cin, result(0), cout_32(0));
    Loop1: for i in 1 to 31 generate
      buildAdders: entity full_adder port map (a(i), b(i), cout_32(i-1), result(i), cout_32(i));
    end generate;
    overflow1: xor_gate port map(cout_32(31), cout_32(30),overflow); 
    cout <= cout_32(31);
end struct;