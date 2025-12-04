library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity rsa_unit is
    Generic (
        bits : integer := 64
    );
    Port ( input : in signed(bits - 1 downto 0);
           shift : in integer;
           result : out signed(bits - 1 downto 0)
   );
end rsa_unit;

architecture behav of rsa_unit is
begin
    
    process(input, shift)
        variable returnvalue : signed(bits - 1 downto 0);
    begin
        returnvalue(bits - shift - 1 downto 0) := input(bits - 1 downto shift);
        returnvalue(bits - 1 downto bits - shift) := (others => input(bits - 1));
        result <= returnvalue;
    end process;
    
end behav;
