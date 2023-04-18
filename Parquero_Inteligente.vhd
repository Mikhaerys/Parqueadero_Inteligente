library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Parquero_Inteligente is
  port (
    parqueadero : in std_logic_vector(7 downto 0);
	) ;
end Parquero_Inteligente ; 

architecture arch of Parquero_Inteligente is

	component Contador_RC
	Port ( clk, reset, enable, load : in STD_LOGIC;
			data_in : in STD_LOGIC_VECTOR (5 downto 0);
			count_out : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
begin
	--Vehiculo 1
	process(parqueadero 0)

end architecture ;