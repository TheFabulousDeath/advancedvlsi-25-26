library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity program_counter is

    generic(
        bits : integer := 32;
        increment : STD_LOGIC_VECTOR := "100"
    );
    port(
        load, rst, clk : in std_logic;
        pc_in : in std_logic_vector(bits -1 downto 0);
        output : out std_logic_vector(bits - 1 downto 0)
    );
    
   
end entity program_counter;

architecture behav of program_counter is
    
    signal counter, adder_output : std_logic_vector(bits - 1 downto 0);
    
    
begin
    
    sequential : process(clk)
    begin

        if rising_edge(clk) then
            counter <= STD_LOGIC_VECTOR(unsigned(counter) + unsigned(increment));
            if load = '1' then
                counter <= pc_in;
            end if;
            if rst = '1' then
                counter <= (others => '0');
            end if;
        end if;
    end process;
    
    output <= counter;
end behav;

