
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity drawplayer is
port(	
		precolor: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0);
		up,down,right,left: in std_logic;
		clock : in std_logic;
		posit: out  integer range 0 to 2;
		clk : in std_logic);
		
end drawplayer;

architecture Behavioral of drawplayer is

component adresser is
port(
	x1		: in integer range 0 to 63;
	y1		: in integer range 0 to 63;
	clc	: in std_logic;
	colout: out std_logic_vector (7 downto 0)
);
end component;

signal x,y: integer range 0 to 63;
signal col: std_logic_vector(7 downto 0);
signal x1: integer range 0 to 799;
signal y1: integer range 0 to 520;
signal kulvar: integer range 0 to 2;

begin

process (cx,cy) begin
if (cx>x1) and (cx<x1+64) and (cy>y1) and (cy<y1+64) then
x <= cx-x1;
y <= cy-y1;
else
x <= 0;
y <= 0;
end if;
end process;

drawash: adresser port map (x,y,clk,col);

process (col) begin
if col="00011100" then
colout <= precolor;
else
colout <= col;
end if;
end process;

process(clock)
begin
if rising_edge(clock) then
if up ='1' and (not (kulvar=0)) then 
y1<=y1-60;
kulvar<=kulvar-1;
end if;
if down ='1' and not (kulvar =2) then 
y1<=y1+60;
kulvar<=kulvar+1;
end if;

--if left ='1' then 
--rank<=rank-1;
--end if;
--if right ='1'  then 
--rank<=rank+1;
--end if;
--
--if rank =0 then
--color<=pcolor1;
--elsif rank =1 then
--color<=pcolor2;
--elsif rank =2 then
--color<=pcolor3;
--elsif rank =3 then
--color<=pcolor4;
--end if;

posit<=kulvar;

end if;
end process;
end Behavioral;

