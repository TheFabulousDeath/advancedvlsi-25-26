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
    function shift_right_arithmetic(input : signed; shift : integer) return signed is
        variable returnvalue : signed(bits - 1 downto 0);
    begin
        returnvalue(bits - shift - 1 downto 0) := input(bits - 1 downto shift); -- Shift right
        returnvalue(bits - 1 downto bits - shift) := (others => input(bits - 1)); -- Sign filling
        return returnvalue;
    end function;
begin

    result <= shift_right_arithmetic(input, shift);
    
end behav;
