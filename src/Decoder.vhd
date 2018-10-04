library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- A decoder that receives 5 bits signal and activates a bit.
-- To be used with the register bank.
entity DECODER is
	PORT( 
            WriteReg : IN STD_LOGIC_VECTOR(4 downto 0);
			RegWrite : IN STD_LOGIC;
			Enabler 	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
end DECODER;

architecture Behavioral of DECODER is
begin
	Enabler(0) <= '1' when WriteReg = "00000" and RegWrite = '1'
		else '0';
	Enabler(1) <= '1' when WriteReg = "00001" and RegWrite = '1'
		else '0';
	Enabler(2) <= '1' when WriteReg = "00010" and RegWrite = '1'
		else '0';
	Enabler(3) <= '1' when WriteReg = "00011" and RegWrite = '1'
		else '0';
	Enabler(4) <= '1' when WriteReg = "00100" and RegWrite = '1'
		else '0';
	Enabler(5) <= '1' when WriteReg = "00101" and RegWrite = '1'
		else '0';
	Enabler(6) <= '1' when WriteReg = "00110" and RegWrite = '1'
		else '0';
	Enabler(7) <= '1' when WriteReg = "00111" and RegWrite = '1'
		else '0';
	Enabler(8) <= '1' when WriteReg = "01000" and RegWrite = '1'
		else '0';
	Enabler(9) <= '1' when WriteReg = "01001" and RegWrite = '1'
		else '0';
	Enabler(10) <= '1' when WriteReg = "01010" and RegWrite = '1'
		else '0';
	Enabler(11) <= '1' when WriteReg = "01011" and RegWrite = '1'
		else '0';
	Enabler(12) <= '1' when WriteReg = "01100" and RegWrite = '1'
		else '0';
	Enabler(13) <= '1' when WriteReg = "01101" and RegWrite = '1'
		else '0';
	Enabler(14) <= '1' when WriteReg = "01110" and RegWrite = '1'
		else '0';
	Enabler(15) <= '1' when WriteReg = "01111" and RegWrite = '1'
		else '0';
	Enabler(16) <= '1' when WriteReg = "10000" and RegWrite = '1'
		else '0';
	Enabler(17) <= '1' when WriteReg = "10001" and RegWrite = '1'
		else '0';
	Enabler(18) <= '1' when WriteReg = "10010" and RegWrite = '1'
		else '0';
	Enabler(19) <= '1' when WriteReg = "10011" and RegWrite = '1'
		else '0';
	Enabler(20) <= '1' when WriteReg = "10100" and RegWrite = '1'
		else '0';
	Enabler(21) <= '1' when WriteReg = "10101" and RegWrite = '1'
		else '0';
	Enabler(22) <= '1' when WriteReg = "10110" and RegWrite = '1'
		else '0';
	Enabler(23) <= '1' when WriteReg = "10111" and RegWrite = '1'
		else '0';
	Enabler(24) <= '1' when WriteReg = "11000" and RegWrite = '1'
		else '0';
	Enabler(25) <= '1' when WriteReg = "11001" and RegWrite = '1'
		else '0';
	Enabler(26) <= '1' when WriteReg = "11010" and RegWrite = '1'
		else '0';
	Enabler(27) <= '1' when WriteReg = "11011" and RegWrite = '1'
		else '0';
	Enabler(28) <= '1' when WriteReg = "11100" and RegWrite = '1'
		else '0';
	Enabler(29) <= '1' when WriteReg = "11101" and RegWrite = '1'
		else '0';
	Enabler(30) <= '1' when WriteReg = "11110" and RegWrite = '1'
		else '0';
	Enabler(31) <= '1' when WriteReg = "11111" and RegWrite = '1'
		else '0';

end architecture;