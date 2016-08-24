library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_way_multiplexer is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (7 downto 0);
           B   : in  STD_LOGIC_VECTOR (7 downto 0);
           X   : out STD_LOGIC_VECTOR (7 downto 0));
end two_way_multiplexer;

architecture Behavioral of two_way_multiplexer is
begin
    X <= A when (SEL = '1') else B;
end Behavioral;