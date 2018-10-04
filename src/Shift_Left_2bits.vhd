library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Left shifter that adds two 0 to make 26 bits to 28 bits. 
entity SHIFT_LEFT_2BITS is
		port(
		    IN_VECTOR : in STD_LOGIC_VECTOR(25 downto 0);
			OUT_VECTOR : out STD_LOGIC_VECTOR(27 downto 0)
		);
end;

architecture SHIFT_LEFT_2BITS_behavioral of SHIFT_LEFT_2BITS is
begin

	OUT_VECTOR <= IN_VECTOR & "00";

end SHIFT_LEFT_2BITS_behavioral;