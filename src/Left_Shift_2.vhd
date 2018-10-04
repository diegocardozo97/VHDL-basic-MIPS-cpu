library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.ALL;

-- A left shifter by 2 to do 32 bits to 32 bits.
entity LEFT_SHIFT_2 is
	PORT( 
        A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	    B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
end LEFT_SHIFT_2;

architecture Behavioral of LEFT_SHIFT_2 is
begin
	B <= STD_LOGIC_VECTOR(SHIFT_LEFT(UNSIGNED(A), 2));
end Behavioral;