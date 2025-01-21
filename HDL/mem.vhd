library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem is
    port(
        clk :in std_logic;
        ld :in std_logic;
        oe :in std_logic;
        addr_in :in std_logic_vector(3 downto 0);
        data_in :in std_logic_vector(7 downto 0);
        data_out :out std_logic_vector(7 downto 0)
    );
end entity;

architecture behave of mem is
type mem_type is array (0 to 15) of std_logic_vector(7 downto 0);
signal mem_obj : mem_type;
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if ld='1' then
                    mem_obj(to_integer(unsigned(addr_in)))<=data_in;
                end if;
                if oe='1' then
                    data_out<=mem_obj(to_integer(unsigned(addr_in)));
                end if;
            end if;
        end process;
end behave;