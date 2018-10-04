library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Top component of the MIPS 32 bits microprocessor.
-- It includes all the components like the register file,
-- data memory, instruction memory, alu, unit control, etc.
entity MIPS is
	PORT( 
        CLK : IN STD_LOGIC;
		RESET : IN STD_LOGIC
	);
end MIPS;


architecture Behavioral of MIPS is

component RegisterFile is
	PORT( Clk			: IN STD_LOGIC;
			WriteReg		: IN STD_LOGIC_VECTOR(4 downto 0);
			RegWrite		: IN STD_LOGIC;
			WriteData	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			ReadReg1		: IN STD_LOGIC_VECTOR(4 downto 0);
			ReadReg2		: IN STD_LOGIC_VECTOR(4 downto 0);
			DataReg1		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			DataReg2		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
			);
end component;

component MUX_5bits is
	port (
		SELECTOR : in STD_LOGIC;
		X0 : in STD_LOGIC_VECTOR(4 downto 0);
		X1 : in STD_LOGIC_VECTOR(4 downto 0);
		Y : out STD_LOGIC_VECTOR(4 downto 0)
	);
end component;

component INSTRUCTIONS_MEMORY is
	PORT( READ_ADDRESS : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
	      INSTRUCTION : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end component;

component Program_counter is
	port (
		D : in STD_LOGIC_VECTOR (31 downto 0);
		Q : out STD_LOGIC_VECTOR (31 downto 0);
		RESET : in STD_LOGIC;
		CLK : in STD_LOGIC
	);
end component;

component ALU is
	PORT( A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	      B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			CTRL : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			ZERO : OUT STD_LOGIC;
			RESULT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end component;

component MUX_32bits is
	port (
		SELECTOR : in STD_LOGIC;
		X0 : in STD_LOGIC_VECTOR(31 downto 0);
		X1 : in STD_LOGIC_VECTOR(31 downto 0);
		Y : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component ALU_CTRL is
	PORT( INSTRUCTION : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			ALUOP			: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	      ALUCTRL	: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			JR			: OUT STD_LOGIC
        );
end component;

component SIGN_EXTENDER is
	PORT( A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	      B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end component;

component DATA_MEMORY is
	PORT( CLK : IN STD_LOGIC;
	      ENABLE : IN STD_LOGIC;
	      ADDRESS : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	      WRITE_DATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		   WRITE_ENABLE : IN STD_LOGIC;
		   READ_ENABLE : IN STD_LOGIC;
	      READ_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end component;

component UC is
	PORT( INSTRUCTION : IN STD_LOGIC_VECTOR(31 DOWNTO 26);
			REGDST	: OUT STD_LOGIC;
			JUMP		: OUT STD_LOGIC;
			BRANCH	: OUT STD_LOGIC;
			MEMREAD	: OUT STD_LOGIC;
			MEMTOREG : OUT STD_LOGIC;
			MEMWRITE : OUT STD_LOGIC;
			ALUSRC	: OUT STD_LOGIC;
			REGWRITE : OUT STD_LOGIC;
			ALUOP		: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
end component;

component ADDER is
	PORT( A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	      B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	      C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end component;

component Shift_left_2bits is
		port(
			IN_VECTOR : in STD_LOGIC_VECTOR(25 downto 0);
			OUT_VECTOR : out STD_LOGIC_VECTOR(27 downto 0)
		);
end component;

component LEFT_SHIFT_2 is
	PORT( A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	      B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end component;


-- Internal signals
signal PC_WRITE: std_logic_vector(31 downto 0);
signal PC: std_logic_vector(31 downto 0);
signal instruction: std_logic_vector(31 downto 0);

signal RegDst : STD_LOGIC;
signal JUMP : STD_LOGIC;
signal BRANCH: std_logic;
signal MEMWrite: std_logic;
signal MEMRead: std_logic;
signal MEMToReg: std_logic;
signal ALUSrc: std_logic;
signal RegWrite: STD_LOGIC;
signal ALUop: STD_LOGIC_VECTOR(2 DOWNTO 0);

signal branchAND: std_logic;

signal inmedSignExtended: std_logic_vector(31 downto 0);

signal WriteReg		: STD_LOGIC_VECTOR(4 downto 0);
signal WriteDataReg	: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal DataReg1		: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal DataReg2		: STD_LOGIC_VECTOR(31 DOWNTO 0);

signal CTRL_ALU: std_logic_vector(2 DOWNTO 0);
signal JR : std_logic;

signal ALU_IN_B : std_logic_vector(31 downto 0);
signal ZERO_ALU: std_logic;
signal RESULT_ALU: STD_LOGIC_VECTOR(31 DOWNTO 0);

signal ReadDataMemData: STD_LOGIC_VECTOR(31 DOWNTO 0);


signal PCMAS4 : STD_LOGIC_VECTOR(31 DOWNTO 0);

signal JumpPcIncomplete: std_logic_vector(27 downto 0);
signal JumpPc: std_logic_vector(31 downto 0);

signal branchPCShifted: std_logic_vector(31 downto 0);
signal branchPC: std_logic_vector(31 downto 0);

signal PCElegidoFase1: std_logic_vector(31 downto 0);
signal PCElegidoFase2: std_logic_vector(31 downto 0);

begin
	-- CONTROL UNIT
	ctr_unit_inst: UC port map(instruction(31 downto 26), REGDST, JUMP, BRANCH, MEMREAD,
		MEMTOREG, MEMWRITE, ALUSRC, REGWRITE, ALUOP);
		
	branchAND<= BRANCH and ZERO_ALU;

	-- Program counter
	ProgCounter: Program_counter port map(PC_WRITE, PC, RESET, CLK);

	-- Instruction Memory
	Instr_MEM: INSTRUCTIONS_MEMORY port map (PC, instruction);

	-- Register File
	muxWriteReg: MUX_5bits port map (RegDst, instruction(20 downto 16),
		instruction(15 downto 11), WriteReg);

	register_File_inst: RegisterFile port map (CLK, WriteReg, RegWrite, WriteDataReg,
		instruction(25 downto 21), instruction(20 downto 16), DataReg1,
		DataReg2);
		
	
	inmed_extend_inst: SIGN_EXTENDER port map(instruction(15 downto 0), inmedSignExtended);
	
	
	-- ALU
	mux_alu_in_B: MUX_32bits port map (ALUSrc, DataReg2, inmedSignExtended, ALU_IN_B);
	
	alu_contr_inst: ALU_CTRL port map (instruction(5 downto 0), ALUop, CTRL_ALU, JR);
		
	alu_inst: ALU port map (DataReg1, ALU_IN_B, CTRL_ALU, ZERO_ALU, RESULT_ALU);
	
	
	-- DATA MEMORY
	data_mem: DATA_MEMORY port map (CLK, '0', RESULT_ALU, DataReg2, MEMWrite, 
		MEMRead, ReadDataMemData);
	
	mux_write_reg: MUX_32bits port map (MEMToReg, RESULT_ALU, ReadDataMemData, 
		WriteDataReg);
		
	
	-- Program Counter
	pc_mas4_inst: ADDER port map (PC, x"00_00_00_04", PCMAS4);
	
	jump_shift: Shift_left_2bits port map (instruction(25 downto 0), JumpPcIncomplete);
	JumpPc <= PCMAS4(31 downto 28) & JumpPcIncomplete;
	
	shif_branch_inst: LEFT_SHIFT_2 port map (inmedSignExtended, branchPCShifted);
	adder_branch_inst: ADDER port map (branchPCShifted, PCMAS4, branchPC);
	

	mux_fin1: MUX_32bits port map (branchAND, PCMAS4, branchPC, PCElegidoFase1);
	mux_fin2: MUX_32bits port map (JUMP, PCElegidoFase1, JumpPc, PCElegidoFase2);
	mux_fin3: MUX_32bits port map (JR, PCElegidoFase2, DataReg2, PC_WRITE);
	

end Behavioral;