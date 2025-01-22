library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cu_tb is 
    
end entity;

architecture behave of cu_tb is
    component cu is
        port(
            clk: in std_logic;
            rst:in std_logic;
            inst:in std_logic_vector(3 downto 0);
            do: out std_logic_vector(16 downto 0)
         );
    end component;
    signal clk_sig :  std_logic:='0';
    signal rst_sig :  std_logic;
    signal pc_out_sig :  std_logic;
    signal mar_in_sig :  std_logic;
    signal inst_sig: std_logic_vector(3 downto 0):="0000";
    signal do_sig: std_logic_vector(16 downto 0);
    constant clk_period : time := 10 ns;
    begin
        cu1 : cu port map (clk=>clk_sig, rst =>rst_sig,inst=>inst_sig,do=>do_sig);
        process
        begin
         clk_sig<='0';
         wait for clk_period/2;
         clk_sig<=not clk_sig;
         wait for clk_period/2;
     end process;
     mar_in_sig<=do_sig(9);
     pc_out_sig<=do_sig(8);
     process
        begin
         rst_sig<='1';
         wait for clk_period*5;
         rst_sig<='0';
         wait;
     end process;
end behave;