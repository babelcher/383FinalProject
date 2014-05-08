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
library UNISIM;
use UNISIM.VComponents.all;

entity top is
	port(
			CLK : in std_logic;
			RESET : in std_logic;
			INFRARED : in std_logic;
			LIGHT : out std_logic_vector(6 downto 0);
			LED : out std_logic_vector(6 downto 0));
end top;

architecture Behavioral of top is

	
	signal led_clk: STD_LOGIC;

	
begin

	LIGHT <= (others => '0');
	inst_DCM_LED: DCM
	generic map(
                   
                   CLKFX_DIVIDE => 10,
                   CLK_FEEDBACK => "1X"
               )
    port map(
                clkin => clk,
                rst => reset,
                clkfx => led_clk
            );
				
				
	inst_LED_control: entity work.LED_control(Behavioral) PORT MAP(
		clk => clk,
		reset => reset,
		infrared => infrared,
		led => led
	);
	


end Behavioral;

