library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;

use work.cpu_constants.ALL;
use work.misc.log2;

entity instruction_memory_write_unit is
	generic(
		program_file : string := "C:/Users/vincent/GitHub/advancedvlsi-25-26/task6/programs/program.byte"
	);
	port(
        clk : in STD_LOGIC;
        INSTRUCTION_MEMORY_WRITE_DATA   : out STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
        INSTRUCTION_MEMORY_WRITE_ADDR   : out STD_LOGIC_VECTOR(log2(INSTRUCTION_MEM_SIZE) - 1 downto 0);
        INSTRUCTION_MEMORY_WRITE_ENABLE : out STD_LOGIC;
        HALT_PC                         : out STD_LOGIC
	);
end entity;

architecture behav of instruction_memory_write_unit is
	file read_file    : text;
	file f : text open read_mode is program_file;
begin

program_memory : process(clk)
    variable current_word : std_logic_vector(ARCHITECTURE_RANGE);
    variable current_line : line;
    variable pointer      : natural := 0;
    variable file_opened  : boolean := false;
begin
    if rising_edge(clk) then
        if pointer = 0 then
            HALT_PC <= '1';
            INSTRUCTION_MEMORY_WRITE_ENABLE <= '1';
            file_open(read_file, program_file, read_mode);
            file_opened := true;
        end if;

        if file_opened then
            if not endfile(read_file) then
                readline(read_file, current_line);
                read(current_line, current_word);

                INSTRUCTION_MEMORY_WRITE_ADDR <=
                    std_logic_vector(to_unsigned(pointer, INSTRUCTION_MEMORY_WRITE_ADDR'Length));
                INSTRUCTION_MEMORY_WRITE_DATA <= current_word;
                pointer := pointer + 4;
            else
                file_close(read_file);
                file_opened := false;
                HALT_PC <= '0';
                INSTRUCTION_MEMORY_WRITE_ENABLE <= '0';
            end if;
        end if;
    end if;
end process;


end behav;