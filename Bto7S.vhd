library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bto7S is
port (d: in std_logic_vector (3 downto 0);
		s: out std_logic_vector ( 7 downto 0)
		);
end Bto7S;

architecture Behavioral of Bto7S is

begin

with d select
s <=	"11000000" when "0000",
		"11111001" when "0001",
		"10100100" when "0010",
		"10110000" when "0011",
		"10011001" when "0100",
		"10010010" when "0101",
		"10000010" when "0110",
		"11111000" when "0111",
		"10000000" when "1000",
		"10010000" when "1001",
		"11111111" when others;
end Behavioral;

