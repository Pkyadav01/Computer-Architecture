library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF_TB is
end entity FF_TB;

architecture Simulation of FF_TB is
    signal CLK : std_logic := '0';
    signal S, R : std_logic := '0';
    signal D : std_logic := '0';
    signal J, K : std_logic := '0';
    signal T : std_logic := '0';
    signal Q_SR, Q_D, Q_JK, Q_T : std_logic;
    signal QB_SR, QB_D, QB_JK, QB_T : std_logic;

    constant CLK_PERIOD : time := 20 ns;
begin
    CLK <= not CLK after CLK_PERIOD / 2;

    U1 : entity work.SR_FF port map (CLK, S, R, Q_SR, QB_SR);
    U2 : entity work.D_FF port map (CLK, D, Q_D, QB_D);
    U3 : entity work.JK_FF port map (CLK, J, K, Q_JK, QB_JK);
    U4 : entity work.T_FF port map (CLK, T, Q_T, QB_T);

    STIMULUS : process
    begin
        S <= '1'; R <= '0'; wait for 40 ns;
        S <= '0'; R <= '1'; wait for 40 ns;
        S <= '0'; R <= '0'; wait for 40 ns;

        D <= '1'; wait for 40 ns;
        D <= '0'; wait for 40 ns;

        J <= '1'; K <= '0'; wait for 40 ns;
        J <= '1'; K <= '1'; wait for 40 ns;
        J <= '0'; K <= '1'; wait for 40 ns;

        T <= '1'; wait for 80 ns;
        T <= '0'; wait for 40 ns;

        wait;
    end process;
end architecture Simulation;
