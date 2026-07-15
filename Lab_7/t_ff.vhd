library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
    port (
        CLK : in std_logic;
        T   : in std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity T_FF;

architecture Behavioral of T_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if T = '1' then
                Q_int <= not Q_int;
            end if;
        end if;
    end process;

    Q <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
