library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- MUX of two lines of 32 bits.
entity MUX_32bits is
	port (
		SELECTOR : in STD_LOGIC;
		X0 : in STD_LOGIC_VECTOR(31 downto 0);
		X1 : in STD_LOGIC_VECTOR(31 downto 0);
		Y : out STD_LOGIC_VECTOR(31 downto 0)
	);
end MUX_32bits;

architecture MUX_32bits_behavioral of MUX_32bits is
begin

	Y <= X0 when SELECTOR = '0'
		else X1;

end MUX_32bits_behavioral;