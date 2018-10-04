library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Register of 32 bits with synchronous store and
-- asynchronous reset to store the program counter.
entity PROGRAM_COUNTER is
	port (
		D : in STD_LOGIC_VECTOR (31 downto 0);
		Q : out STD_LOGIC_VECTOR (31 downto 0);
		RESET : in STD_LOGIC;
		CLK : in STD_LOGIC
	);
end PROGRAM_COUNTER;

architecture PROGRAM_COUNTER_behavioral of PROGRAM_COUNTER is
begin

	process(CLK, RESET)
	begin
		if RESET = '1' then
			Q <= x"00_00_00_00";
		elsif rising_edge(CLK) then
			Q <= D;
		end if;
	end process;

end PROGRAM_COUNTER_behavioral;