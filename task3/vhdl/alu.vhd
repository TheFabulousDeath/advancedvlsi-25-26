library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.isa_riscv.ALL;

entity alu is
    generic(
        bits : integer := 8;
        op_width : integer := 4
    );
    port(
        a, b : in std_logic_vector(bits - 1 downto 0);
        op : in std_logic_vector(op_width -1 downto 0);
        c : out std_logic_vector(bits - 1 downto 0);
        f_zero, f_ltzero : out std_logic
    );

end entity alu;

architecture behav of alu is

	-------------------------------
	-- TODO (if required)
	-- Define additional signals
	-------------------------------
    
begin
    alu_process : process(a,b,op)
    begin
        c <= std_logic_vector(signed(a) + signed(b));
        case op is
            when work.isa_riscv.opcode_ADD =>
                c <= std_logic_vector(signed(a) + signed(b));
            when work.isa_riscv.opcode_SUB =>
                c <= std_logic_vector(signed(a) - signed(b));
            when work.isa_riscv.opcode_SLL =>
                c <= std_logic_vector(unsigned(a) sll 1);
            --when work.isa_riscv.opcode_SLT =>
            --when work.isa_riscv.opcode_SLTU =>
            when work.isa_riscv.opcode_XOR =>
                c <= a xor b;
            when work.isa_riscv.opcode_SRL =>
                c <= std_logic_vector(unsigned(a) srl 1);
            --when work.isa_riscv.opcode_SRA =>
            --    c <= std_logic_vector(signed(a) sra 1);
            when work.isa_riscv.opcode_OR =>
                c <= a or b;
            when work.isa_riscv.opcode_AND =>
                c <= a and b;
            when others => -- Undefined behaviour leads to addition.
        end case;
    end process;
    
end behav;

