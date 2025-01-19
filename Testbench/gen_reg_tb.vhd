library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gen_reg_tb is 
    
end entity;

architecture behave of gen_reg_tb is
    component gen_reg is
        port (
        clk : in std_logic;
        rst : in std_logic;
        out_en : in std_logic;
        ld : in std_logic;
        inputs : in std_logic_vector (7 downto 0);
        outputs : out std_logic_vector (7 downto 0);
        outputs_alu : out std_logic_vector (7 downto 0)
        );
    end component;

    signal clk_sig :  std_logic;
    signal rst_sig :  std_logic;
    signal out_en_sig :  std_logic;
    signal ld_sig :  std_logic;
    signal inputs_sig : std_logic_vector (7 downto 0);
    signal outputs_sig : std_logic_vector (7 downto 0);
    signal outputs_alu_sig : std_logic_vector (7 downto 0);  
    constant clk_period : time := 10 ns;
begin
    reg1 : gen_reg port map (clk=>clk_sig, rst =>rst_sig, out_en=>out_en_sig, ld=> ld_sig, inputs=> inputs_sig, outputs=>outputs_sig,outputs_alu=> outputs_alu_sig); 
    
    process
        begin
        clk_sig<='0';
        wait for clk_period/2;
        clk_sig<=not clk_sig;
        wait for clk_period/2;
    end process;

    process
    begin
        rst_sig<='0';
        out_en_sig <='0';
        ld_sig <='0';
        wait for clk_period*5;
        inputs_sig <= "00100010";
        ld_sig<='1';
        wait for clk_period;
        ld_sig<='0';
        wait for clk_period;
        out_en_sig <='1';
        wait for clk_period;
        out_en_sig <='0';
        wait;




    end process;
    

end behave;