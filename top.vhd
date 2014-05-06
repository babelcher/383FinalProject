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

	type led_state_type is
		(off, first, second, third, fourth, fifth);
	signal state_reg, state_next: led_state_type;
	signal led_reg, led_next: std_logic_vector(6 downto 0);
	signal count_reg: unsigned(10 downto 0):= "00000000000";
	signal count_next: unsigned(10 downto 0);


	
begin

	--state register
	process(clk, reset)
	begin
		if(reset = '1') then
			state_reg <= off;
		elsif(rising_edge(clk)) then
			state_reg <= state_next;
		end if;
	end process;
	
	--output buffer
	process(clk)
	begin
		if(rising_edge(clk)) then
			led_reg <= led_next;
		end if;
	end process;
	
	
--	count_next <= (others => '0') when state_reg /= state_next else
--						count_reg + 1;
	
	--next state logic
	process(state_reg, led_reg, INFRARED)
	begin
	state_next <= state_reg;
		case state_reg is
			when off =>
				if(INFRARED = '0') then
					state_next <= first;
				elsif(INFRARED = '1') then
					state_next <= off;
				end if;
			when first =>
				state_next <= second;
			when second =>
				state_next <= third;
			when third =>
				state_next <= fourth;
			when fourth =>
				state_next <= fifth;
			when fifth =>
				state_next <= off;
		end case;
	end process;
	
	--look ahead output logic
	process(state_next, led_next)
	begin
	led_next <= "1111111";
		case state_next is
			when off =>
			when first =>
				led_next <= "0000000";
			when second => 
				led_next <= "1110111";
			when third =>
				led_next <= "1110111";
			when fourth =>
				led_next <= "1110111";
			when fifth =>
				led_next <= "0000000";
		end case;
	end process;
	
--	LightProcess: process(CLK, INFRARED)
--	begin
--		if rising_edge(clk) then
--			if (INFRARED = '0') then
--				led_reg <= "0000000";
--				first <= '1';
--			elsif (INFRARED = '1') then
--				led_reg <= "1111111";
--				first <= '0';
--			end if;
--		end if;
--		
--	end process;
	


	

--output logic
	LED <= led_reg;
	


end Behavioral;

