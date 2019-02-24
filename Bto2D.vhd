library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bto2D is

Port (R: in std_logic_vector  (7 downto 0);
		H: out std_logic_vector (3 downto 0);
		L: out std_logic_vector (3 downto 0));
end Bto2D;

architecture Behavioral of Bto2D is

component Add3C is

Port( B: in std_logic_vector (3 downto 0);
		D: out std_logic_vector (3 downto 0)
		);

end component;

signal i1,i2,i3,i4,i5,i6,i7 : std_logic_vector (3 downto 0);
signal o1,o2,o3,o4,o5,o6,o7 : std_logic_vector (3 downto 0);

begin

A1: Add3C port map (i1,o1);
A2: Add3C port map (i2,o2);
A3: Add3C port map (i3,o3);
A4: Add3C port map (i4,o4);
A5: Add3C port map (i5,o5);
A6: Add3C port map (i6,o6);
A7: Add3C port map (i7,o7);

i1 <= '0'& R(7 downto 5);
i2 <= o1(2 downto 0)&R(4);
i3 <= o2(2 downto 0)&R(3);
i4 <= o3(2 downto 0)&R(2);
i5 <= '0'&o1(3)&o2(3)&o3(3);
i6 <= o5(2 downto 0)&o4(3);
i7 <= o4(2 downto 0)&R(1);

H <= o6(2 downto 0)&o7(3);
L <= o7(2 downto 0)&R(1);

end Behavioral;

