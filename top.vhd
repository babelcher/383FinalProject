----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:35 04/30/2014 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
	port(
			CLK : in std_logic;
			RESET : in std_logic;
			INFRARED : in std_logic;
			BUTTON : in std_logic;
			LED : out std_logic_vector(6 downto 0);
			LIGHT : out std_logic_vector(6 downto 0));
end top;

architecture Behavioral of top is

	
	signal led_reg: std_logic_vector(6 downto 0);
	signal count_reg : unsigned(10 downto 0):= "00000000000";
	signal first : std_logic;

	
begin


	
	LightProcess: process(CLK, INFRARED)
	begin
		if rising_edge(clk) then
			if (INFRARED = '0') then
				led_reg <= "0000000";
				first <= '1';
			elsif (INFRARED = '1') then
				led_reg <= "1111111";
				first <= '0';
			end if;
		end if;
		
	end process;
	


	
--output logic

	LED <= led_reg;
	


end Behavioral;

