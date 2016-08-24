LIBRARY altera;
USE altera.maxplus2.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity ALU is
port (
	opcode: IN std_logic_vector (4 downto 0); -- five bit opcode inputs
	inA: IN std_logic_vector (7 downto 0); -- 8 bit input bus,
	inB: IN std_logic_vector (7 downto 0); -- 8 bit input bus
	clock: IN std_logic;
	result: OUT std_logic_vector (7 downto 0); -- 8 bit output
	flagN, flagC, flagZ: OUT std_logic);
end ALU;

architecture behavioural of ALU is
begin
process (clock)
variable acc: std_logic_vector (7 downto 0);
variable temp: std_logic_vector(6 downto 0);
begin
if(clock'event and  clock = '1') then
case opcode is
	-- addition
	when "0010" =>
	acc := acc + data;
	result <= "00110110";
	if(acc="00000000") then
		flag <= '1';
	else
		flag <= '0';
	end if;

	-- bitwise and
	when "0100"  =>
	acc := acc and data;
	result <= acc;
	flag <= '0';

	-- clear **** TO BE IMPLEMENTED **
	--  	when "0100"  =>
	-- acc := acc and data;
	-- result <= acc;
	-- flag <= '0';

	-- clear_acc **** TO BE IMPLEMENTED **
	--  	when "0100"  =>
	-- acc := acc and data;
	-- result <= acc;
	-- flag <= '0';

	-- compare
	when "1000"  =>
	if(acc = data) then
		flag <= '1';
	else
		flag <= '0';
	end if;

	--  one's complement
	when "0011" =>
	acc := not acc;
	result <= acc;
	flag <= '0';

	----------------------- NOT ORDERED -----------------------------------------


	-- nop
	when "0000" =>
		result <= "00000000";
		flag <= '0';

	-- load
	when "0001" =>
		acc := data;
		result <= acc;
		flag <= '0';




	--bitwise or
	when "0101"  =>
		acc := acc or data;
		result <= acc;
		flag <= '0';

	-- shift left one position
	when "0110"  =>
		--temp := acc(6 downto 0);  -- extract the first 7 bits
		acc := acc(6 downto 0) & '0';  -- save the extracted bits and add a 0 to the end
		result <= acc;
		flag <= '0';

	-- shift right one position
	when "0111"  =>
		--temp := acc(7 downto 1);
		acc := '0' & acc(7 downto 1);
		result <= acc;
		flag <= '0';


	-- increment
	when "1001"  =>
		acc := acc + 1;
		result <= acc;
		flag <= '0';

	when others =>
		flag <= '0';

end case;
end if;
end process;
end behavioural;
