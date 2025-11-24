library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

use work.misc.ALL;
use work.cpu_constants.ALL;
use work.instruction_ranges.ALL;

entity sccpu is
    port(
        rst, clk                        : in STD_LOGIC;
        DEBUG_DATA_MEM_READ_DATA        : out STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
        DEBUG_INSTRUCTION_BUS           : out STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
        INSTRUCTION_MEMORY_WRITE_DATA   : in STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
        INSTRUCTION_MEMORY_WRITE_ADDR   : in STD_LOGIC_VECTOR(log2(INSTRUCTION_MEM_SIZE) - 1 downto 0);
        INSTRUCTION_MEMORY_WRITE_ENABLE : in STD_LOGIC
    );
    
end entity sccpu;

architecture behav of sccpu is
    
    component memory
        generic (
            word_size : natural := 32;
            mem_size : natural := 2**10
        );
        port (
            addr_write, addr_read : in std_logic_vector(log2(mem_size) - 1 downto 0);
            write_en, clk : in std_logic;
            data_write : in std_logic_vector(word_size - 1 downto 0);
            data_read : out std_logic_vector(word_size - 1 downto 0)
        );
    end component;
    
    signal JumpAddressOffset                : STD_LOGIC_VECTOR(COUNTER_RANGE);
    
    signal InstructionMemoryReadAddress     : STD_LOGIC_VECTOR(COUNTER_RANGE);
    
    signal INSTRUCTION_BUS                  : STD_LOGIC_VECTOR(INSTRUCTION_RANGE);

    signal CTRL_ALUSrc, CTRL_MemtoReg, CTRL_RegWrite, CTRL_MemRead, CTRL_MemWrite, CTRL_BRANCH : STD_LOGIC;
    signal CTRL_ALUOP                       : STD_LOGIC_VECTOR(1 downto 0);

    signal Branch_Taken                     : STD_LOGIC;

    signal REGISTER1_DATA                   : STD_LOGIC_VECTOR(REGISTER_WORD_RANGE);
    signal REGISTER2_DATA                   : STD_LOGIC_VECTOR(REGISTER_WORD_RANGE);
    signal REGISTER_WRITE_DATA              : STD_LOGIC_VECTOR(REGISTER_WORD_RANGE);
    
    signal ALU_OPCODE                       : STD_LOGIC_VECTOR(ALU_OPCODE_RANGE);
    signal ALU_A, ALU_B, ALU_C              : STD_LOGIC_VECTOR(ARCHITECTURE_RANGE);
    signal ZERO_FLAG, LTZERO_FLAG           : STD_LOGIC;

    signal DataMemoryAddress                : STD_LOGIC_VECTOR(REGISTER_WORD_RANGE);
    signal DataMemoryWriteData              : STD_LOGIC_VECTOR(REGISTER_WORD_RANGE);
    signal DataMemoryReadData               : STD_LOGIC_VECTOR(REGISTER_WORD_RANGE);
    
begin
    
    counter : entity work.program_counter(behav)
        generic map(
            bits => ARCHITECTURE_WIDTH
        )
        port map(
            load        => Branch_Taken,
            rst         => rst,
            clk         => clk,
            pc_in       => JumpAddressOffset,
            output      => InstructionMemoryReadAddress
        );
    
    instruction_memory : entity work.memory(distributed)
        generic map(
            word_size   => ARCHITECTURE_WIDTH,
            mem_size    => INSTRUCTION_MEM_SIZE
        )
        port map(
            addr_read   => InstructionMemoryReadAddress(log2(INSTRUCTION_MEM_SIZE) - 1 downto 0),
            addr_write  => INSTRUCTION_MEMORY_WRITE_ADDR,
            write_en    => INSTRUCTION_MEMORY_WRITE_ENABLE,
            clk         => clk,
            data_write  => INSTRUCTION_MEMORY_WRITE_DATA,
            data_read   => INSTRUCTION_BUS
        );
    
    main_controller : entity work.Control
        port map(
            OPCODE      => INSTRUCTION_BUS(6 downto 0),
            ALUSrc      => CTRL_ALUSrc,
            MemtoReg    => CTRL_MemtoReg,
            RegWrite    => CTRL_RegWrite,
            MemRead     => CTRL_MemRead,
            MemWrite    => CTRL_MemWrite,
            Branch      => CTRL_Branch,
            ALUOp       => CTRL_ALUOP
        );
    
    register_File : entity work.register_file
    
        generic map(
            word_size   => ARCHITECTURE_WIDTH,
            size        => REG_FILE_SIZE
        )
        port map (
            addr_a      => INSTRUCTION_BUS(RS1_RANGE),
            addr_b      => INSTRUCTION_BUS(RS2_RANGE),
            addr_c      => INSTRUCTION_BUS(RD_RANGE),
            data_a      => REGISTER1_DATA,
            data_b      => REGISTER2_DATA,
            data_c      => REGISTER_WRITE_DATA,
            w_en        => CTRL_RegWrite, 
            clk         => clk
        );
        
    immediate_generator : entity work.immediate_generator
        port map(
            Instruction => INSTRUCTION_BUS,
            Immediate   => JumpAddressOffset
        );
        
    alu : entity work.alu
        generic map(
            bits => ARCHITECTURE_WIDTH,
            op_width => 4
        )
        port map(
            a => ALU_A,
            b => ALU_B,
            op => ALU_OPCODE,
            c => ALU_C,
            f_zero => ZERO_FLAG,
            f_ltzero => LTZERO_FLAG
        );
        
        ALU_A <= REGISTER1_DATA;



    ALU_MUX : process(CTRL_ALUSrc, REGISTER2_DATA, JumpAddressOffset)
        begin
            ALU_B <= REGISTER2_DATA;
            if CTRL_ALUSrc = '1' then
                ALU_B <= JumpAddressOffset;
            end if;
        end process;
    
    
    data_memory : entity work.memory(distributed)
        generic map(
            word_size   => ARCHITECTURE_WIDTH,
            mem_size    => DATA_MEM_SIZE
        )
        port map(
            addr_read   => DataMemoryAddress(log2(DATA_MEM_SIZE) - 1 downto 0),
            addr_write  => DataMemoryAddress(log2(DATA_MEM_SIZE) - 1 downto 0),
            write_en    => CTRL_MemWrite,
            clk         => clk,
            data_write  => REGISTER2_DATA,
            data_read   => DataMemoryReadData
        );
    
        DataMemoryAddress <= ALU_C;

    DATA_MEM_OUT_MUX : process(CTRL_MemtoReg, DataMemoryReadData, ALU_C)
        begin
            REGISTER_WRITE_DATA <= ALU_C;
            if CTRL_MemtoReg = '1' then
                REGISTER_WRITE_DATA <= DataMemoryReadData;
            end if;
        end process;

    alu_controller : entity work.alu_controller
        port map(
            Instruction => INSTRUCTION_BUS,
            CTRL_ALU_OP => CTRL_ALUOP,
            ALU_OPCODE =>ALU_OPCODE
        );

    BRANCH_AND : process(CTRL_Branch, ZERO_FLAG)
    begin
        Branch_Taken <= '0';
        if CTRL_BRANCH = '1' and ZERO_FLAG = '1' then
            Branch_Taken <= '1';
        end if;
    end process;
    
    DEBUG_DATA_MEM_READ_DATA <= DataMemoryReadData;
    DEBUG_INSTRUCTION_BUS <= INSTRUCTION_BUS;
end behav;

