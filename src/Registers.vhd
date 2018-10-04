library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- The component that have the 32 registers that make the register file.
-- The word size is of 32 bits. The write is asynchronous and the register
-- is selected with 'Enabler'. The 32 registers can be read all the time.
-- The register number 0 is always zero.
entity REGISTERS is
	PORT( 
        CLK : IN STD_LOGIC;
        WriteData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        Enabler	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register00, Register01, Register02, Register03 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register04, Register05, Register06, Register07 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register08, Register09, Register10, Register11 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register12, Register13, Register14, Register15 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register16, Register17, Register18, Register19 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register20, Register21, Register22, Register23 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register24, Register25, Register26, Register27 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register28, Register29, Register30, Register31 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end REGISTERS;

architecture Behavioral of REGISTERS is
begin

PROCESS(Clk)
	SUBTYPE REGISTRO IS STD_LOGIC_VECTOR(31 DOWNTO 0); -- Data word size
	TYPE REG_BANK IS ARRAY(0 TO 31) OF REGISTRO; -- Number or registers
	VARIABLE REGISTER_MEMORY : REG_BANK := (OTHERS => (OTHERS => '0'));
BEGIN
	IF RISING_EDGE(Clk) THEN
		FOR I IN 0 TO 31 LOOP
			IF Enabler(I) = '1' THEN
				REGISTER_MEMORY(I) := WriteData;
			END IF;
		END LOOP;
	END IF;
	
    -- The R0 is always zero.
	REGISTER_MEMORY(0) := X"00000000" AND REGISTER_MEMORY(0);

	Register00 <= REGISTER_MEMORY(0);
	Register01 <= REGISTER_MEMORY(1);
	Register02 <= REGISTER_MEMORY(2);
	Register03 <= REGISTER_MEMORY(3);
	Register04 <= REGISTER_MEMORY(4);
	Register05 <= REGISTER_MEMORY(5);
	Register06 <= REGISTER_MEMORY(6);
	Register07 <= REGISTER_MEMORY(7);
	Register08 <= REGISTER_MEMORY(8);
	Register09 <= REGISTER_MEMORY(9);
	Register10 <= REGISTER_MEMORY(10);
	Register11 <= REGISTER_MEMORY(11);
	Register12 <= REGISTER_MEMORY(12);
	Register13 <= REGISTER_MEMORY(13);
	Register14 <= REGISTER_MEMORY(14);
	Register15 <= REGISTER_MEMORY(15);
	Register16 <= REGISTER_MEMORY(16);
	Register17 <= REGISTER_MEMORY(17);
	Register18 <= REGISTER_MEMORY(18);
	Register19 <= REGISTER_MEMORY(19);
	Register20 <= REGISTER_MEMORY(20);
	Register21 <= REGISTER_MEMORY(21);
	Register22 <= REGISTER_MEMORY(22);
	Register23 <= REGISTER_MEMORY(23);
	Register24 <= REGISTER_MEMORY(24);
	Register25 <= REGISTER_MEMORY(25);
	Register26 <= REGISTER_MEMORY(26);
	Register27 <= REGISTER_MEMORY(27);
	Register28 <= REGISTER_MEMORY(28);
	Register29 <= REGISTER_MEMORY(29);
	Register30 <= REGISTER_MEMORY(30);
	Register31 <= REGISTER_MEMORY(31);
	
END PROCESS;

end Behavioral;