library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity finalform is
port(
		nrst		: in std_logic;
		sys_clk	: in std_logic;
		HSYNC		: out std_logic;
		VSYNC		: out std_logic;
		RED		: out std_logic_vector (2 downto 0);
		GREEN		: out std_logic_vector (2 downto 0);
		BLUE		: out std_logic_vector	(1 downto 0);
		up,down,right,left	: in std_logic;
		pouse		: in std_logic;
		sseg_ca	: out std_logic_vector (7 downto 0);
		sseg_an	: out std_logic_vector (3 downto 0));
end finalform;

architecture Behavioral of finalform is
 
component newhorizon is
port(
		reset			: in std_logic;
		vga_clk		: in std_logic;
		col_enable	: out std_logic;
		hsync			: out std_logic;
		numofH		: out integer range 0 to 799);
end component; 	

component vertic is
port(
		reset			: in std_logic;
		vga_clk		: in std_logic;
		col_enable	: out std_logic;
		Vsync			: out std_logic;
		numofV		: out integer range 0 to 520);
end component;
 
component fdiv is 
port(
		reset		: in std_logic;
		sys_clk	: in std_logic;
		vga_clk	: out std_logic);
end component;

component colgen is
port(
		enable 	: in std_logic;
		clk		: in std_logic;
		reset		: in std_logic;
		numofH	: in integer range 0 to 799;
		numofV	: in integer range 0 to 520;
		red		: out std_logic_vector(2 downto 0);
		green		: out std_logic_vector(2 downto 0);
		blue 		: out std_logic_vector(1 downto 0);
		up,down,right,left	: in std_logic;
		pouse		: in std_logic;
		score		: in std_logic_vector (7 downto 0));
end  component;

component debouncer is
port(
		d		: in std_logic;
		clk	: in std_logic;
		do		: out std_logic);
end component;

component Bto2D is
Port(
		R: in std_logic_vector  (7 downto 0);
		H: out std_logic_vector (3 downto 0);
		L: out std_logic_vector (3 downto 0));
end component;

component Bto7S is
port(
		d: in std_logic_vector (3 downto 0);
		s: out std_logic_vector ( 7 downto 0));
end component;

component nexys3_sseg_driver is
port( 
		MY_CLK  : in  STD_LOGIC;
		DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
		SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
		SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Ven,Hen,enable, vga_clk,tempH 	: std_logic :='0';
signal nrs,r,l,u,d							: std_logic;
signal numV										: integer range 0 to 520;
signal numH										: integer range 0 to 799;
signal score									: std_logic_vector(7 downto 0);
signal H3,L3									: std_logic_vector(3 downto 0);
signal H7,L7									: std_logic_vector(7 downto 0);

begin

nrs 		<= not nrst;

enable 	<= hen and ven;

freq_div	: fdiv 			port map(nrs,sys_clk,vga_clk);

Hge		: newhorizon 	port map(nrs,vga_clk,Hen,tempH,numH);
Vge		: vertic 		port map(nrs,tempH,Ven,VSYNC,numV);

deb_l		: debouncer 	port map(left,Ven,l);
deb_r		: debouncer 	port map(right,Ven,r);
deb_u		: debouncer 	port map(up,Ven,u);
deb_d		: debouncer 	port map(down,Ven,d);

renk		: colgen 		port map(enable,vga_clk,nrs,numH,numV,red,green,blue,u,d,r,l,pouse,score);

dig		: Bto2D 			port map(score,H3,L3);
conv1		: Bto7S			port map(H3,H7);
conv2		: Bto7S			port map(L3,L7);

sseg		: nexys3_sseg_driver 	port map (sys_clk,"11111111","11111111",H7,L7,sseg_ca,sseg_an);

hsync		<= temph;

end Behavioral;

