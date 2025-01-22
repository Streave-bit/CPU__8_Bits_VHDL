library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpu_tb is
    
end entity;

architecture behave of cpu_tb is
    component cpu is 
    port(
        clk: in std_logic;
        rst:in std_logic;
        op: out std_logic_vector(7 downto 0)
    );
    end component;
    constant clk_period : time := 50 ns;
    signal clk_sig : std_logic;
    signal nclk_sig : std_logic;
    signal rst_sig : std_logic;
    signal op_cpu_sig : std_logic_vector(7 downto 0);

    begin
        cpu1 : cpu port map (clk=>clk_sig,rst=>rst_sig, op=> op_cpu_sig);
        process
        begin
         clk_sig<='0';
         wait for clk_period/2;
         clk_sig<=not clk_sig;
         wait for clk_period/2;
     end process;
     nclk_sig <= not clk_sig;
     process

begin

wait for clk_period*14;
rst_sig<='1' ;
wait for clk_period*10;
rst_sig<='0'; 
wait;

end process;
end behave;