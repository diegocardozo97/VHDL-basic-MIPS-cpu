library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Register File of the MIPS.
-- It has the 32 registers of 32 bits. It has one entry to write
-- and two outputs to read different registers at the same time.
-- Uses the Register, Decoder and MUX components.
entity RegisterFile is
	PORT( 
        CLK : IN STD_LOGIC;
        WriteReg : IN STD_LOGIC_VECTOR(4 downto 0);
        RegWrite : IN STD_LOGIC;
        WriteData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        ReadReg1 : IN STD_LOGIC_VECTOR(4 downto 0);
        ReadReg2 : IN STD_LOGIC_VECTOR(4 downto 0);
        DataReg1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        DataReg2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end RegisterFile;

architecture Structure of RegisterFile is

component Decoder
	PORT( 
        WriteReg	: IN STD_LOGIC_VECTOR(4 downto 0);
		RegWrite	: IN STD_LOGIC;
		Enabler	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

component Registers
	PORT( 
        Clk 			: IN STD_LOGIC;
        WriteData 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        Enabler		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register00, Register01, Register02, Register03 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register04, Register05, Register06, Register07 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register08, Register09, Register10, Register11 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register12, Register13, Register14, Register15 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register16, Register17, Register18, Register19 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register20, Register21, Register22, Register23 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register24, Register25, Register26, Register27 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Register28, Register29, Register30, Register31 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

component MUX
	PORT( ReadReg	: IN STD_LOGIC_VECTOR(4 downto 0);
			Register00, Register01, Register02, Register03 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register04, Register05, Register06, Register07 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register08, Register09, Register10, Register11 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register12, Register13, Register14, Register15 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register16, Register17, Register18, Register19 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register20, Register21, Register22, Register23 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register24, Register25, Register26, Register27 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Register28, Register29, Register30, Register31 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Data		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
			);
end component;

signal EnablerInt	: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt00, RegisterInt01, RegisterInt02, RegisterInt03 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt04, RegisterInt05, RegisterInt06, RegisterInt07 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt08, RegisterInt09, RegisterInt10, RegisterInt11 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt12, RegisterInt13, RegisterInt14, RegisterInt15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt16, RegisterInt17, RegisterInt18, RegisterInt19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt20, RegisterInt21, RegisterInt22, RegisterInt23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt24, RegisterInt25, RegisterInt26, RegisterInt27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegisterInt28, RegisterInt29, RegisterInt30, RegisterInt31 :  STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
	D1: Decoder PORT MAP (WriteReg, RegWrite, EnablerInt);
	R1: Registers PORT MAP (Clk, WriteData, EnablerInt,
									RegisterInt00, RegisterInt01, RegisterInt02, RegisterInt03,
									RegisterInt04, RegisterInt05, RegisterInt06, RegisterInt07,
									RegisterInt08, RegisterInt09, RegisterInt10, RegisterInt11,
									RegisterInt12, RegisterInt13, RegisterInt14, RegisterInt15,
									RegisterInt16, RegisterInt17, RegisterInt18, RegisterInt19,
									RegisterInt20, RegisterInt21, RegisterInt22, RegisterInt23,
									RegisterInt24, RegisterInt25, RegisterInt26, RegisterInt27,
									RegisterInt28, RegisterInt29, RegisterInt30, RegisterInt31);
	M1: MUX PORT MAP (ReadReg1,
							RegisterInt00, RegisterInt01, RegisterInt02, RegisterInt03,
							RegisterInt04, RegisterInt05, RegisterInt06, RegisterInt07,
							RegisterInt08, RegisterInt09, RegisterInt10, RegisterInt11,
							RegisterInt12, RegisterInt13, RegisterInt14, RegisterInt15,
							RegisterInt16, RegisterInt17, RegisterInt18, RegisterInt19,
							RegisterInt20, RegisterInt21, RegisterInt22, RegisterInt23,
							RegisterInt24, RegisterInt25, RegisterInt26, RegisterInt27,
							RegisterInt28, RegisterInt29, RegisterInt30, RegisterInt31,
							DataReg1);
				
	M2:MUX PORT MAP (ReadReg2,
							RegisterInt00, RegisterInt01, RegisterInt02, RegisterInt03,
							RegisterInt04, RegisterInt05, RegisterInt06, RegisterInt07,
							RegisterInt08, RegisterInt09, RegisterInt10, RegisterInt11,
							RegisterInt12, RegisterInt13, RegisterInt14, RegisterInt15,
							RegisterInt16, RegisterInt17, RegisterInt18, RegisterInt19,
							RegisterInt20, RegisterInt21, RegisterInt22, RegisterInt23,
							RegisterInt24, RegisterInt25, RegisterInt26, RegisterInt27,
							RegisterInt28, RegisterInt29, RegisterInt30, RegisterInt31,
							DataReg2);
end Structure;