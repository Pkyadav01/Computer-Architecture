library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COUNTER_UPDOWN is
    port (
        CLK   : in std_logic;
        RST   : in std_logic; -- Active-high synchronous reset
        UP    : in std_logic; -- '1' = count up, '0' = count down
        COUNT : out std_logic_vector(3 downto 0)
    );
end entity COUNTER_UPDOWN;

architecture Behavioral of COUNTER_UPDOWN is
    signal count_int : unsigned(3 downto 0) := (others => '0');
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                count_int <= (others => '0');
            elsif UP = '1' then
                count_int <= count_int + 1;
            else
                count_int <= count_int - 1;
            end if;
        end if;
    end process;

    COUNT <= std_logic_vector(count_int);
end architecture Behavioral;
