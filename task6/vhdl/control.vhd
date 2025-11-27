library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

library work;
use work.opcodes.ALL;

entity Control is
    port (
        OPCODE : in STD_LOGIC_VECTOR(6 downto 0);
        ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch: out STD_LOGIC;
        ALUOp : out STD_LOGIC_VECTOR(1 downto 0)
    );
end entity Control;

architecture behav of Control is

    signal ALUOp1, ALUOp0 : STD_LOGIC;
    
    constant number_of_control_outputs : natural := 8; -- Remember that ALUOp counts as two outputs.

begin
    
    combinational : process(OPCODE)
    
        variable output_vector : STD_LOGIC_VECTOR(number_of_control_outputs - 1 downto 0);
    
    begin
        
        ALUOp <= ALUOp0 & ALUOp1;
        -- TODO: IMPLEMENT J TYPE DATA PATH
        case OPCODE is
            when OP_LOAD =>
                output_vector := "11110000";
            when OP_STORE =>
                output_vector := "10001000"; -- TODO, check if MemtoReg being 0 is a problem 1X001000.
            when OP_BRANCH =>
                output_vector := "00000101"; -- TODO, check if MemtoReg being 0 is a problem 0X000101.
            when OP_REG_REG =>
                output_vector := "00100010";
            when others =>
                output_vector := "00100010"; -- Default is R-Format
        end case;
        
        ALUSrc <= output_vector(0);
        MemtoReg <= output_vector(1);
        RegWrite <= output_vector(2);
        MemRead <= output_vector(3);
        MemWrite <= output_vector(4);
        Branch <= output_vector(5);
        AluOp1 <= output_vector(6);
        AluOp0 <= output_vector(7);
        
        
    end process;
    
        
    
end behav;

