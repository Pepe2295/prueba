----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2019 20:17:12
-- Design Name: 
-- Module Name: reloj - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reloj is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC);
end reloj;

architecture Behavioral of reloj is
Signal pulso: STD_LOGIC;
Signal cont: integer range 0 to 49999999:=0; 
signal prende: std_logic;

begin

process(clk)
	begin
		if rising_edge(clk) then --flanco de subida
			if(cont=24999999) then 
				cont <= 0;
				pulso <= NOT(pulso);
			else
				cont <= cont+1;
			end if;
		end if;
	end process;
	
process (pulso)
	begin
	if rising_edge (pulso) then

			prende<='1';
	end if;
end process;

led<= prende;

end Behavioral;
