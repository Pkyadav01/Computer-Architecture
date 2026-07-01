library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_TB is
end entity COMPARATOR_TB;

architecture Simulation of COMPARATOR_TB is
    signal A, B : std_logic_vector(1 downto 0) := "00";
    signal EQ, GT, LT : std_logic;
begin
    DUT: entity work.COMPARATOR_2BIT
        port map (
            A  => A,
            B  => B,
            EQ => EQ,
            GT => GT,
            LT => LT
        );

    STIMULUS: process
    begin
        -- Test cases based on the lab manual
        A <= "00"; B <= "00"; wait for 10 ns; -- EQ = 1
        A <= "01"; B <= "00"; wait for 10 ns; -- GT = 1
        A <= "00"; B <= "01"; wait for 10 ns; -- LT = 1
        A <= "10"; B <= "11"; wait for 10 ns; -- LT = 1
        A <= "11"; B <= "10"; wait for 10 ns; -- GT = 1
        A <= "11"; B <= "11"; wait for 10 ns; -- EQ = 1
        
        wait; -- End of simulation
    end process;
end architecture Simulation;