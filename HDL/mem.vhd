library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

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


function init(file_name:string) return mem_type is
        file file_data : text;
        variable fstatus : file_open_status;
        variable text_line : line;
        variable line_content : std_logic_vector (7 downto 0);
        variable i : integer :=0;
        variable mem_temp : mem_type;
    begin
            file_open(fstatus,file_data,file_name,READ_MODE);
            if fstatus=open_ok then
                while(i<16) loop
                    readLine(file_data,text_line);
                    read(text_line,line_content);
                    mem_temp(i):=line_content;
                    i:=i+1;
                end loop;
                file_close(file_data); 
                else
                    report "Failed to open file: " & file_name severity error;
                end if;
        return mem_temp;


end function init;
signal mem_obj : mem_type:=init("memory.txt");
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if ld='1' then
                    mem_obj(to_integer(unsigned(addr_in)))<=data_in;
                end if;
                if oe='1' then
                    data_out<=mem_obj(to_integer(unsigned(addr_in)));
                else
                    data_out<="ZZZZZZZZ";
                end if;
            end if;
        end process;
end behave;