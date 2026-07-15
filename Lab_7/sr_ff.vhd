library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FF is
    port (
        CLK : in std_logic;
        S   : in std_logic;
        R   : in std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity SR_FF;

architecture Behavioral of SR_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if S = '0' and R = '0' then
                null;
            elsif S = '0' and R = '1' then
                Q_int <= '0';
            elsif S = '1' and R = '0' then
                Q_int <= '1';
            end if;
        end if;
    end process;

    Q <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
