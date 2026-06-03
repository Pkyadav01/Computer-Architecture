library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX_TB is
end entity DEMUX_TB;

architecture Simulation of DEMUX_TB is
  signal D : std_logic := '1';
  signal S : std_logic_vector(1 downto 0) := "00";
  signal Y : std_logic_vector(3 downto 0);
begin
  DUT: entity work.DEMUX_1TO4 port map (D => D, S => S, Y => Y);

  STIMULUS: process
  begin
    D <= '1';
    S <= "00"; wait for 10 ns;  -- Y = 0001
    S <= "01"; wait for 10 ns;  -- Y = 0010
    S <= "10"; wait for 10 ns;  -- Y = 0100
    S <= "11"; wait for 10 ns;  -- Y = 1000
    D <= '0';
    S <= "10"; wait for 10 ns;  -- Y = 0000 (D=0 routed to Y2)
    wait;
  end process;
end architecture Simulation;
