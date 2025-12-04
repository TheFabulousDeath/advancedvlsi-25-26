library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.cpu_constants.ALL;
use work.misc.ALL;

entity scc_tb is
end entity;

architecture behav of scc_tb is
    signal rst, clk, HALT_PC               : STD_LOGIC;
    signal DEBUG_DATA_MEM_READ_DATA        : STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
    signal DEBUG_INSTRUCTION_BUS           : STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
    signal INSTRUCTION_MEMORY_WRITE_DATA   : STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
    signal INSTRUCTION_MEMORY_WRITE_ADDR   : STD_LOGIC_VECTOR(log2(INSTRUCTION_MEM_SIZE) - 1 downto 0);
    signal INSTRUCTION_MEMORY_WRITE_ENABLE : STD_LOGIC;
    signal INSTRUCTION_MEMORY_CLOCK        : STD_LOGIC;

    constant clk_period : time := 10 ns;
begin

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    programmer : entity work.sccpu
        port map(
            rst, clk,
            DEBUG_DATA_MEM_READ_DATA,
            DEBUG_INSTRUCTION_BUS,
            INSTRUCTION_MEMORY_WRITE_DATA,
            INSTRUCTION_MEMORY_WRITE_ADDR,
            INSTRUCTION_MEMORY_WRITE_ENABLE,
            INSTRUCTION_MEMORY_CLOCK,
            HALT_PC
        );

end behav;