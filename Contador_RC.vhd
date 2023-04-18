library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Contador_RC is
    Port ( clk, reset, enable, load : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (5 downto 0);
           count_out : out STD_LOGIC_VECTOR (5 downto 0));
end Contador_RC;

architecture Behavioral of Contador_RC is

    signal count_reg : integer range 0 to 63;
    
begin

    process (clk, reset)
    begin
        if reset = '0' then
				count_reg <= 0;
				
        elsif (rising_edge(clk)) then
		  
              if enable = '1' then
				  
					if load = '1' then
						
						count_reg <= to_integer(unsigned(data_in));
						
						    if (count_reg = 63) then
							    count_reg <= 0;
								 
						    else
							    count_reg <= count_reg + 1;
                      end if;
						end if;
              end if;
				  
				   if enable = '1' then
				  
						if load = '0' then
						
							count_reg <= to_integer(unsigned(data_in));
						end if;
              end if;	
					
					if enable = '0' then
				  
						if load = '0' then
						
							count_reg <= to_integer(unsigned(data_in));
						end if;
              end if;
        end if;
    end process;

    count_out <= std_LOGIC_VECTOR(to_unsigned(count_reg, 6));

end Behavioral;
