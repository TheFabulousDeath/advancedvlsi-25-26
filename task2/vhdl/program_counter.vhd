library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity program_counter is

    generic(
        bits : integer := 32
    );
    port(
        load, rst, clk : in std_logic;
        pc_in : in std_logic_vector(bits -1 downto 0);
        output : out std_logic_vector(bits - 1 downto 0)
    );
    
   
end entity program_counter;

architecture behav of program_counter is
    
    signal q_to_adder, adder_to_d : std_logic_vector(bits - 1 downto 0);
    signal constant_one : std_logic_vector(bits - 1 downto 0) := (2 => '1', others => '0');
    
begin

    adder : entity work.adder(behav)
        generic map (bits => bits)
        port map(
            a => q_to_adder,
            b => constant_one,
            c => adder_to_d
        );

    pc_reg : entity work.reg(behav)
        generic map (bits => bits)
        port map(
            d => adder_to_d,
            q => q_to_adder,
            clk => clk,
            rst => rst
        );
    
    -- I doubt that it is necessary to have another register, but it might work.
    process(clk, rst)
    begin
        if rising_edge(clk) then
            if load = '1' then
                adder_to_d <= pc_in;
            end if;
        end if;
    end process;
    
    
end behav;

