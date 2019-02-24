
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library unisim;
use unisim.vcomponents.all;


entity debouncer is
 port(
d: in std_logic;
clk: in std_logic;
do: out std_logic);
end debouncer;

architecture Behavioral of debouncer is
--component fdce port(
--q: out std_logic;
--c: in std_logic;
--ce: in std_logic;
--clr: in std_logic;
--d: in std_logic);
--end component;

--signal qd: std_logic_vector(3 downto 0):="0000";
signal a,b,c,e: std_logic:='0';
--signal temp :std_logic_vector(2 downto 0):="000";

begin
process (clk)
begin
if(clk'event and clk='1') then
e<=c;
c<=b;
b<=a;
a<=d;


--temp<=qd(0)&qd(1)&qd(2);
--qd<=d&temp ;
end if;

--do<=( ( qd(0)) or   qd(1) or qd(2) or qd(3));
do<= (not a and b and c and e) or ( not a and not b and c and e);




--kutu1: fdce port map (qd(0),clk,ce,clr,d);
--kutu2: fdce port map (qd(1),clk,ce,clr,qd(0));
--kutu3: fdce port map (qd(2),clk,ce,clr,qd(1));
--kutu4: fdce port map (qd(3),clk,ce,clr,qd(2));
--do<=(not qd(0) and qd(1) and qd(2) and qd(3));
end process;
end Behavioral;

