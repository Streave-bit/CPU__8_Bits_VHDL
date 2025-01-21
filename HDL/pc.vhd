library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is 
    port(
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        oe : in std_logic;
        ld : in std_logic;
        inputs : in std_logic_vector(3 downto 0);
        outputs : out std_logic_vector (3 downto 0)
    );
end entity;

architecture behave of pc is
    signal count : unsigned(3 downto 0) := "0000";
    begin
    process(clk,rst)
        begin
        if rst ='1' then
            count <=(others=>'0');
        elsif
            rising_edge(clk) then
                if ld='1'  then
                    count <= unsigned(inputs); 
                elsif en='1' then
                    count <= count + 1;
                end if;
        end if;
    end process;
    outputs <= std_logic_vector(count) when oe ='1' else "ZZZZ";
end behave;