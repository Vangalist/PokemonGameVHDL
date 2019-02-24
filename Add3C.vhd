library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Add3C is

Port( B: in std_logic_vector (3 downto 0);
		D: out std_logic_vector (3 downto 0)
		);

end Add3C;

architecture Behavioral of Add3C is

begin

with B select

D <= 	"0000" when "0000",
		"0001" when "0001",
		"0010" when "0010",
		"0011" when "0011",
		"0100" when "0100",
		"1000" when "0101",
		"1001" when "0110",
		"1010" when "0111",
		"1011" when "1000",
		"1100" when "1001",
		"0000" when others;

end Behavioral;

