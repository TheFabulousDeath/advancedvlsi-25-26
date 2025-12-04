library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.misc.ALL;
use work.register_aliases.ALL;
use work.funct7.ALL;
use work.funct3.ALL;
use work.opcodes.ALL;
use work.instruction_ranges.ALL;

entity memory is
	generic (
		word_size : natural := 32;
		mem_size : natural := 2**10
	);
	port (
		addr_write, addr_read : in std_logic_vector(log2(mem_size) - 1 downto 0);
		write_en, clk : in std_logic;
		data_write : in std_logic_vector(word_size - 1 downto 0);
		data_read : out std_logic_vector(word_size - 1 downto 0)
	);
end entity memory;

architecture bram of memory is

    type mem_file_type is array (0 to mem_size - 1) of std_logic_vector(word_size - 1 downto 0);
    
    signal RAM : mem_file_type;
    
    attribute ram_style : string;
    attribute ram_style of RAM : signal is "block";

begin
 
    sequential_logic : process(clk)
    begin
        if rising_edge(clk) then
            if write_en = '1' then
                RAM(TO_INTEGER(unsigned(addr_write))) <= data_write;
            end if;
            data_read <= RAM(TO_INTEGER(unsigned(addr_read)));
        end if;
    end process;

end bram;

architecture distributed of memory is

    type mem_file_type is array (0 to mem_size - 1) of std_logic_vector(word_size - 1 downto 0);
    
    signal RAM : mem_file_type;
    
    attribute ram_style : string;
    attribute ram_style of RAM : signal is "distributed";

begin

    RAM(0) <= F7_ADD & x0 & x0 & F3_ADD & x0 & OP_REG_REG; -- NOP
    -- Small Program:
    --RAM(0) <= F7_ADD & x0 & x0 & F3_ADD & x0 & OP_REG_REG; -- NOP
    --RAM(1) <= to_signed(8, I_IMMEDIATE_RANGE'Length) & x0 & F3_ADDI & x5 & OP_REG_IMM; --ADDI x5, x0, 8
    --RAM(2) <= F7_ADD & x0 & x5 & F3_ADD & x6 & OP_REG_REG; -- ADD x6, x0, x5
    --RAM(3) <= F7_ADD & x5 & x6 & F3_ADD & x5 & OP_REG_REG; -- ADD x5, x6, x5
    --RAM(4) <= "0000000" & x5 & x0 & F3_SW & "00000" & OP_STORE; -- SW x5, 0(x0) 

    sequential_logic : process(clk)
    begin
        if rising_edge(clk) then
            if write_en = '1' then
                RAM(TO_INTEGER(unsigned(addr_write))) <= data_write;
            end if;
        end if;
    end process;
    
    combinational_logic : process(addr_read)
    begin
        data_read <= RAM(TO_INTEGER(unsigned(addr_read)));
    end process;

end distributed;


