library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Multiplexer of 32 lines of 32 bits.
-- To be used with the 'read' of the register bank.
entity MUX is
	PORT( 
            ReadReg : IN STD_LOGIC_VECTOR(4 downto 0);
			Register00, Register01, Register02, Register03 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register04, Register05, Register06, Register07 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register08, Register09, Register10, Register11 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register12, Register13, Register14, Register15 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register16, Register17, Register18, Register19 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register20, Register21, Register22, Register23 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register24, Register25, Register26, Register27 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register28, Register29, Register30, Register31 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
end MUX;

architecture Behavioral of MUX is
begin
	Data <= Register00 when ReadReg = "00000"
		else Register01 when ReadReg = "00001"
		else Register02 when ReadReg = "00010"
		else Register03 when ReadReg = "00011"
		else Register04 when ReadReg = "00100"
		else Register05 when ReadReg = "00101"
		else Register06 when ReadReg = "00110"
		else Register07 when ReadReg = "00111"
		else Register08 when ReadReg = "01000"
		else Register09 when ReadReg = "01001"
		else Register10 when ReadReg = "01010"
		else Register11 when ReadReg = "01011"
		else Register12 when ReadReg = "01100"
		else Register13 when ReadReg = "01101"
		else Register14 when ReadReg = "01110"
		else Register15 when ReadReg = "01111"
		else Register16 when ReadReg = "10000"
		else Register17 when ReadReg = "10001"
		else Register18 when ReadReg = "10010"
		else Register19 when ReadReg = "10011"
		else Register20 when ReadReg = "10100"
		else Register21 when ReadReg = "10101"
		else Register22 when ReadReg = "10110"
		else Register23 when ReadReg = "10111"
		else Register24 when ReadReg = "11000"
		else Register25 when ReadReg = "11001"
		else Register26 when ReadReg = "11010"
		else Register27 when ReadReg = "11011"
		else Register28 when ReadReg = "11100"
		else Register29 when ReadReg = "11101"
		else Register30 when ReadReg = "11110"
		else Register31;

end Behavioral;