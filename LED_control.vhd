----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:42 05/06/2014 
-- Design Name: 
-- Module Name:    LED_control - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity LED_control is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  infrared : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end LED_control;

architecture Behavioral of LED_control is

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
	
	--count register
		process(clk, reset)
		begin
			if (reset = '1') then
				count_reg <= (others => '0');
			elsif rising_edge(clk) then
				count_reg <= count_next;
			end if;
		end process;
	
	count_next <= (others => '0') when state_reg /= state_next else
						count_reg + 1;
	
	--next state logic
	process(state_reg, infrared)
	begin
	state_next <= state_reg;
		case state_reg is
			when off =>
				
					if(INFRARED = '0') then
						state_next <= first;
					
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
	process(state_next, led_next, led_reg, state_reg)
	begin
	led_next <= "1111111";
		case state_next is
			when off =>
				
			when first =>
				led_next <= "1111110";
			when second => 
				led_next <= "1111100";
			when third =>
				led_next <= "1111000";
			when fourth =>
				led_next <= "1110000";
			when fifth =>
				led_next <= "1100000";
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

