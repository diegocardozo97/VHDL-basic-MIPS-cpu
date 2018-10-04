library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- The unit control of the MIPS.
-- It output all the control signals in the microprocessor.
-- It takes the opcode of the instructions to generate the signals.
entity UC is
	PORT( 
        INSTRUCTION : IN STD_LOGIC_VECTOR(31 DOWNTO 26);
        REGDST : OUT STD_LOGIC;
        JUMP : OUT STD_LOGIC;
        BRANCH : OUT STD_LOGIC;
        MEMREAD	: OUT STD_LOGIC;
        MEMTOREG : OUT STD_LOGIC;
        MEMWRITE : OUT STD_LOGIC;
        ALUSRC : OUT STD_LOGIC;
        REGWRITE : OUT STD_LOGIC;
        ALUOP : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
end UC;

architecture Behavioral of UC is

begin
    REGDST <= '1' when INSTRUCTION = "000000" else
                '0';
                
    JUMP <= '1' when INSTRUCTION = "000010" else
            '0';
            
    BRANCH <= '1' when INSTRUCTION = "000100" else
                '0';
                
    MEMREAD <= '1' when INSTRUCTION = "100011" else
                '0';
                
    MEMTOREG <= '1' when INSTRUCTION = "100011" else
                    '0';
                    
    MEMWRITE <= '1' when INSTRUCTION = "101011" else
                    '0';

    ALUSRC <= '1' when INSTRUCTION = "001000" else
                '1' when INSTRUCTION = "001101" else
                '1' when INSTRUCTION = "001111" else
                '1' when INSTRUCTION = "100011" else
                '1' when INSTRUCTION = "101011" else
                '0';
                
    REGWRITE <= '1' when INSTRUCTION = "000000" else
                    '1' when INSTRUCTION = "001000" else
                    '1' when INSTRUCTION = "001101" else
                    '1' when INSTRUCTION = "001111" else
                    '1' when INSTRUCTION = "100011" else
                    '0';

    ALUOP <= "001" when INSTRUCTION = "000000" else
                "010" when INSTRUCTION = "000100" else
                "011" when INSTRUCTION = "001101" else
                "100" when INSTRUCTION = "001111" else
                "000";

end Behavioral;