library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    port (
        CLK : in std_logic;
        D   : in std_logic;
        Q   : out std_logic;
        QB  : out std_logic
    );
end entity D_FF;

architecture Behavioral of D_FF is
    signal Q_int : std_logic := '0';
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            Q_int <= D;
        end if;
    end process;

    Q <= Q_int;
    QB <= not Q_int;
end architecture Behavioral;
