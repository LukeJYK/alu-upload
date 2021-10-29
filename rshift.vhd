library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
--32bit shift right
entity rshift is
  port (
    a : in std_logic_vector(31 downto 0);
	 sh : in std_logic_vector(4 downto 0);
	 shiftout: out std_logic_vector(31 downto 0)
  );
end rshift;

architecture structural of rshift is
signal sh1,sh2,sh3,sh4: std_logic_vector(31 downto 0);

begin
--layer 1
bigLoop1: FOR i in 0 to 31 GENERATE begin
  Loop1: If i = 31 GENERATE begin
      a1: mux port map(sh(0), a(i), '0', sh1(i));
  end GENERATE;
  Loop2: If i >= 0 AND i <= 30 GENERATE begin
      b1: mux port map(sh(0), a(i), a(i+1), sh1(i));
  end GENERATE;
end GENERATE;

--layer 2
bigLoop2: FOR i in 0 to 31 GENERATE begin
  Loop1: If i >= 30 AND i <= 31 GENERATE begin
      a2: mux port map(sh(1), sh1(i), '0', sh2(i));
  end GENERATE;
  Loop2: If i >= 0 AND i <= 29 GENERATE begin
      b2: mux port map(sh(1), sh1(i), sh1(i+2), sh2(i));
  end GENERATE;
end GENERATE;

--layer 3
bigLoop3: FOR i in 0 to 31 GENERATE begin
  Loop1: If i >= 28 AND i <= 31 GENERATE begin
      a3: mux port map(sh(2), sh2(i), '0', sh3(i));
  end GENERATE;
  Loop2: If i >= 0 AND i <= 27 GENERATE begin
      b3: mux port map(sh(2), sh2(i), sh2(i+4), sh3(i));
  end GENERATE;
end GENERATE;

--layer 4
bigLoop4: FOR i in 0 to 31 GENERATE begin
  Loop1: If i >= 24 AND i <= 31 GENERATE begin
      a4: mux port map(sh(3), sh3(i), '0', sh4(i));
  end GENERATE;
  Loop2: If i >= 0 AND i <= 23 GENERATE begin
      b4: mux port map(sh(3), sh3(i), sh3(i+8), sh4(i));
  end GENERATE;
end GENERATE;

--layer 5
bigLoop5: FOR i in 0 to 31 GENERATE begin
  Loop1: If i >= 16 AND i <= 31 GENERATE begin
      a5: mux port map(sh(4), sh4(i), '0', shiftout(i));
  end GENERATE;
  Loop2: If i >= 0 AND i <= 15 GENERATE begin
      b5: mux port map(sh(4), sh4(i), sh4(i+16), shiftout(i));
  end GENERATE;
end GENERATE;


end structural;