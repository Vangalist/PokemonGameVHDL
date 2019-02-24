LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_arith.all ;
USE ieee.std_logic_unsigned.all;

entity newhorizon is
port(
reset: in std_logic;
vga_clk: in std_logic;
col_enable: out std_logic;
hsync: out std_logic;
numofH: out integer range 0 to 799);
end newhorizon;

architecture Behavioral of newhorizon is
signal count: integer range 0 to 799 :=0;
signal tempH : std_logic :='0';
signal col:std_logic:='0';
begin
hsycs:process(vga_clk)
begin	
		if rising_edge(vga_clk) then
		if reset='0' then
		count<=0;
		tempH<='0';
		else
			if count <640 		then 
			tempH<='1';
			col<='1';
			elsif count <656  then 
			col<='0';
			elsif count < 752 then
			temph<='0';
			elsif count< 800  then
			temph<='1'; 
			end if;
			
			if count=799 then 
			count <= 0;
			else
				count<=count+1;
			end if;
		end if;
		end if;
			numofH <= count;
				hsync<=temph;
			col_enable <= col;

end process; 	
end Behavioral;

