library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity adder is
    generic(
        bits : integer := 4
    );
    port(
        a, b : in std_logic_vector(bits - 1 downto 0);
        c : out std_logic_vector(bits -1 downto 0)
    );
    
end entity adder;

architecture behav of adder is

begin
    
    adder : process(a, b)
    begin
        c <= std_logic_vector(  signed(a) + signed(b)  );
    end process;
    
end behav;

