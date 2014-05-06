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

	type light_state is
		(lit_up, not_lit);
	signal light_state_reg, light_state_next: light_state;
	signal COUNTER: std_logic_vector(7 downto 0) := (others => '0');
	signal PRESCALER: std_logic_vector(25 downto 0);
	signal light_on: std_logic_vector(6 downto 0);
	signal count_reg : unsigned(10 downto 0):= "00000000000";
	signal count_next : unsigned(10 downto 0);
--	signal velocity : unsigned(10 downto 0) := to_unsigned(600,11);
	constant REVOLUTION : integer := 600;
	
begin


	
	LightProcess: process(CLK, INFRARED)
	begin
		
			if (INFRARED = '0') then
				light_on <= "0000000";
			elsif (INFRARED = '1') then
				light_on <= "1111111";
				
			end if;
		
	end process;
	

	
	
	LED <= light_on;
	


end Behavioral;
