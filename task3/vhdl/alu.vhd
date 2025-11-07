library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.isa_riscv.ALL;

entity alu is
    generic(
        bits : integer := 32;
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
    
    signal rsa_output, rsa_input : signed(bits - 1 downto 0);
    signal rsa_shift : integer;
    
begin

    -- ==== Right shift instantiation and signal assignment ====
    rsa_instance : entity work.rsa_unit
        generic map (bits => bits)
        port map(input => rsa_input, shift => rsa_shift, result => rsa_output);
    
    rsa_input <= signed(a);
    rsa_shift <= to_integer(unsigned(b));
    
    alu_process : process(a,b,op)
        variable result : std_logic_vector(bits - 1 downto 0);
    begin
        -- ==== Computation ====
        -- Undefined behaviour leads to addition.
        result := std_logic_vector(signed(a) + signed(b));
        case op is
            when work.isa_riscv.opcode_ADD =>
                result := std_logic_vector(signed(a) + signed(b));
            when work.isa_riscv.opcode_SUB =>
                result := std_logic_vector(signed(a) - signed(b));
            when work.isa_riscv.opcode_SLL =>
                result := std_logic_vector(unsigned(a) sll to_integer(unsigned(b)));
            when work.isa_riscv.opcode_SLT =>
                if signed(a) < signed(b) then
                    result := (0 => '1', others => '0');
                else 
                    result := (others => '0');
                end if;
            when work.isa_riscv.opcode_SLTU =>
                if unsigned(a) < unsigned(b) then
                    result := (0 => '1', others => '0');
                else 
                    result := (others => '0');
                end if;
            when work.isa_riscv.opcode_XOR =>
                result := a xor b;
            when work.isa_riscv.opcode_SRL =>
                result := std_logic_vector(unsigned(a) srl to_integer(unsigned(b)));
            when work.isa_riscv.opcode_SRA =>
                result := std_logic_vector(rsa_output);
            when work.isa_riscv.opcode_OR =>
                result := a or b;
            when work.isa_riscv.opcode_AND =>
                result := a and b;
            when others =>
        end case;
        
        -- ==== Flags ====
        f_zero <= '0';
        f_ltzero <= '0';
        if signed(result) = 0 then
            f_zero <= '1';
        elsif signed(result) < 0 then
            f_ltzero <= '1';
        end if;
        
        
        
        c <= result;
    end process;
    
end behav;

