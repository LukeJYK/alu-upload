library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.adder_32;
use work.sub_32;
use work.rshift;
use work.lshift;
use work.slt_32;
use work.sltu_32;
use work.mux_16;
use work.mux_16single;
use work.zero_detect;

entity alu_32 is
  port (
    a,b      : in std_logic_vector(31 downto 0);
	 ctrl     : in std_logic_vector(3 downto 0);
    result   : out std_logic_vector(31 downto 0);
    overflow : out std_logic;
	 zero     : out std_logic;
    cout     : out std_logic
  );
end alu_32;

architecture struct of alu_32 is

signal add_result  : std_logic_vector(31 downto 0);--0000
signal sub_result  : std_logic_vector(31 downto 0);--0001
signal and_result  : std_logic_vector(31 downto 0);--0010
signal or_result   : std_logic_vector(31 downto 0);--0011
signal xor_result  : std_logic_vector(31 downto 0);--0100
signal sll_result  : std_logic_vector(31 downto 0);--0101
signal srl_result  : std_logic_vector(31 downto 0);--0110
signal slt_result  : std_logic_vector(31 downto 0);--0111
signal sltu_result : std_logic_vector(31 downto 0);--1000
signal choose_result : std_logic_vector(31 downto 0);
signal overflow_result: std_logic_vector(1 downto 0);
signal cout_result: std_logic_vector(1 downto 0);
begin
    add_map: entity adder_32 port map(a, b, '0', add_result, overflow_result(0), cout_result(0));
	 sub_map: entity sub_32 port map(a, b, sub_result, overflow_result(1), cout_result(1));
	 and_map: and_gate_32 port map(a, b, and_result);
	 or_map : or_gate_32 port map(a, b, or_result);
	 xor_map : xor_gate_32 port map(a, b, xor_result);
	 sll_map : entity lshift port map(a, b(4 downto 0), sll_result);
	 srl_map : entity rshift port map(a, b(4 downto 0), srl_result);
	 slt_map : entity slt_32 port map(a, b, slt_result);
	 sltu_map: entity sltu_32 port map(a, b, sltu_result);
	 --mux decide output
	 output: entity mux_16 port map (ctrl, add_result, sub_result, and_result, or_result, xor_result, sll_result, srl_result, slt_result, sltu_result, 
	 x"00000000",
	 x"00000000",
	 x"00000000",
	 x"00000000",
	 x"00000000",
	 x"00000000",
	 x"00000000",
	choose_result);
	cout_output: entity mux_16single port map(ctrl,cout_result(0),cout_result(1),'0','0','0','0','0','0','0','0','0','0','0','0','0','0',cout);
	overflow_output: entity mux_16single port map(ctrl,overflow_result(0),overflow_result(1),'0','0','0','0','0','0','0','0','0','0','0','0','0','0',overflow);
	zero_output: entity zero_detect port map(choose_result, zero);
	result <= choose_result;   
end struct;