library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- 32 bits adder.
entity ADDER is
	PORT( 
        A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	    B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	    C : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
end ADDER;

architecture Behavioral of ADDER is

begin
	C <= A + B;
end Behavioral;