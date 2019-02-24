
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity drawBackG is
port(	
		color: in std_logic_vector (7 downto 0);
		numofh: in integer range 0 to 799;
		numofv: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0));
end drawBackG;

architecture Behavioral of drawBackG is

component drawbox is
port(	x1: in integer range 0 to 799;
		y1: in integer range 0 to 520;
		ln: in integer range 0 to 799;
		hg: in integer range 0 to 520;
		precolor: in std_logic_vector (7 downto 0);
		color: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0));
end component;

signal color3,color4,color5,color6,color7: std_logic_vector(7 downto 0);

begin

	kutu3: drawbox port map(0,260,640,220,color,"11011010",numofh,numofv,color3);
	kutu4: drawbox port map(0,270,640,50,color3,"01100000",numofH,numofV,color4);
	kutu5: drawbox port map(0,330,640,50,color4,"01100000",numofh,numofv,color5);
	kutu6: drawbox port map(0,390,640,50,color5,"01100000",numofh,numofv,color6);
	colout<=color6;
end Behavioral;

