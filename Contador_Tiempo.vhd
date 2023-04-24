library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Contador_Tiempo is
    Port ( clk, reset, enable, load : in STD_LOGIC;
           count_out_D : out integer;
           count_out_U : out integer;
           alarma      : out std_logic
           );
end Contador_Tiempo;

architecture Behavioral of Contador_Tiempo is

    signal count_reg : integer range 0 to 35 := 35;
    signal count_reg_1 : integer range 0 to 63;
    signal evento : integer := 0;
    signal convert : std_logic_vector(1 downto 0);
    
begin

    process (clk, reset)

    constant data : integer :=  35;
    variable data_in : STD_LOGIC_VECTOR (5 downto 0);

    begin

        if evento = 0 then

            if reset = '0' then
                count_reg <= 35;
                
                elsif (rising_edge(clk)) then
                
                    if enable = '1' then
                
                        if load = '1' then
                
                            count_reg <= data;
                
                            if (count_reg = 0) then
                                count_reg <= data;
                                evento <= 1;
                
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
            
            count_out_D <= count_reg / 10;
            count_out_U <= count_reg mod 10;

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

            count_out_D <= count_reg_1 / 10;
            count_out_U <= count_reg_1 mod 10;
        end if;
    end process;
    
    convert <= std_logic_vector(to_unsigned(evento, 2));
    alarma <= convert(0);
end Behavioral;


