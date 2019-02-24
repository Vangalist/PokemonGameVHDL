LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_arith.all ;
USE ieee.std_logic_unsigned.all;

entity drawbox is
port(	x1: in integer range 0 to 799;
		y1: in integer range 0 to 520;
		ln: in integer range 0 to 799;
		hg: in integer range 0 to 520;
		precolor: in std_logic_vector (7 downto 0);
		color: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0));
end drawbox;

architecture Behavioral of drawbox is

signal x2: integer range 0 to 799;
signal y2: integer range 0 to 520;

begin

process(cx,cy)
begin
if (x1 < cx) and (x1+64 > cx) and (y1 < cy) and (y1+64> cy) then
colout <= color;
else
colout <= precolor;
end if;
end process;


end Behavioral;

