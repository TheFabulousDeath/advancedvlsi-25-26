library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity reg is
    generic(
        bits : integer := 4
    );
    port(
        d : in std_logic_vector(bits - 1 downto 0);
        clk, rst : in std_logic;
        q : out std_logic_vector(bits - 1 downto 0)
    );

end entity reg;

architecture behav of reg is

	-------------------------------
	-- TODO (if required)
	-- Define additional signals
	-------------------------------

begin

    flipflop : process (clk, rst)
    begin
        if rst = '1' then
            q <= (others => '0');
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
    
end behav;

