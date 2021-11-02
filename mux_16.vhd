library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
--16 to 1 0-31
entity mux_16 is
	port(
		sel: in std_logic_vector(3 downto 0);
		choice0: in std_logic_vector(31 downto 0); 
		choice1: in std_logic_vector(31 downto 0); 
		choice2: in std_logic_vector(31 downto 0); 
		choice3: in std_logic_vector(31 downto 0); 
		choice4: in std_logic_vector(31 downto 0); 
		choice5: in std_logic_vector(31 downto 0); 
		choice6: in std_logic_vector(31 downto 0); 
		choice7: in std_logic_vector(31 downto 0); 
		choice8: in std_logic_vector(31 downto 0); 
		choice9: in std_logic_vector(31 downto 0); 
		choice10: in std_logic_vector(31 downto 0); 
		choice11: in std_logic_vector(31 downto 0); 
		choice12: in std_logic_vector(31 downto 0); 
		choice13: in std_logic_vector(31 downto 0); 
		choice14: in std_logic_vector(31 downto 0); 
		choice15: in std_logic_vector(31 downto 0); 
		result: out std_logic_vector(31 downto 0)
		);
end mux_16;

architecture struct of mux_16 is
signal firstFilter_0,firstFilter_1,firstFilter_2,firstFilter_3, firstFilter_4, firstFilter_5, firstFilter_6, firstFilter_7 : std_logic_vector(31 downto 0);
signal secondFilter_0,secondFilter_1, secondFilter_2, secondFilter_3 : std_logic_vector(31 downto 0);
signal thirdFilter_0,thirdFilter_1: std_logic_vector(31 downto 0);
	begin
    mux1:mux_32 port map (sel(0),choice0, choice1, firstFilter_0);
    mux2:mux_32 port map (sel(0),choice2, choice3, firstFilter_1);
    mux3:mux_32 port map (sel(0),choice4, choice5, firstFilter_2);
    mux4:mux_32 port map (sel(0),choice6, choice7, firstFilter_3);
	 mux5:mux_32 port map (sel(0),choice8, choice9, firstFilter_4);
	 mux6:mux_32 port map (sel(0),choice10, choice11, firstFilter_5);
	 mux7:mux_32 port map (sel(0),choice12, choice13, firstFilter_6);
	 mux8:mux_32 port map (sel(0),choice14, choice15, firstFilter_7);
	 
	 mux9:mux_32 port map (sel(1),firstFilter_0, firstFilter_1,secondFilter_0);
    mux10:mux_32 port map (sel(1),firstFilter_2, firstFilter_3, secondFilter_1);
	 mux11:mux_32 port map (sel(1),firstFilter_4, firstFilter_5, secondFilter_2);
	 mux12:mux_32 port map (sel(1),firstFilter_6, firstFilter_7, secondFilter_3);
	 
	 mux13:mux_32 port map (sel(2),secondFilter_0, secondFilter_1, thirdFilter_0);
	 mux14:mux_32 port map (sel(2),secondFilter_2, secondFilter_3, thirdFilter_1);
    mux15:mux_32 port map (sel(3),thirdFilter_0, thirdFilter_1, result);

end struct;