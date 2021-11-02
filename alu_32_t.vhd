library ieee; 
use ieee.std_logic_1164.all; 
use work.alu_32;
entity alu_32_t is
end alu_32_t;  

architecture behavior of alu_32_t is 
signal    a        : std_logic_vector(31 downto 0);
signal	 b        : std_logic_vector(31 downto 0);
signal	 ctrl     : std_logic_vector(3 downto 0);
signal    result   : std_logic_vector(31 downto 0);
signal    overflow : std_logic;
signal	 zero     : std_logic;
signal    cout     : std_logic;
   
component alu_32 is 
	  port (
	 a        : in std_logic_vector(31 downto 0);
	 b        : in std_logic_vector(31 downto 0);
	 ctrl     : in std_logic_vector(3 downto 0);
    result   : out std_logic_vector(31 downto 0);
    overflow : out std_logic;
	 zero     : out std_logic;
    cout     : out std_logic
	  );
end component alu_32; 

begin 
  test_comp:  alu_32 --instantiate full adder
    port map(
a => a,
b => b,
ctrl =>ctrl,
result => result,
overflow => overflow,
zero => zero,
cout => cout
  );
  
  
testbench: process
begin
	-- Mode 000: Addition, PASSED
	a <= "00000000000000000000000000000001"; 
	b <= "00000000000000000000000000000000";
	ctrl <= "0000";
	wait for 10 ns; 

	a <= "00000000000000000000000000000001"; 
	b <= "00000000000000000000000000000001";
	ctrl <= "0000";
	wait for 10 ns; 

	a <= "00000000000000000000000000000010";
	wait for 10 ns; 

	a <= "11111111111111111111111111111111"; 
	b <= "00000000000000000000000000000001";
	wait for 10 ns; 

	-- Mode 001 SUB, PASSED
	a <= "00000000000000000000000000000011"; 
	b <= "00000000000000000000000000000001";
	ctrl <= "0001";
	wait for 10 ns; 

	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000001";
	wait for 10 ns; 

	a <= "00000000000000000000000000000000"; 
	b <= "00000000000000000000000000000001";
	wait for 10 ns; 

	-- Mode 010 AND (Bitwise), PASSED
	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000101";
	ctrl <= "0010";
	wait for 10 ns; 

	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000111";
	wait for 10 ns; 

	a <= "11111111111111111111111111111111"; 
	b <= "00000000000000000000000000000000";
	wait for 10 ns; 

	a <= "11111111111111111111111111111111"; 
	b <= "11111111111111111111111111111111";
	wait for 10 ns; 

	-- Mode 0011 OR (Bitwise), PASSED
	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000101";
	ctrl <= "0011";
	wait for 10 ns; 

	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000111";
	wait for 10 ns; 

	a <= "11111111111111111111111111111111"; 
	b <= "00000000000000000000000000000000";
	wait for 10 ns; 

	a <= "11111111111111111111111111111111"; 
	b <= "11110000000000000000000000000000";
	wait for 10 ns;
	-- Mode 0100 SLL
	a <= "00000000000000000000000000000001"; 
	b <= "00000000000000000000000000000011";
	ctrl <= "0101";
	wait for 10 ns;

	a <= "00000000000000000000000000000001"; 
	b <= "00000000000000000000000000000010";
	wait for 10 ns;

	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000010";
	wait for 10 ns;

	a <= "00000000000000000000000000000011"; 
	b <= "00000000000000000000000000000010";
	wait for 10 ns;
	-- Mode 0101 SLT, returns 1 if a < b, PASSED
	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000001";
	ctrl <= "0111";
	wait for 10 ns; 

	a <= "00000000000000000000000000000001"; 
	b <= "00000000000000000000000000000110";
	wait for 10 ns; 


	a <= "11111111111111111111111111100000"; 
	b <= "00000111111111111111111111111111";
	wait for 10 ns; 

	-- Mode 0110 SLTU, returns 1 if a < b (unsigned #s), PASSED
	a <= "00000000000000000000000000000010"; 
	b <= "00000000000000000000000000000001";
	ctrl <= "1000";
	wait for 10 ns; 

	a <= "11111111111111111111111111100000"; --Should return 0
	b <= "00000111111111111111111111111111";
	wait for 10 ns; 

	a <= "00000000000000000000000000000001"; 
	b <= "00000000000000000000000000000110";
	wait for 10 ns; 
	a <= "00000000000000000000000000000001"; 
	b <= "00000000000000000000000000000000";
	wait for 10 ns;
	a <= "00000000000000000000000000001110"; 
	b <= "00000000000000000000000000000111";
	wait for 10 ns;
	a <= "11111111111111111111111111111110"; 
	b <= "00000000000000000000000000000111";
	wait for 10 ns;
	-- Test zero bit set
	a <= "00000000000000000000000000000000"; 
	b <= "00000000000000000000000000000000";
	wait for 10 ns; 
wait; --halt process to prevent infinite run
end process testbench;

end architecture behavior; 