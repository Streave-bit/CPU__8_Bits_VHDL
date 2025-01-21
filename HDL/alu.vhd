library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port(
        en : in std_logic;
        op : in std_logic;
        reg_a_in : in std_logic_vector ( 7 downto 0);
        reg_b_in : in std_logic_vector ( 7 downto 0);
        carry_out : out std_logic;
        zero_flag : out std_logic;
        res_out : out std_logic_vector ( 7 downto 0)
    );
end entity;

architecture behave of alu is
    signal result : std_logic_vector ( 8 downto 0);
    begin
        process (op, reg_a_in, reg_b_in,en )
        begin
                if op='1' then
                    result <= std_logic_vector(resize(unsigned(reg_a_in), 9) + resize(unsigned(reg_b_in), 9));
                elsif op='0' then
                    result <= std_logic_vector(resize(unsigned(reg_a_in), 9) - resize(unsigned(reg_b_in), 9));
                end if;
        
        end process;
carry_out <= result(8) when en='1' else 'Z';
zero_flag <= '1' when result(7 downto 0) = "00000000" else '0';
res_out <= result(7 downto 0) when en='1' else (others =>'Z');
end behave;

