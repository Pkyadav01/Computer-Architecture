library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is
    port (
        CLK : in std_logic;
        J   : in std_logic;
        K   : in std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity JK_FF;

architecture Behavioral of JK_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if J = '0' and K = '0' then
                null;
            elsif J = '0' and K = '1' then
                Q_int <= '0';
            elsif J = '1' and K = '0' then
                Q_int <= '1';
            else
                Q_int <= not Q_int;
            end if;
        end if;
    end process;

    Q <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
