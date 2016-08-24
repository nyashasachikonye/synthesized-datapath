-- LIBRARY HEADER MATERIAL --
LIBRARY altera;
USE altera.maxplus2.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
-- LIBRARY HEADER MATERIAL --

--entity definition
entity ALU is
port (
	opcode: IN std_logic_vector (4 downto 0); -- 8 bit opcode inputs
	inA: IN std_logic_vector (7 downto 0); -- 8 bit input bus,
	inB: IN std_logic_vector (7 downto 0); -- 8 bit input bus
	result: OUT std_logic_vector (7 downto 0); -- 8 bit output
	flagCZN: OUT std_logic_vector (2 downto 0));


end ALU;
--end

architecture behavioural of ALU is
begin
process (opcode, inA, inB)
variable acc: std_logic_vector (7 downto 0);
variable temp: std_logic_vector(8 downto 0);
begin
case opcode is

	-- addition
	when "11011" =>
		acc := inA + inB;
		temp := ("0" & inA) + ("0" & inB);
		if(acc < 0) then -- HOW DO YOU CHECK THIS PROPERLY
			flagCZN <= "001";
			end if;
		if(acc = 0) then
			flagCZN <= "010";
			end if;
		if(temp >= 100000000) then
			flagCZN <= "100";
		else
			flagCZN <= "000";
		end if;
			result <= acc;


	-- bitwise AND
	when "10100" =>
		acc := inA AND inB;
		if(acc < 0) then
			flagCZN <= "101";
		elsif(acc = 0) then
			flagCZN <= "110";
		else
			flagCZN <= "100";
		end if;
			result <= acc;



	-- clear && clear ACC
	when "01111" =>
		acc := "00000000";
			flagCZN <= "110";
			result <= acc;

	-- compare
	when "10001" =>
	acc := inB - inA;
	temp := ("0" & inB) - ("0" & inA);
		if(inB = inA) then
			--
			if(acc < 0) then
				flagCZN <= "001";
			elsif(acc = 0) then
				flagCZN <= "010";
			elsif(temp >= 100000000) then
				flagCZN <= "100";
			else
				flagCZN <= "000";
			end if;
		end if;
		result <= acc;

	-- ones compliment && ones compliment ACC
	when "00011" =>
		acc := NOT(inA);
		if(acc < 0) then
			flagCZN <= "101";
		elsif(acc = 0) then
			flagCZN <= "110";
		else
			flagCZN <= "100";
		end if;
			result <= acc;


	-- decrement & decrement ACC
	when "01010" =>
		acc := inA - 1;
		if(acc < 0) then
			flagCZN <= "101";
		elsif(acc = 0) then
			flagCZN <= "110";
		else
			flagCZN <= "100";
		end if;
			result <= acc;

	-- exclusive OR
	when "11000" =>
		acc := inB XOR inA;
		if(acc < 0) then
			flagCZN <= "101";
		elsif(acc = 0) then
			flagCZN <= "110";
		else
			flagCZN <= "100";
		end if;
			result <= acc;

	-- increment && increment ACC
	when "01100" =>
		acc := inA + 1;
		if(acc < 0) then
			flagCZN <= "101";
		elsif(acc = 0) then
			flagCZN <= "110";
		else
			flagCZN <= "100";
		end if;
			result <= acc;

	-- load ACC
	when "10110" =>
	if(acc < 0) then
		flagCZN <= "101";
	elsif(acc = 0) then
		flagCZN <= "110";
	else
		flagCZN <= "100";
	end if;
		result <= acc;

	-- logical shift left && logical shift left ACC
	when "01000" =>
		acc := inA(6 downto 0) & "0";
		temp := "000000000" AND inA(7 downto 7);
		if(acc < 0) then
			flagCZN <= "001";
		elsif(acc = 0) then
			flagCZN <= "010";
		elsif(temp = 010000000) then
			flagCZN <= "100";
		else
			flagCZN <= "000";
		end if;
			result <= acc;

	-- logical shift right && logical shift right ACC
	when "00100" =>
		acc := "0" & inA(7 downto 1);
		if(acc = 0) then
			flagCZN <= "010";
		else
			flagCZN <= "000";
		end if;
			result <= acc;

	-- move immediate
	when "01110" =>
		acc := inA;
		if(acc < 0) then
			flagCZN <= "101";
		elsif(acc = 0) then
			flagCZN <= "110";
		else
			flagCZN <= "100";
		end if;
			result <= acc;

	-- bitwise OR
	when "11010" =>
		acc := inA OR acc;
		if(acc < 0) then
			flagCZN <= "101";
		elsif(acc = 0) then
			flagCZN <= "110";
		else
			flagCZN <= "100";
		end if;
			result <= acc;

	-- store ACC									-- wrong??
	when "10111" =>
		flagCZN <= "100";
		result <= acc;

	-- subtract
	when "10000" =>
		acc := inB - inA ;
		if(acc < 0) then -- HOW DO YOU CHECK THIS PROPERLY
			flagCZN <= "001";
			end if;
		if(acc = 0) then
			flagCZN <= "010";
			end if;
		if(temp >= 100000000) then
			flagCZN <= "100";
		else
			flagCZN <= "000";
		end if;
			result <= acc;

	when others =>
		flagCZN <= "110";

end case;
end process;
end behavioural;
