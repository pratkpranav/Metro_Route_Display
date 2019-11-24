----------------------------------------------------------------------------------
-- Company: Digilent Inc 2011
-- Engineer: Michelle Yu  
-- Create Date: 13:28:41 08/18/2011 
--
-- Module Name:    DisplayController - Behavioral 
-- Project Name: 	 PmodKYPD
-- Target Devices: Nexys 3 
-- Tool versions: Xilinx ISE Design Suite 13.2
--
-- Description: 
-- This file defines a DisplayController that controls the seven segment display that works with 
-- the output of the Decoder
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity DisplayController is
    Port ( 
		clk : in STD_LOGIC; 
			  --output from the Decoder
			  DispValOne : in  STD_LOGIC_VECTOR (3 downto 0);
			  DispValTwo : in STD_LOGIC_VECTOR(3 downto 0);
			  --controls the display digits
			  an: out std_logic_vector(3 downto 0);
			  --controls which digit to display
           segOut : out  STD_LOGIC_VECTOR (6 downto 0)); 
end DisplayController;

architecture Behavioral of DisplayController is
signal bool : std_logic := '1';
begin
	-- only display the leftmost digit
	
	
			
process(clk)
begin
	if(rising_edge(clk)) then
	if bool = '1'then
--		with DispValOne select
	--		segOut <=  "1000000" when "0000", --0
--						"1111001" when "0001", --1
	--					"0100100" when "0010", --2
		--				"0110000" when "0011", --3
			--			"0011001" when "0100", --4
				--		"0010010" when "0101", --5
					--	"0000010" when "0110", --6
					--	"1111000" when "0111", --7
				--		"0000000" when "1000", --8
			--			"0010000" when "1001", --9
		--				"0001000" when "1010", --A
	--					"0000011" when "1011", --B
					--	"1000110" when "1100", --C
--						"0100001" when "1101", --D
				--		"0000110" when "1110", --E
			--			"0001110" when "1111", --F
						--"0111111" when others;
						an<="1110";
						
						if DispValOne = "0000" then
							segout <= "1000000";
						end if;
						
						if DispValOne = "0001" then
							segout <= "1111001";
						end if;
						
						if DispValOne = "0010" then
							segout <= "0100100";
						end if;
						
						if DispValOne = "0011" then
							segout <= "0110000";
						end if;
						
						if DispValOne = "0100" then
							segout <= "0011001";
						end if;
						
						if DispValOne = "0101" then
							segout <= "0010010";
						end if;
						
						if DispValOne = "0110" then
							segout <= "0000010";
						end if;
						
						if DispValOne = "0111" then
							segout <= "1111000";
						end if;
						
						if DispValOne = "1000" then
							segout <= "0000000";
						end if;
						
						if DispValOne = "1001" then
							segout <= "0010000";
						end if;
						
						if DispValOne = "1010" then
							segout <= "0001000";
						end if;
						
						if DispValOne = "1011" then
							segout <= "0000011";
						end if;
						
						if DispValOne = "1100" then
							segout <= "1000110";
						end if;
						
						if DispValOne = "1101" then
							segout <= "0100001";
						end if;
						
						if DispValOne = "1110" then
							segout <= "0000110";
						end if;
						
						if DispValOne = "1111" then
							segout <= "0001110";
						end if;
						
						
	
					  
		else
	--		with DispValOne select
	--		segOut <=  "1000000" when "0000", --0
--						"1111001" when "0001", --1
	--					"0100100" when "0010", --2
		--				"0110000" when "0011", --3
			--			"0011001" when "0100", --4
				--		"0010010" when "0101", --5
					--	"0000010" when "0110", --6
					--	"1111000" when "0111", --7
				--		"0000000" when "1000", --8
			--			"0010000" when "1001", --9
		--				"0001000" when "1010", --A
	--					"0000011" when "1011", --B
					--	"1000110" when "1100", --C
--						"0100001" when "1101", --D
				--		"0000110" when "1110", --E
			--			"0001110" when "1111", --F
						--"0111111" when others;
						an<="1101";
						
						if DispValTwo = "0000" then
							segout <= "1000000";
						end if;
						
						if DispValTwo = "0001" then
							segout <= "1111001";
						end if;
						
						if DispValTwo = "0010" then
							segout <= "0100100";
						end if;
						
						if DispValTwo = "0011" then
							segout <= "0110000";
						end if;
						
						if DispValTwo = "0100" then
							segout <= "0011001";
						end if;
						
						if DispValTwo = "0101" then
							segout <= "0010010";
						end if;
						
						if DispValTwo = "0110" then
							segout <= "0000010";
						end if;
						
						if DispValTwo = "0111" then
							segout <= "1111000";
						end if;
						
						if DispValTwo = "1000" then
							segout <= "0000000";
						end if;
						
						if DispValTwo = "1001" then
							segout <= "0010000";
						end if;
						
						if DispValTwo = "1010" then
							segout <= "0001000";
						end if;
						
						if DispValTwo = "1011" then
							segout <= "0000011";
						end if;
						
						if DispValTwo = "1100" then
							segout <= "1000110";
						end if;
						
						if DispValTwo = "1101" then
							segout <= "0100001";
						end if;
						
						if DispValTwo = "1110" then
							segout <= "0000110";
						end if;
						
						if DispValTwo = "1111" then
							segout <= "0001110";
						end if;
						
			end if;
			bool <= not bool;
		end if;
	end process;
end Behavioral;

