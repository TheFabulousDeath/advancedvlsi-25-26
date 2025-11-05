library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity and3 is
	port (
		a : in  std_logic;
		b : in  std_logic;
		c : in  std_logic;
		r : out std_logic
	);
end entity and3;

architecture behav of and3 is

    signal t : std_logic;

begin

    t <= a and b;
	r <= t and c;

end behav;

