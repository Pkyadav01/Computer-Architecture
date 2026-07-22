library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COUNTER_TB is
end entity COUNTER_TB;

architecture Simulation of COUNTER_TB is
    signal CLK : std_logic := '0';
    signal RST : std_logic := '0';
    signal UP : std_logic := '1';
    signal COUNT_UP : std_logic_vector(3 downto 0);
    signal COUNT_UD : std_logic_vector(3 downto 0);
    
    constant CLK_PERIOD : time := 20 ns;
    
    -- Control signal to tell the clock when to stop
    signal Sim_Done : boolean := false;

begin

    -- Component Instantiations
    U1 : entity work.COUNTER_UP 
        port map (CLK => CLK, RST => RST, COUNT => COUNT_UP);
        
    U2 : entity work.COUNTER_UPDOWN 
        port map (CLK => CLK, RST => RST, UP => UP, COUNT => COUNT_UD);

    -- 1. Bounded Clock Process Using a Loop
    CLOCK_GEN : process
    begin
        -- Generates exactly 30 clock cycles total, then stops
        for i in 1 to 30 loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        
        -- Alternatively, loop until Sim_Done signal is true:
        -- while not Sim_Done loop
        --     CLK <= not CLK;
        --     wait for CLK_PERIOD / 2;
        -- end loop;
        
        wait; -- Stops the clock process completely
    end process CLOCK_GEN;

    -- 2. Testbench Stimulus Process
    STIMULUS : process
    begin
        -- Reset both counters (Takes 2 clock cycles)
        RST <= '1';
        wait for 40 ns;
        RST <= '0';
        
        -- Count up for 10 clock cycles
        UP <= '1';
        wait for 200 ns;
        
        -- Count down for 5 clock cycles
        UP <= '0';
        wait for 100 ns;
        
        -- Reset and count up again (Takes 2 + 10 clock cycles)
        RST <= '1';
        wait for 40 ns;
        RST <= '0';
        UP <= '1';
        wait for 200 ns;
        
        Sim_Done <= true; -- Signal to stop the while loop variant if used
        wait; -- Suspends the stimulus process
    end process STIMULUS;

end architecture Simulation;
