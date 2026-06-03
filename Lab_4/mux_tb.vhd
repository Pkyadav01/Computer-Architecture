library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_TB is
end entity MUX_TB;

architecture Simulation of MUX_TB is
  signal D : std_logic_vector(3 downto 0) := "1010";
  signal S : std_logic_vector(1 downto 0) := "00";
  signal Y : std_logic;
begin
  DUT: entity work.MUX_4TO1 port map (D => D, S => S, Y => Y);

  STIMULUS: process
  begin
    -- D = "1010": D3=1, D2=0, D1=1, D0=0
    S <= "00"; wait for 10 ns;  -- Y = D(0) = 0
    S <= "01"; wait for 10 ns;  -- Y = D(1) = 1
    S <= "10"; wait for 10 ns;  -- Y = D(2) = 0
    S <= "11"; wait for 10 ns;  -- Y = D(3) = 1
    wait;
  end process;
end architecture Simulation;
