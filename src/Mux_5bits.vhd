library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- A MUX of two signals of 5 bits.
entity MUX_5bits is
	port (
		SELECTOR : in STD_LOGIC;
		X0 : in STD_LOGIC_VECTOR(4 downto 0);
		X1 : in STD_LOGIC_VECTOR(4 downto 0);
		Y : out STD_LOGIC_VECTOR(4 downto 0)
	);
end MUX_5bits;

architecture MUX_5bits_behavioral of MUX_5bits is
begin

	Y <= X0 when SELECTOR = '0'
		else X1;

end MUX_5bits_behavioral;