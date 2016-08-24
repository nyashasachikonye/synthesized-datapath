library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_way_multiplexer is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           A   : in  STD_LOGIC_VECTOR (7 downto 0);
           B   : in  STD_LOGIC_VECTOR (7 downto 0);
           C   : in  STD_LOGIC_VECTOR (7 downto 0);
           D   : in  STD_LOGIC_VECTOR (7 downto 0);
           X   : out STD_LOGIC_VECTOR (7 downto 0));
end four_way_multiplexer;

architecture Behavioral of four_way_multiplexer is
begin

process(A,B,C,D,SEL)
begin
case SEL is
  when "00" => X <= A;
  when "01" => X <= B;
  when "10" => X <= C;
  when others => X <= D; 
end case; 
end process;

end Behavioral;