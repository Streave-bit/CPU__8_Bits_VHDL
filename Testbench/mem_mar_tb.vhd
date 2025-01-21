library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_mar_tb is 
    
end entity;

architecture behave of mem_mar_tb is
    component mar is
        port (
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

    signal clk_sig :  std_logic;
    signal rst_sig :  std_logic;
    signal ld_sig :  std_logic;
    signal inputs_sig : std_logic_vector (3 downto 0);
    signal outputs_sig : std_logic_vector (3 downto 0); 


    signal oe_sig_mem :  std_logic;
    signal ld_sig_mem :  std_logic;
    signal addr_in_sig_mem : std_logic_vector (3 downto 0);
    signal data_out_sig_mem : std_logic_vector (7 downto 0); 
    signal data_in_sig_mem : std_logic_vector (7 downto 0); 

    constant clk_period : time := 10 ns;
begin
    mar1 : mar port map (clk=>clk_sig, rst =>rst_sig, ld=> ld_sig, inputs=> inputs_sig, outputs=>outputs_sig); 
    mem1 : mem port map (clk=>clk_sig,ld=>ld_sig_mem,oe=>oe_sig_mem,addr_in=>addr_in_sig_mem, data_in=>data_in_sig_mem,data_out=>data_out_sig_mem);   
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
        inputs_sig <="0001";
        ld_sig<='1';
        wait for clk_period*5;
        ld_sig<='0';
        data_in_sig_mem<="11111111";
        ld_sig_mem<='1';
        wait for clk_period;
        ld_sig_mem<='0';
        wait for clk_period;
        oe_sig_mem<='1';
        wait for clk_period;
        wait;




    end process;
    

end behave;