library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.misc.ALL;

entity memory is
	generic (
		word_size : natural := 4; -- Number of bytes in a word
		mem_size : natural := 2**10 -- In bytes.
	);
	port (
		addr_write, addr_read : in std_logic_vector(log2(mem_size) - 1 downto 0);
		write_en, clk : in std_logic;
		data_write : in std_logic_vector(word_size * 8 - 1 downto 0);
		data_read : out std_logic_vector(word_size * 8 - 1 downto 0)
	);
end entity memory;

--architecture bram of memory is
--
--    type mem_file_type is array (0 to mem_size - 1) of std_logic_vector(7 downto 0);
--    
--    signal RAM : mem_file_type;
--    
--    attribute ram_style : string;
--    attribute ram_style of RAM : signal is "block";
--
--begin
--
--    sequential_logic : process(clk)
--    begin
--        if rising_edge(clk) then
--            if write_en = '1' then
--                RAM(TO_INTEGER(unsigned(addr_write))) <= data_write;
--            end if;
--            data_read <= RAM(TO_INTEGER(unsigned(addr_read)));
--        end if;
--    end process;
--
--end bram;


architecture distributed of memory is

    type mem_file_type is array (0 to mem_size - 1) of std_logic_vector(7 downto 0);
    signal RAM : mem_file_type;

    attribute ram_style : string;
    attribute ram_style of RAM : signal is "distributed";

begin

    sequential_logic : process(clk)
    begin
        if rising_edge(clk) then
            if write_en = '1' then
                for i in 0 to word_size - 1 loop
                    RAM(TO_INTEGER(unsigned(addr_write)) + i) <= data_write((i+1)*8-1 downto i*8);
                end loop;
            end if;
        end if;
    end process;

    combinational_logic : process(addr_read, RAM)
    begin
        for i in 0 to word_size - 1 loop
            data_read((i+1)*8-1 downto i*8) <= RAM(TO_INTEGER(unsigned(addr_read)) + i);
        end loop;
    end process;

end architecture distributed;


