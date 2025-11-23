

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.alu_control.ALL;
use work.cpu_constants.ALL;
use work.instruction_ranges.ALL;
use work.funct3.ALL;
use work.funct7.ALL;

entity alu_controller is
    port(
        Instruction : in STD_LOGIC_VECTOR(INSTRUCTION_RANGE);
        CTRL_ALU_OP : in STD_LOGIC_VECTOR(CTRL_ALU_OP_RANGE);
        ALU_OPCODE : out STD_LOGIC_VECTOR(ALU_OPCODE_RANGE)
    );
end entity;

architecture behav of alu_controller is
    signal funct7 : STD_LOGIC_VECTOR(FUNCT7_RANGE);
    signal funct3 : STD_LOGIC_VECTOR(FUNCT3_RANGE);
    
begin

    -- Extract funct7 and funct3 from instruction
    funct7 <= Instruction(FUNCT7_RANGE);
    funct3 <= Instruction(FUNCT3_RANGE);
    
    process(funct7, funct3, CTRL_ALU_OP)
    begin
        case CTRL_ALU_OP is
            when "00" => 
                ALU_OPCODE <= ALUOp_ADD;

            when "01" =>
                ALU_OPCODE <= ALUOp_SUB;

            when "10" =>
                case funct7 & funct3 is

                    -- ADD / ADDI
                    when (F7_ADD & F3_ADD)  |
                        (F7_ADD & F3_ADDI) =>
                        ALU_OPCODE <= ALUOp_ADD;

                    -- SUB
                    when (F7_SUB & F3_SUB) =>
                        ALU_OPCODE <= ALUOp_SUB;

                    -- SLL / SLLI
                    when (F7_SLL & F3_SLL)   |
                        (F7_SLLI & F3_SLLI) =>
                        ALU_OPCODE <= ALUOp_SLL;

                    -- SLT / SLTI
                    when (F7_SLT & F3_SLT)   |
                        (F7_SLT & F3_SLTI) =>
                        ALU_OPCODE <= ALUOp_SLT;

                    -- SLTU / SLTIU
                    when (F7_SLTU & F3_SLTU) |
                        (F7_SLTU & F3_SLTIU) =>
                        ALU_OPCODE <= ALUOp_SLTU;

                    -- XOR / XORI
                    when (F7_XOR & F3_XOR)   |
                        (F7_XOR & F3_XORI) =>
                        ALU_OPCODE <= ALUOp_XOR;

                    -- SRL / SRLI
                    when (F7_SRL & F3_SRL)   |
                        (F7_SRL & F3_SRLI) =>
                        ALU_OPCODE <= ALUOp_SRL;

                    -- SRA / SRAI
                    when (F7_SRA & F3_SRA)   |
                        (F7_SRAI & F3_SRAI) =>
                        ALU_OPCODE <= ALUOp_SRA;

                    -- OR / ORI
                    when (F7_OR & F3_OR)     |
                        (F7_OR & F3_ORI) =>
                        ALU_OPCODE <= ALUOp_OR;

                    -- AND / ANDI
                    when (F7_AND & F3_AND)   |
                        (F7_AND & F3_ANDI) =>
                        ALU_OPCODE <= ALUOp_AND;

                    when others =>
                        ALU_OPCODE <= ALUOp_ADD;
                end case;
            -- ALUOp = 11
            when others =>
                ALU_OPCODE <= ALUOp_ADD;

        end case;   
    end process;

end behav;
