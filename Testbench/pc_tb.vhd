library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_tb is 
    
end entity;



architecture behave of pc_tb is
    component pc is 
port(
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        ld : in std_logic;
        inputs : in std_logic_vector(3 downto 0);
        outputs : out std_logic_vector (3 downto 0)
    );
end component;

    signal clk_sig : std_logic;
    signal rst_sig : std_logic;
    signal en_sig : std_logic;
    signal ld_sig : std_logic;
    signal inputs_sig : std_logic_vector (3 downto 0);
    signal outputs_sig : std_logic_vector (3 downto 0);
    constant clk_period : time := 10 ns;

    begin
        pc1 : pc port map (clk =>clk_sig, rst=>rst_sig, en => en_sig, ld => ld_sig, inputs => inputs_sig, outputs =>outputs_sig);
        process
            begin
                clk_sig<='0';
                wait for clk_period/2;
                clk_sig<=not clk_sig;
                wait for clk_period/2;
        end process;
        process
            begin
                rst_sig <= '0';
                en_sig <= '0';
                ld_sig <= '0';
                wait for clk_period*5;
                en_sig <= '1';
                wait for clk_period*5;
                en_sig <= '0';
                rst_sig <= '1';
                wait for clk_period;
                en_sig <= '1';
                rst_sig <= '0';
                wait for clk_period;
                en_sig <= '0';
                inputs_sig <= "0101";
                ld_sig <= '1';
                wait for clk_period;
                ld_sig<='0';
                wait for clk_period*2;
                inputs_sig <= "1010";
                ld_sig <= '1';
                wait for clk_period;
                ld_sig<='0';
                wait;
        end process;



end behave;
