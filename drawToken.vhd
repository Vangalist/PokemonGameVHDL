
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity drawToken is
port(	x1: in integer range 0 to 799;
		precolor: in std_logic_vector (7 downto 0);
		color: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0);
		kulvar: in integer range 0 to 2);

end drawToken;

architecture Behavioral of drawToken is

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

component drawCircle is
port(	x1: in integer range 0 to 799;
		y1: in integer range 0 to 520;
		Rad: in integer range 0 to 799;
		precolor: in std_logic_vector (7 downto 0);
		color: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0));
end component;

signal color1,color2,color3: std_logic_vector (7 downto 0);
signal y1,y2,y3 : integer range 0 to 520;
signal x2,x3 : integer range 0 to 799;

begin
y1<=220+60*kulvar;
y2<=y1+40;
x2<=x1+40;
--kutu0:drawcircle port map (x2,y2,40,precolor,"10010000",cx,cy,color1);
--kutu1:drawcircle port map ( x2,y2,30,color1,"11111100",cx,cy,color2 );
--kutu2:drawbox port map( x3 ,y3,20,40,color2,color,cx,cy,colout);

kutuball1: drawcircle port map (x2,y2,40,precolor,"00000000",cx,cy,color1);
--kutuball2: drawcircle port map (x2,y2,5,color2,"00000000",cx,cy,color3);
--kutuball3: drawcircle port map (x2,y2,3,color3,color,cx,cy,colout);

process (cx,cy) begin

if (x2-cx)*(x2-cx)+(y2-cy)*(y2-cy)<1225 and cy<(y2-2) then
colout <= "11100000";
elsif (x2-cx)*(x2-cx)+(y2-cy)*(y2-cy)<1225 and (cy >(y2+2)) then
colout <= "11111111";
else
colout <= color1;
end if;



end process;

end Behavioral;

