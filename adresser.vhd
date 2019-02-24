LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
USE ieee.std_logic_arith.all ;
use IEEE.numeric_std.all;

entity adresser is
port(
	x1		: in integer range 0 to 63;
	y1		: in integer range 0 to 63;
	clc	: in std_logic;
	colout: out std_logic_vector (7 downto 0)
);
end adresser;

architecture Behavioral of adresser is

component ash is
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
end component;

signal adr12: std_logic_vector (11 downto 0);
signal col	: std_logic_vector (7 downto 0);

begin

process(x1,y1)
begin
adr12 <= (std_logic_vector(to_unsigned(y1,6)))&(std_logic_vector(to_unsigned(x1,6)));
end process;

Playrom: ash port map (clc,adr12, colout); 

end Behavioral;

