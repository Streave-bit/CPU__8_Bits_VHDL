library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mar is
    port(
        clk : in std_logic;
        rst : in std_logic;
        ld : in std_logic;
        inputs : in std_logic_vector (3 downto 0);
        outputs : out std_logic_vector (3 downto 0)
    );
end entity;

architecture behave of mar is
signal stored_value : std_logic_vector (3 downto 0):=(others => 'Z');
begin
    process(clk,rst)
    begin
        if rst ='1' then
            stored_value <=(others=>'Z');
        elsif rising_edge(clk) then
            if ld='1' then
                stored_value<=inputs;
            end if;
        end if;

    end process;
outputs <= stored_value;

end behave;