LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
USE ieee.std_logic_arith.all ;

entity fdiv is port(
	reset:	in std_logic;
	sys_clk: in std_logic;
	vga_clk:	out std_logic);
end fdiv;

architecture Behavioral of fdiv is

signal count: std_logic_vector(1 downto 0):="00";

begin

process (sys_clk,reset)
begin
	if reset='0' then
		count<="00";
	elsif rising_edge(sys_clk) then
		count<=count+"01";
	end if;
	
vga_clk<=count(1);
end process;

end Behavioral;

