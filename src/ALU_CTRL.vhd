library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- The ALU control unit.
-- Takes as input the opcode of the instruction and the alu op
-- and outputs the signal for select the operation in the ALU and
-- the JR signal.
entity ALU_CTRL is
	PORT( 
        INSTRUCTION : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		ALUOP : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	    ALUCTRL : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		JR : OUT STD_LOGIC
    );
end ALU_CTRL;

architecture Behavioral of ALU_CTRL is

begin
    ALUCTRL <= "010" when ALUOP = "000" else
                "101" when ALUOP = "001" and INSTRUCTION = "000000" else
                "010" when ALUOP = "001" and INSTRUCTION = "100000" else
                "110" when ALUOP = "001" and INSTRUCTION = "100010" else
                "000" when ALUOP = "001" and INSTRUCTION = "100100" else
                "001" when ALUOP = "001" and INSTRUCTION = "100101" else
                "111" when ALUOP = "001" and INSTRUCTION = "101010" else
                "110" when ALUOP = "010" else
                "001" when ALUOP = "011" else
                "100";

    JR <= '1' when ALUOP = "001" and INSTRUCTION = "001000" else
            '0';

end Behavioral;