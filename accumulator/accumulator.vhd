library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity accumulator is

port(AccLoad, CLR : in  std_logic;
        clock: IN std_logic;
        D : in std_logic_vector(7 downto 0);
        Q : out std_logic_vector(7 downto 0));


end accumulator;

architecture Behavioral of accumulator is

signal tmp: std_logic_vector(7 downto 0);

begin

process (AccLoad, clock, CLR)
      begin
        if (clock'event and clock='1'and CLR='1') then
          tmp <= "00000000";
        elsif (clock'event and clock='1' and AccLoad='1') then
          tmp <= tmp + D;
        end if;
    end process;
    Q <= tmp;

end Behavioral;