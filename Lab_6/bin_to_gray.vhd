library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIN_TO_GRAY is
    port(
        B : in std_logic_vector(3 downto 0);
        G : out std_logic_vector(3 downto 0)
    );
end entity BIN_TO_GRAY;

architecture Dataflow of BIN_TO_GRAY is
begin
    G(3) <= B(3);
    G(2) <= B(3) xor B(2);
    G(1) <= B(2) xor B(1);
    G(0) <= B(1) xor B(0);
end architecture Dataflow;