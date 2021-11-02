library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
--16 to 1 0-31
entity mux_16single is
	port(
		sel: in std_logic_vector(3 downto 0);
		choice0: in std_logic; 
		choice1: in std_logic; 
		choice2: in std_logic; 
		choice3: in std_logic; 
		choice4: in std_logic; 
		choice5: in std_logic; 
		choice6: in std_logic; 
		choice7: in std_logic; 
		choice8: in std_logic; 
		choice9: in std_logic; 
		choice10: in std_logic; 
		choice11: in std_logic; 
		choice12: in std_logic; 
		choice13: in std_logic; 
		choice14: in std_logic; 
		choice15: in std_logic; 
		result: out std_logic
		);
end mux_16single;

architecture struct of mux_16single is
signal firstFilter_0,firstFilter_1,firstFilter_2,firstFilter_3, firstFilter_4, firstFilter_5, firstFilter_6, firstFilter_7 : std_logic;
signal secondFilter_0,secondFilter_1, secondFilter_2, secondFilter_3 : std_logic;
signal thirdFilter_0,thirdFilter_1: std_logic;
	begin
    mux1:mux port map (sel(0),choice0, choice1, firstFilter_0);
    mux2:mux port map (sel(0),choice2, choice3, firstFilter_1);
    mux3:mux port map (sel(0),choice4, choice5, firstFilter_2);
    mux4:mux port map (sel(0),choice6, choice7, firstFilter_3);
	 mux5:mux port map (sel(0),choice8, choice9, firstFilter_4);
	 mux6:mux port map (sel(0),choice10, choice11, firstFilter_5);
	 mux7:mux port map (sel(0),choice12, choice13, firstFilter_6);
	 mux8:mux port map (sel(0),choice14, choice15, firstFilter_7);
	 
	 mux9:mux port map (sel(1),firstFilter_0, firstFilter_1,secondFilter_0);
    mux10:mux port map (sel(1),firstFilter_2, firstFilter_3, secondFilter_1);
	 mux11:mux port map (sel(1),firstFilter_4, firstFilter_5, secondFilter_2);
	 mux12:mux port map (sel(1),firstFilter_6, firstFilter_7, secondFilter_3);
	 
	 mux13:mux port map (sel(2),secondFilter_0, secondFilter_1, thirdFilter_0);
	 mux14:mux port map (sel(2),secondFilter_2, secondFilter_3, thirdFilter_1);
    mux15:mux port map (sel(3),thirdFilter_0, thirdFilter_1, result);

end struct;