
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
USE ieee.std_logic_arith.all ;


entity colgen is
port(
enable :in std_logic;
clk :in std_logic;
reset: in std_logic;
numofH: in integer range 0 to 799;
numofV: in integer range 0 to 521;
red: out std_logic_vector(2 downto 0);
green: out std_logic_vector(2 downto 0);
blue : out std_logic_vector(1 downto 0);
up,down,right,left: in std_logic;
pouse: in std_logic;
score: out std_logic_vector(7 downto 0)
);
end colgen;

architecture Behavioral of colgen is

component drawbox is
port(	x1: in integer range 0 to 799;
		y1: in integer range 0 to 520;
		ln: in integer range 0 to 799;
		hg: in integer range 0 to 520;
		precolor: in std_logic_vector (7 downto 0);
		color: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0));
end component;
 component drawBackG is
port(	
		color: in std_logic_vector (7 downto 0);
		numofh: in integer range 0 to 799;
		numofv: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0));
end component;
component drawToken is
port(	x1: in integer range 0 to 799;
		precolor: in std_logic_vector (7 downto 0);
		color: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0);
		kulvar: in integer range 0 to 2);
end component;
component drawplayer is
port(	
		precolor: in std_logic_vector (7 downto 0);
		cX: in integer range 0 to 799;
		cY: in integer range 0 to 520;
		colout : out std_logic_vector (7 downto 0);
		up,down,right,left: in std_logic;
		clock: in std_logic;
		posit: out integer range 0 to 2;
		clk : in std_logic);
end component;
signal color1,color2,color3,color4,color5: std_logic_vector(7 downto 0);
signal color: std_logic_vector(7 downto 0):="00000111";
signal mx: integer range 0 to 799:=500;
signal mx2: integer range 0 to 799:=400;
signal mx3: integer range 0 to 799:=300;
signal point: std_logic_vector (7 downto 0);
signal clockofp: std_logic:='0';
signal positofp: integer range 0 to 2;
signal positoftok0: integer range 0 to 2:=0;
signal positoftok1: integer range 0 to 2:=1;
signal positoftok2: integer range 0 to 2:=2;
signal stop: std_logic:='0';
begin
	kutu0: drawBackg port map(color,numofH,numofV,color1);
	kutu1: drawtoken port map(mx,color1,"00011100",numofh,numofv,color2,positoftok0);
	kutu2: drawtoken port map(mx2,color2,"11011100",numofh,numofv,color3,positoftok1);
	kutu3: drawtoken port map(mx3,color3,"11011010",numofh,numofv,color4,positoftok2);
	kutu4: drawplayer port map(color4,numofh,numofv,color5,up,down,right,left,clockofp,positofp,clk);
	
	
	
pro:process(clk) begin
if rising_edge(clk) then 
	if enable='0' then 
	color<="00000000";
	end if;
	if reset='0' then 
	mx<=500;
	mx2<=400;
	mx3<=300;
	stop<='0';
	point<="00000000";
	end if;
	if reset='1' and enable='1' then
	color<="11101101";
	end if;
	
	if pouse='0' then
	if numofV=50 and numofh=5 and stop ='0' then 
			clockofp<=not clockofp;
			mx<=mx-2;
			mx2<=mx2-2;
			mx3<=mx3-2;
	end if;
	
	
	if mx<120 then
		mx<=500;
		if positofp=positoftok0 then 
		point<=point+"00000001";
		else 
		stop<='1';
		end if;
		end if;
	if mx2<120 then
		mx2<=500;
		if positofp=positoftok1 then 
		point<=point+"00000001";
		else 
		stop<='1';
		end if;
		end if;
	if mx3<120 then
	if positofp=positoftok2 then 
		point<=point+"00000001";
		else 
		stop<='1';
		end if;
		mx3<=500;
		end if;
		
		
else
point<="00000000";
stop<='0';
mx<=500;
mx2<=400;
mx3<=300;
end if;

end if;

red<=color5(7 downto 5);
green<= color5(4 downto 2);
blue<= color5(1 downto 0);
end process;

score <= point;

	

end Behavioral;

