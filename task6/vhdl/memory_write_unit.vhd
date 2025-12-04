library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;

use work.cpu_constants.ALL;

entity instruction_memory_write_unit is
    generic(
        program_file : string := "program.byte"
    );
    port(
        INSTRUCTION_MEMORY_WRITE_DATA   : out STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
        INSTRUCTION_MEMORY_WRITE_ADDR   : out STD_LOGIC_VECTOR(log2(INSTRUCTION_MEM_SIZE) - 1 downto 0);
        INSTRUCTION_MEMORY_WRITE_ENABLE : out STD_LOGIC;
        INSTRUCTION_MEMORY_CLOCK        : out STD_LOGIC;
        HALT_PC                         : out STD_LOGIC;
        clk                             : in STD_LOGIC;
    );
end entity;

architecture behav of instruction_memory_write_unit is

begin

    clock_proc : process(clk)
    begin
        INSTRUCTION_MEMORY_CLOCK <= clk;
    end process;

    program_memory : process
        variable current_word : STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
        variable trash        : character;
        variable current_line : line;
        variable pointer      : natural := 0;
    begin
        HALT_PC <= '1';
        INSTRUCTION_MEMORY_WRITE_ENABLE <= '1';
        wait 1 ns; -- #TODO Magic Number. Maybe wait for a signal from the CPU?
    
        file_open(read_file, program_file, read_mode);

        while not endfile(read_file) loop
            readline(read_file, current_line);
            read(current_line, current_word);

            INSTRUCTION_MEMORY_WRITE_ADDRESS    <= STD_LOGIC_VECTOR(to_unsigned(pointer));
            INSTRUCTION_MEMORY_WRITE_DATA       <= current_word;
            
            wait 1 ns; -- #TODO Magic Number.

            
        end loop;

        wait 1 ns; -- #TODO Magic Number. Maybe wait for a signal from the CPU?
        HALT_PC <= '0';
        INSTRUCTION_MEMORY_WRITE_ENABLE <= '0';

        wait 1 ns; -- #TODO Magic Number.

    end process;

end behav;