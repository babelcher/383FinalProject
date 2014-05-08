--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:33:04 05/07/2014
-- Design Name:   
-- Module Name:   C:/Users/C15Brandon.Belcher/Documents/Classes/Spring_2014/ECE_383/firstBasys/led_testbench.vhd
-- Project Name:  firstBasys
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LED_control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY led_testbench IS
END led_testbench;
 
ARCHITECTURE behavior OF led_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LED_control
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         infrared : IN  std_logic;
         led : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal infrared : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LED_control PORT MAP (
          clk => clk,
          reset => reset,
          infrared => infrared,
          led => led
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
			infrared <= '1';
			wait for 100 ns;
			infrared <= '0';
			wait for 10 ns;
			infrared <= '1';

      wait;
   end process;

END;
