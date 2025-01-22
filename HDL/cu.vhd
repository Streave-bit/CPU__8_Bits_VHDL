library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cu is 
port(
    clk: in std_logic;
    rst:in std_logic;
    inst:in std_logic_vector(3 downto 0);
    do: out std_logic_vector(16 downto 0)
);
end entity;

architecture behave of cu is
signal count : unsigned(3 downto 0) := "0000";
    begin
        count_proc:process(clk,rst)
        begin
            if rst='1' then
                count<="0000";
            elsif rising_edge(clk) then
                if count="1010" then
                    count<="0000";
                else
                    count<=count+1;
                end if;
            end if;
        end process;

        --coding of the do
        --HLT--OUT_IN--OUT_OUT--ALU_OP_EN--ALU_EN--PC_EN--PC_IN--PC_OUT-MAR_IN--RAM_IN--RAM_OUT--A_IN--A_OUT--B_IN--B_OUT--INST_I--INST_OUT
        --16 --15 -----14--------13--------12------11------10-----9-----8---------7-------6-------5-----4------3------2------1--------0
        do <= "00000001100000000" when count = "0000" else --load memory
      "00000100001000010" when count = "0001" else --increment pc 
      
      
      --LDA
      "00000000000000001" when (count = "0010" and inst="0000") else --inst out from ir to mar
      "00000000100000001" when (count = "0011" and inst="0000") else --mar_in to mem
      "00000000001100000" when (count = "0100" and inst="0000") else --from mem to reg A
      "00000000000000000" when (count = "0101" and inst="0000") else --nothing here
      "00000000000000000" when (count = "0110" and inst="0000") else --nothing here
      
      "00000000000000001" when (count= "0010" and inst="0001") else	--INST_REG-> main_bus
      "00000000100000001" when (count= "0011" and inst="0001") else
      "00000000010010000" when (count= "0100" and inst="0001") else    
      "00000000000000000" when (count= "0101" and inst="0001") else    
      "00000000000000000" when (count= "0110" and inst="0001") else
       
      --ADD
      "00000000000000001" when (count= "0010" and inst="0010") else    
      "00000000100000001" when (count= "0011" and inst="0010") else
      "00000000001001000" when (count= "0100" and inst="0010") else    
      "00001000000000000" when (count= "0101" and inst="0010") else    
      "00001000000100000" when (count= "0110" and inst="0010") else
       
      --SUB
      "00000000000000001" when (count= "0010" and inst="0011") else    
      "00000000100000001" when (count= "0011" and inst="0011") else
      "00000000001001000" when (count= "0100" and inst="0011") else    
      "00010000000000000" when (count= "0101" and inst="0011") else    
      "00011000000100000" when (count= "0110" and inst="0011") else
       
      --JMP
      "00000000000000001" when (count= "0010" and inst="0100") else    
      "00000010000000001" when (count= "0011" and inst="0100") else
      "00000000000000000" when (count= "0100" and inst="0100") else    
      "00000000000000000" when (count= "0101" and inst="0100") else    
      "00000000000000000" when (count= "0110" and inst="0100") else
      
      --OUT
      "00000000000000001" when (count= "0010" and inst="0101") else    
      "00000000100000001" when (count= "0011" and inst="0101") else
      "00000000001000000" when (count= "0100" and inst="0101") else
      "01000000001000000" when (count= "0101" and inst="0101") else
      "00100000000000000" when (count= "0110" and inst="0101") else
      
      --HLT
      "10000000000000000" when (count= "0010" and inst="0110") else    
      "10000010000000000" when (count= "0011" and inst="0110") else
      "00000000000000000" when (count= "0100" and inst="0110") else    
      "00000000000000000" when (count= "0101" and inst="0110") else    
      "00000000000000000" when (count= "0110" and inst="0110") ;
end behave;