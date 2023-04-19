library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Contador_Tiempo is
    Port ( clk, reset, enable, load : in STD_LOGIC;
           count_out : out STD_LOGIC_VECTOR (5 downto 0));
end Contador_Tiempo;

architecture Behavioral of Contador_Tiempo is

    signal count_reg : integer range 0 to 35;
    signal count_reg_1 : integer range 0 to 63;
    signal evento : integer := 0;
    
begin

    process (clk, reset)

    constant data : integer :=  35;
    variable data_in : STD_LOGIC_VECTOR (5 downto 0);

    begin

        if evento = 0 then

            if reset = '0' then
                count_reg <= 0;
                
                elsif (rising_edge(clk)) then
                
                    if enable = '1' then
                
                        if load = '1' then
                
                            count_reg <= data;
                
                            if (count_reg = 0) then
                                count_reg <= data;
                
                            else
                                count_reg <= count_reg - 1;
                            end if;
                        end if;
                    end if;
                
                if enable = '1' then
                
                    if load = '0' then
                
                        count_reg <= data;
                    end if;
                end if;
                
                if enable = '0' then
                
                    if load = '0' then
                
                    count_reg <= data;
                    end if;
                end if;
            end if;
            count_out <= std_LOGIC_VECTOR(to_unsigned(count_reg, 6));
        end if;
        
        if evento = 1 then
            if reset = '0' then
                count_reg_1 <= 0;
                    
                elsif (rising_edge(clk)) then
                
                    if enable = '1' then
                        
                            if load = '1' then
                                
                                count_reg_1 <= to_integer(unsigned(data_in));
                                
                                    if (count_reg_1 = 63) then
                                        count_reg_1 <= 0;
                                        else
                                            count_reg_1 <= count_reg_1 + 1;
                                    end if;
                            end if;
                    end if;
                        
                    if enable = '1' then
                        
                        if load = '0' then
                                
                             count_reg_1 <= to_integer(unsigned(data_in));
                        end if;
                    end if;	
                            
                    if enable = '0' then
                        
                        if load = '0' then
                                
                             count_reg_1 <= to_integer(unsigned(data_in));
                        end if;
                    end if;
            end if;

            count_out <= std_LOGIC_VECTOR(to_unsigned(count_reg_1, 6));
        end if;
    end process;

end Behavioral;
