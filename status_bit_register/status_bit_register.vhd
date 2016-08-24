-- LIBRARY HEADER MATERIAL --
LIBRARY altera;
USE altera.maxplus2.ALL;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
-- LIBRARY HEADER MATERIAL --

--entity definition
ENTITY status_bit_register IS
	PORT (
		CLK : IN STD_LOGIC;
		SB_IN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		C : OUT STD_LOGIC;
		Z : OUT STD_LOGIC;
		N : OUT STD_LOGIC
	);
END status_bit_register;
--end
ARCHITECTURE Behavioral OF status_bit_register IS
BEGIN
	PROCESS (CLK)
BEGIN
	IF (CLK'EVENT AND CLK = '1') THEN
		C <= SB_IN(0);
		Z <= SB_IN(1);
		N <= SB_IN(2);
	END IF;
END PROCESS;
END Behavioral;
