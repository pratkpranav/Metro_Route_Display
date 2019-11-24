----------------------------------------------------------------------------------
-- Company: Digilent Inc 2011
-- Engineer: Michelle Yu  
-- Create Date:    17:05:39 08/23/2011 
--
-- Module Name:    PmodKYPD - Behavioral 
-- Project Name:  PmodKYPD
-- Target Devices: Nexys3
-- Tool versions: Xilinx ISE 13.2 
-- Description: 
--	This file defines a project that outputs the key pressed on the PmodKYPD to the seven segment display
--
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PmodKYPD is
    Port ( 
			  clk : in  STD_LOGIC;
			  Out2 : out std_logic_vector(3 downto 0);
			  Out1 : out std_logic_vector(3 downto 0);
			  JA : inout  STD_LOGIC_VECTOR (7 downto 0); -- PmodKYPD is designed to be connected to JA
           --anone : out  STD_LOGIC_VECTOR (3 downto 0);  -- Controls which position of the seven segment display to display
			  an : out STD_LOGIC_VECTOR(3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
			  reset : in std_logic;
			  resets : in std_logic
); -- digit to display on the seven segment display 
			--  checkan : out  STD_LOGIC_VECTOR (19 downto 0));
end PmodKYPD;

architecture Behavioral of PmodKYPD is



component Decoder is
	Port (
			 clk : in  STD_LOGIC;
          Row : in  STD_LOGIC_VECTOR (3 downto 0);
			 Col : out  STD_LOGIC_VECTOR (3 downto 0);
          DecodeOutOne : out  STD_LOGIC_VECTOR (3 downto 0);
			 DecodeOutTwo : out STD_LOGIC_VECTOR(3 downto 0);
			 reset : in std_logic;
			 resets : in std_logic
	--		 check : out std_logic_vector(29 downto 0)
			 );
			 
	end component;

component DisplayController is
	Port (
				clk : in std_logic;
			  DispValOne : in  STD_LOGIC_VECTOR (3 downto 0);
			  DispValTwo : in STD_LOGIC_VECTOR(3 downto 0); 
			  an : out STD_LOGIC_VECTOR(3 downto 0);
           segOut : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;

signal DecodeOne: STD_LOGIC_VECTOR (3 downto 0);
signal DecodeTwo: STD_LOGIC_VECTOR(3 downto 0);
--signal check : std_logic_vector(29 downto 0);
begin



	
	
	C0: Decoder port map (clk=>clk, Row =>JA(7 downto 4), Col=>JA(3 downto 0), DecodeOutOne=> DecodeOne, DecodeOutTwo=>DecodeTwo,reset => reset, resets => resets );
	
	C1: DisplayController port map (clk => clk ,DispValOne=>DecodeOne,DispValTwo=> DecodeTwo, an => an, segOut=>seg );
	
	process(clk)
	begin
	
	if(rising_edge(clk)) then
	Out2 <= DecodeTwo;
	Out1 <= DecodeOne;
	end if;
	end process;


end Behavioral;

