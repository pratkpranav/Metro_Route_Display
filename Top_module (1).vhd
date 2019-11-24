----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:19:13 11/12/2019 
-- Design Name: 
-- Module Name:    Top_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_module is
port(clk         : in std_logic;
       R, G, B : out std_logic_vector(0 to 3); 
       --DecodeOutOne, DecodeOutTwo : in std_logic_vector(0 to 3);
		 --clk : in  STD_LOGIC;
		 Out2a : out std_logic_vector(3 downto 0);
		 Out1a : out std_logic_vector(3 downto 0);
		 JA : inout  STD_LOGIC_VECTOR (7 downto 0); -- PmodKYPD is designed to be connected to JA
          --anone : out  STD_LOGIC_VECTOR (3 downto 0);  -- Controls which position of the seven segment display to display
		 an : out STD_LOGIC_VECTOR(3 downto 0);
       --seg : out  STD_LOGIC_VECTOR (6 downto 0);
		 reset : in std_logic;
		 H, V: out std_logic;
		 resets: in std_logic
		 );

end Top_module;

architecture Behavioral of Top_module is
signal Out2 :  std_logic_vector(0 to 3);
signal Out1 :  std_logic_vector(0 to 3);
signal signalreset : std_logic;
signal baudfast : std_logic := '0';
signal signalresets : std_logic ;
signal seg : std_logic_vector(6 downto 0);
begin

Process(clk)
	variable clockerfast : integer range 0 to 200000000;
	begin
		if(clk'event and clk='1' ) then
			clockerfast := clockerfast+1 ; 
			if(clockerfast = 10000000) then
					baudfast <= not baudfast;
					clockerfast := 0;
			end if;
		end if;
	end process;



Process(clk)
begin
if(rising_edge(clk)) then
Out2a <= Out2;
Out1a<= Out1;
end if;
end process;

process(baudfast)
	begin
	if(rising_edge(baudfast)) then
			signalreset <= reset;	
	end if;
	end process;
	
process(baudfast)
        begin
        if(rising_edge(baudfast)) then
                signalresets <= resets;    
        end if;
        end process;


PmodKYPD:
		ENTITY WORK.PmodKYPD(Behavioral)
			PORT MAP(clk,Out2 ,Out1,JA ,an ,seg,signalreset,signalresets);
vgatest: 
		ENTITY WORK.vgatest(test)
			PORT MAP(clk,R, G, B , Out1, Out2,H, V);





end Behavioral;

