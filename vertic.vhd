
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity vertic is
port(
reset: in std_logic;
vga_clk: in std_logic;
col_enable: out std_logic;
Vsync: out std_logic;
numofV : out integer range 0 to 520);
end vertic;

architecture Behavioral of vertic is
signal count: integer range 0 to 520 :=0;
signal tempV : std_logic :='0';
signal col:std_logic:='0';
begin

hsycs:process(vga_clk)
begin	
		if falling_edge(vga_clk) then
		if reset='0' then
		count<=0;
		tempV<='0';
		else
			if count <480 		then 
			tempv<='1';
			col<='1';
			elsif count <490 then 
			col<='0';
			elsif count < 492 then
			tempv<='0';
			elsif count< 521  then
			tempv<='1'; 
			end if;
			
			if count=520 then 
			count <= 0;
			else
				count<=count+1;
			end if;
			
		end if;
		end if;
		numofV<=count;
				vsync<=tempv;
			col_enable <= col;

end process; 	

end Behavioral;

