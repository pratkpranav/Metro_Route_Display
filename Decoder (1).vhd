----------------------------------------------------------------------------------
-- Company: Digilent Inc 2011
-- Engineer: Pratik Pranav 
-- Create Date:      17:18:24 08/23/2011 
--
-- Module Name:    Decoder - Behavioral 
-- Project Name:  PmodKYPD
-- Target Devices: Basys3
-- Tool versions: Xilinx ISE 13.2
-- Description: 
--	This file defines a component Decoder for the demo project PmodKYPD. 
-- The Decoder scans each column by asserting a low to the pin corresponding to the column 
-- at 1KHz. After a column is asserted low, each row pin is checked. 
-- When a row pin is detected to be low, the key that was pressed could be determined.
--
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Decoder is
    Port (
			  clk : in  STD_LOGIC;
          Row : in  STD_LOGIC_VECTOR (3 downto 0);
			 Col : out  STD_LOGIC_VECTOR (3 downto 0);
          DecodeOutOne : out  STD_LOGIC_VECTOR (3 downto 0);
			 DecodeOutTwo : out STD_LOGIC_VECTOR(3 downto 0);
			 reset : in std_logic;
			 resets : in std_logic);
		--	 check : out std_logic_vector(29 downto 0));
end Decoder;

architecture Behavioral of Decoder is
signal sclk :STD_LOGIC_VECTOR(19 downto 0) := "00000000000000000000";
signal onesec : STD_LOGIC_VECTOR(29 downto 0 ) := "000000000000000000000000000000";
signal bool : std_logic := '0';
signal boolhelper : integer := 0;
signal auxiliarysignal : std_logic := '0';
signal count : integer := 0;
signal signalDecodeOutOne : std_logic_vector(3 downto 0);
signal signalDecodeOutTwo : std_logic_vector(3 downto 0);
signal signaldecodeouton : std_logic_vector(3 downto 0);
begin

	process(clk,reset)
		begin 
		
		if resets = '1' then
		
                    DecodeOutOne <= signalDecodeOutOne;
                    DecodeOutTwo <= signalDecodeOutTwo;
		
		end if;
			
        if reset = '1' then
          --- auxiliarysignal <= '0';
          -- count <= 0;
            -- DecodeOutTwo <= "0000";
                signalDecodeOutOne <= signaldecodeouton;
 --           end if;
		elsif clk'event and clk = '1' then
         if count = 4 then
         count <= 0;
         end if;
             -- 1ms
             if sclk = "00011000011010100000" then 
                 --C1
                 Col<= "0111";
                 sclk <= sclk+1;
             -- check row pins
             elsif sclk = "00011000011010101000" then    
                 --R1
                 if Row = "0111" then
                     if bool = '0' then
                         signalDecodeOutOne <= "0001";    --1
                                                               --        signaldecodeoutone2 <= "0001";
                         auxiliarysignal <= '1';
                         count <= 0;
                     elsif bool = '1' then
                                                  signaldecodeouton <= "0001";
                         signalDecodeOutTwo <= "0001";
                     end if;
                     
                 --R2
                 elsif Row = "1011" then
                     if bool = '0' then
                         signalDecodeOutOne <= "0100"; --4
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                                                                 -- signaldecodeout2 <= "0100";                                                                                                                  signaldecodeoutone <= "0100";
                                                                 elsif bool = '1' then
                                                                              --         signalDecodeOutOne <= signaldecodeoutone;

                                                                                                                                       signaldecodeouton <= "0100";

                         signalDecodeOutTwo <= "0100";
                     end if;
                 --R3
                 elsif Row = "1101" then
                     if bool = '0' then
                         signalDecodeOutOne <= "0111"; --7
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                                                                                                                                                                                    signaldecodeoutone <= "0111";
                     
                                                                 elsif bool = '1' then
                                                                             --         signalDecodeOutOne <= signaldecodeoutone;

                                                                                                                                      signaldecodeouton <= "0111";

                         signalDecodeOutTwo <= "0111";
                     end if;
                 --R4
                 elsif Row = "1110" then
                     if bool = '0' then
                         signalDecodeOutOne <= "0000"; --0
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                                                                                                                                                                                    signaldecodeoutone <= "0000";
                     
                                                                 elsif bool = '1' then
                                                                             --         DecodeOutOne <= signaldecodeoutone;

                                                                                                                                    signaldecodeouton <= "0000";

                         signalDecodeOutTwo <= "0000";
                     end if;
                 else
                     count <= count + 1;
                 end if;
                 sclk <= sclk+1;
             -- 2ms
             elsif sclk = "00110000110101000000" then    
                 --C2
                 Col<= "1011";
                 sclk <= sclk+1;
             -- check row pins
             elsif sclk = "00110000110101001000" then    
                 --R1
                 if Row = "0111" then        
                     if bool = '0' then
                         signalDecodeOutOne <= "0010"; --2
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                         
                                                                                                                                                                                        signaldecodeoutone <= "0010";
                                                                 elsif bool = '1' then
                                                                                      --DecodeOutOne <= signaldecodeoutone;

                                                                                                                                      signaldecodeouton <= "0010";

                         signalDecodeOutTwo <= "0010";
                     end if;
                 --R2
                 elsif Row = "1011" then
                     if bool = '0' then
                         signalDecodeOutOne <= "0101"; --5
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                                                                                                                                                                                    signaldecodeoutone <= "0101";
                     
                                                                 elsif bool = '1' then              --       DecodeOutOne <= signaldecodeoutone;

                                                                                                                                      signaldecodeouton<= "0101";

                         signalDecodeOutTwo <= "0101";
                     end if;
                 --R3
                 elsif Row = "1101" then
                     if bool = '0' then
                         signalDecodeOutOne <= "1000"; --8
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                                                                                                                                                                                    signaldecodeoutone <= "1000";
                     
                                                                 elsif bool = '1' then  --                   DecodeOutOne <= signaldecodeoutone;

                                                                                                                                       signaldecodeouton <= "1000";

                         signalDecodeOutTwo <= "1000";
                     end if;
                 --R4
                 elsif Row = "1110" then
                 if bool = '0' then
                     signalDecodeOutOne <= "1111"; --F
                                         auxiliarysignal <= '1';
                                             count <= 0;
                                                                                                                                                                        signaldecodeoutone <= "1111";
                     
                                                             elsif bool = '1' then         --            DecodeOutOne <= signaldecodeoutone;

                                                                                                                              signaldecodeouton<= "1111";

                     signalDecodeOutTwo <= "1111";
                 end if;
                                     else
                                         count <= count + 1;
                 end if;
                 sclk <= sclk+1;    
             --3ms
             elsif sclk = "01001001001111100000" then 
                 --C3
                 Col<= "1101";
                 sclk <= sclk+1;
             -- check row pins
             elsif sclk = "01001001001111101000" then 
                 --R1
                 if Row = "0111" then
                     if bool = '0' then
                         signalDecodeOutOne <= "0011"; --3    
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                     
                                                                                                                                                                                        signaldecodeoutone <= "0011";
                                                                 elsif bool = '1' then               --      DecodeOutOne <= signaldecodeoutone;

                                                                                                                                       signaldecodeouton <= "0011";

                         signalDecodeOutTwo <= "0011";
                     end if;
                 --R2
                 elsif Row = "1011" then
                     if bool = '0' then
                         signalDecodeOutOne <= "0110"; --6
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                                                                                                                                                                                    signaldecodeoutone <= "0110";
                     
                                                                 elsif bool = '1' then    --                 DecodeOutOne <= signaldecodeoutone;

                                                                                                                                  signaldecodeouton <= "0110";

                         signalDecodeOutTwo <= "0110";
                     end if;
                 --R3
                 elsif Row = "1101" then
                     if bool = '0' then
                         signalDecodeOutOne <= "1001"; --9;
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                                                                                                                                                                                    signaldecodeoutone <= "1001";
                     
                                                                 elsif bool = '1' then                     --DecodeOutOne <= signaldecodeoutone;

                                                                                                                                      signaldecodeouton <= "1001";

                         signalDecodeOutTwo <= "1001";
                     end if;
                 --R4
                 elsif Row = "1110" then
                     if bool = '0' then
                         signalDecodeOutOne <= "1110"; --E
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                     
                                                                                                                                                                                        signaldecodeoutone <= "1110";
                                                                 elsif bool = '1' then                    -- DecodeOutOne <= signaldecodeoutone;
signaldecodeouton <= "1110";

                         signalDecodeOutTwo <= "1110";
                     end if;
                                         else
                                             count <= count + 1;
                 end if;
                 sclk <= sclk+1;
             --4ms
             elsif sclk = "01100001101010000000" then             
                 --C4
                 Col<= "1110";
                 sclk <= sclk+1;
             -- check row pins
             elsif sclk = "01100001101010001000" then 
                 --R1
                 if Row = "0111" then
                     if bool = '0' then
                         signalDecodeOutOne <= "1010"; --A
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                     
                                                                 elsif bool = '1' then                   --  DecodeOutOne <= signaldecodeoutone;

                                                                                                                                  signaldecodeouton <= "1010";

                         signalDecodeOutTwo <= "1010";
                     end if;
                 --R2
                 elsif Row = "1011" then
                     if bool = '0' then
                         signalDecodeOutOne <= "1011"; --B
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                     
                                                                 elsif bool = '1' then     --                DecodeOutOne <= signaldecodeoutone;

                                                                                                                                       signaldecodeouton <= "1011";

                         signalDecodeOutTwo <= "1011";
                     end if;
                 --R3
                 elsif Row = "1101" then
                     if bool = '0' then
                         signalDecodeOutOne <= "1100"; --C
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                     
                                                                 elsif bool = '1' then         --            DecodeOutOne <= signaldecodeoutone;

                                                                                                                                      signaldecodeouton <= "1100";

                         signalDecodeOutTwo <= "1100";
                     end if;
                 --R4
                 elsif Row = "1110" then
                     if bool = '0' then
                         signalDecodeOutOne <= "1101"; --D
                                             auxiliarysignal <= '1';
                                                 count <= 0;
                     --
                                                                 elsif bool = '1' then   --                  DecodeOutOne <= signaldecodeoutone;

                                                                                                                                       signaldecodeouton <= "1101";

                         signalDecodeOutTwo <= "1101";
                     end if;
                                         else
                                             count <= count + 1;
                 end if;
                 sclk <= "00000000000000000000";    
             else
                 sclk <= sclk+1;    
             end if;
         end if;
	end process;
	
	process(auxiliarysignal)
        
        begin
        if auxiliarysignal = '1' then
            
               boolhelper <=  boolhelper + 1;
            
            end if;
            if boolhelper = 2 then
               bool <= '1';
            end if;

     --   if boolhelper = 2 then
       --    bool <= '1';
          -- else
          -- bool <= '0';
     --   end if;
        
        end process;

	
	
	
	
	--process(auxiliarysignal)
	
	--begin
	
	
	
	
	
	
	
       -- if auxiliarysignal = '1' then
       -- 
        --   boolhelper <=  boolhelper + 1;
        
       -- end if;
        --if bool = '1' then
          -- bool <= '';
          -- else
         --  bool <= '0';
         --  boolhelper <= 0;
        --end if;
        
        --end process;
            
	
	
	--if auxiliarysignal = '1' then
        
     --      boolhelper <=  boolhelper + 1;
        
    --    end if;
    --    if boolhelper = 2 then
     --      bool <= '1';
      --     else 
      --     bool <= '0';
      --  end if;
        
	
	--if auxiliarysignal = '1' then
	
	  -- boolhelper <=  boolhelper + 1;
--	else
	--   boolhelper <= 0;
--	end if;
--	if boolhelper = 2 then
--	   bool <= '1';
	--   boolhelper <= 0;
	-- else
	--   bool <= '0';
	--end if;
	
	--end process;
		
		
						 
end Behavioral;

