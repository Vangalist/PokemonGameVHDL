
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity drawCircle is
port(	x1: in integer range 0 to 799;
		y1: in integer range 0 to 520;
		Rad: in integer range 0 to 799;
		precolor: in std_logic_vector (7 downto 0);
		color: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0));
end drawCircle;

architecture Behavioral of drawCircle is

begin

process(cx,cy)
begin
if (x1-cx)*(x1-cx)+(y1-cy)*(y1-cy)<Rad*Rad then
colout <= color;
else
colout <= precolor;
end if;
end process;

end Behavioral;

