library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.ALL;

-- Sign extender to fill with zeros or ones the upper
-- part of a 16 bits to make a 32 bits.
entity SIGN_EXTENDER is
	PORT( 
        A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	    B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
end SIGN_EXTENDER;

architecture Behavioral of SIGN_EXTENDER is

begin
	B <= X"FFFF" & A WHEN A(15) = '1' ELSE
		  X"0000" & A;
end Behavioral;