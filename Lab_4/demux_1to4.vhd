library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX_1TO4 is
port (
  D : in std_logic;                      -- Data input
  S : in std_logic_vector(1 downto 0);  -- 2 select lines
  Y : out std_logic_vector(3 downto 0)  -- 4 outputs
);
end entity DEMUX_1TO4;

architecture Behavioral of DEMUX_1TO4 is
begin
  process(D, S)
  begin
    Y <= "0000";  -- Default all outputs low
    case S is
      when "00" => Y(0) <= D;
      when "01" => Y(1) <= D;
      when "10" => Y(2) <= D;
      when "11" => Y(3) <= D;
      when others => null;
    end case;
  end process;
end architecture Behavioral;
