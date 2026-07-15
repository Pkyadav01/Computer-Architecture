library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_XS3_TB is
end entity BCD_XS3_TB;

architecture Simulation of BCD_XS3_TB is
    signal BCD : std_logic_vector(3 downto 0) := "0000";
    signal XS3 : std_logic_vector(3 downto 0);
begin

    DUT : entity work.BCD_TO_XS3
        port map(
            BCD => BCD,
            XS3 => XS3
        );

    STIMULUS : process
    begin
        BCD <= "0000"; wait for 10 ns; -- 0 -> 0011
        BCD <= "0001"; wait for 10 ns; -- 1 -> 0100
        BCD <= "0101"; wait for 10 ns; -- 5 -> 1000
        BCD <= "1001"; wait for 10 ns; -- 9 -> 1100
        wait;
    end process;

end architecture Simulation;