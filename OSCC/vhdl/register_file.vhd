library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.misc.log2;

entity register_file is
    generic(
        word_size : natural := 32; --Word size (register width) in bits
        size : natural := 32 --Number of register
    );
    Port (
        addr_a, addr_b, addr_c : in std_logic_vector(log2(size) - 1 downto 0);
        data_a, data_b : out std_logic_vector(word_size - 1 downto 0);
        data_c : in std_logic_vector(word_size - 1 downto 0);
        w_en, clk : in std_logic
    );
end register_file;

architecture Behavioral of register_file is
    type reg_file_type is array (0 to 31) of std_logic_vector(word_size - 1 downto 0);
    
    signal reg_file : reg_file_type := (others => (others => '0'));
    
    attribute ram_style : string;
    attribute ram_style of reg_file : signal is "registers";
    
begin

    sequential_logic : process(clk)
    
    begin
        if rising_edge(clk) then
            if w_en = '1' then
                reg_file(TO_INTEGER(unsigned(addr_c))) <= data_c;
            end if;
        end if;
    end process;
    data_a <= reg_file(TO_INTEGER(unsigned(addr_a))); -- This should be combinational for single cycle CPU -> turn into separate process.
    data_b <= reg_file(TO_INTEGER(unsigned(addr_b)));

end Behavioral;
