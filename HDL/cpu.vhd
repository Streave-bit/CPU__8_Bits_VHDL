library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpu is 
port(
    clk: in std_logic;
    rst:in std_logic;
    op: out std_logic_vector(7 downto 0)
);
end entity;

architecture behave of cpu is
    component alu is
        port(
        en : in std_logic;
        op : in std_logic;
        reg_a_in : in std_logic_vector ( 7 downto 0);
        reg_b_in : in std_logic_vector ( 7 downto 0);
        carry_out : out std_logic;
        zero_flag : out std_logic;
        res_out : out std_logic_vector ( 7 downto 0)
    );
    end component;
    component cu is
        port(
        clk: in std_logic;
        rst:in std_logic;
        inst:in std_logic_vector(3 downto 0);
        do: out std_logic_vector(16 downto 0)
    );
    end component;
    component gen_reg is
        port(
        clk : in std_logic;
        rst : in std_logic;
        out_en : in std_logic;
        ld : in std_logic;
        inputs : in std_logic_vector (7 downto 0);
        outputs : out std_logic_vector (7 downto 0);
        outputs_alu : out std_logic_vector (7 downto 0)
    );
    end component;
    component mar is
        port(
        clk : in std_logic;
        rst : in std_logic;
        ld : in std_logic;
        inputs : in std_logic_vector (3 downto 0);
        outputs : out std_logic_vector (3 downto 0)
    );
    end component;
    component mem is
        port(
        clk :in std_logic;
        ld :in std_logic;
        oe :in std_logic;
        addr_in :in std_logic_vector(3 downto 0);
        data_in :in std_logic_vector(7 downto 0);
        data_out :out std_logic_vector(7 downto 0)
    );
    end component;
    component pc is
        port(
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        oe : in std_logic;
        ld : in std_logic;
        inputs : in std_logic_vector(3 downto 0);
        outputs : out std_logic_vector (3 downto 0)
    );
    end component;

     signal clk_sig : std_logic;
     signal halt_sig : std_logic;

     --ALU
        
    --CU
signal main_bus : std_logic_vector (7 downto 0);      
signal  pc_en_sig : std_logic;
signal  pc_oe_sig : std_logic;
signal  pc_ld_sig : std_logic;

signal inst_out : std_logic_vector (3 downto 0);
signal inst_out_sig : std_logic_vector (7 downto 0);
signal mar_mem_sig : std_logic_vector (3 downto 0);


signal cu_out_sig : std_logic_vector (16 downto 0);
signal mar_ld_sig : std_logic;
signal mem_oe_sig : std_logic;
signal mem_ld_sig : std_logic;
signal inst_ld_sig : std_logic;
signal inst_oe_sig : std_logic;

signal reg_op_oe_sig : std_logic;
signal reg_op_ld_sig : std_logic;
signal reg_a_oe_sig : std_logic;
signal reg_a_ld_sig : std_logic;
signal reg_b_oe_sig : std_logic;
signal reg_b_ld_sig : std_logic;
signal reg_b_alu : std_logic_vector (7 downto 0);
signal reg_a_alu : std_logic_vector (7 downto 0);

signal alu_en_sig : std_logic;
signal alu_op_sig : std_logic;




begin
    clk_sig <= clk and (not halt_sig);

    pc_inst : pc port map (
        clk =>clk_sig, 
        rst=>rst, 
        en => pc_en_sig,
        oe => pc_oe_sig,
        ld => pc_ld_sig, 
        inputs => main_bus(3 downto 0), 
        outputs =>main_bus(3 downto 0)
        );

    cu_inst : cu port map (
        clk=>clk_sig ,
        rst=> rst, 
        inst=> inst_out,
        do => cu_out_sig
    );
    mar_inst : mar port map (
        clk => clk_sig,
        rst => rst,
        ld => mar_ld_sig,
        inputs => main_bus(3 downto 0),
        outputs => mar_mem_sig
    );
    mem_inst : mem port map (
        clk => clk_sig,
        ld => mem_ld_sig,
        oe => mem_oe_sig,
        addr_in => mar_mem_sig,
        data_in => main_bus,
        data_out => main_bus
    );
    inst_reg_inst : gen_reg port map (
        clk => clk_sig,
        rst => rst,
        out_en => inst_oe_sig,
        ld => inst_ld_sig,
        inputs => main_bus,
        outputs_alu=> inst_out_sig
    );

    inst_out<=inst_out_sig(7 downto 4);
    main_bus(3 downto 0)<=inst_out_sig (3 downto 0) when inst_oe_sig='1' else (others=>'Z');

    reg_A_inst : gen_reg port map (
        clk => clk_sig,
        rst => rst,
        out_en => reg_a_oe_sig,
        ld => reg_a_ld_sig,
        inputs => main_bus,
        outputs => main_bus,
        outputs_alu=> reg_a_alu
    );
    reg_B_inst : gen_reg port map (
        clk => clk_sig,
        rst => rst,
        out_en => reg_a_oe_sig,
        ld => reg_b_ld_sig,
        inputs => main_bus,
        outputs => main_bus,
        outputs_alu=> reg_b_alu
    );
    reg_op_inst : gen_reg port map (
        clk => clk_sig,
        rst => rst,
        out_en => reg_op_oe_sig,
        ld => reg_op_ld_sig,
        inputs => main_bus,
        outputs => open,
        outputs_alu=> op
    );
    alu_inst : alu port map (
        en => alu_en_sig,
        op => alu_op_sig,
        reg_a_in => reg_a_alu,
        reg_b_in => reg_b_alu,
        carry_out => open,
        zero_flag => open,
        res_out => main_bus
    );
    halt_sig 	<= cu_out_sig(16);
    reg_op_ld_sig 	<=cu_out_sig(15);
    reg_op_oe_sig	<=cu_out_sig(14);
    alu_op_sig	<= cu_out_sig(13);
    alu_en_sig	<= cu_out_sig(12);
    pc_en_sig 	<= cu_out_sig(11);
    pc_ld_sig	<= cu_out_sig(10);
    pc_oe_sig 	<= cu_out_sig(9);
    mar_ld_sig 	<= cu_out_sig(8);
    mem_ld_sig	<= cu_out_sig(7);
    mem_oe_sig	<= cu_out_sig(6);
    reg_a_ld_sig<= cu_out_sig(5);
    reg_a_oe_sig<= cu_out_sig(4);
    reg_b_ld_sig<= cu_out_sig(3);
    reg_b_oe_sig<= cu_out_sig(2);
    inst_ld_sig	<= cu_out_sig(1);
    inst_oe_sig	<= cu_out_sig(0);

end behave;