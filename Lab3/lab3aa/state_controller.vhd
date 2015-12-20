----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:31 11/03/2015 
-- Design Name: 
-- Module Name:    state_controller - Behavioral 
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

entity state_controller is
    Port ( clk : in  STD_LOGIC;
           SEL : in  STD_LOGIC;
           ADJ : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           pause : in  STD_LOGIC);
end state_controller;

architecture Behavioral of state_controller is

begin


end Behavioral;

