library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Parquero_Inteligente is
  port (
    parqueadero : in std_logic_vector(7 downto 0);
	clock : in std_logic;

	) ;
end Parquero_Inteligente ; 

architecture arch of Parquero_Inteligente is

	signal rst : integer := 1;
	signal ld : integer := 1;




	component Contador_Tiempo
		Port ( clk, reset, enable, load : in STD_LOGIC;
        		count_out : out STD_LOGIC_VECTOR (5 downto 0));
	end component;

begin

	--Vehiculo 1
	process(parqueadero(0))
		P1 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(0), load => ld, count_out =>)
	end process;
	
	--Vehiculo 2
	process(parqueadero(1))
		P2 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(1), load => ld, count_out =>)
	end process;
	
	--Vehiculo 3
	process(parqueadero(2))
	P2 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(2), load => ld, count_out =>)
	end process;
	
	--Vehiculo 4
	process(parqueadero(3))
	P4 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(3), load => ld, count_out =>)
	end process;
	
	--Vehiculo 5
	process(parqueadero(4))
	P5 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(4), load => ld, count_out =>)
	end process;
	
	--Vehiculo 6
	process(parqueadero(5))
	P6 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(5), load => ld, count_out =>)
	end process;
	
	--Vehiculo 7
	process(parqueadero(6))
	P7 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(6), load => ld, count_out =>)
	end process;
	
	--Vehiculo 8
	process(parqueadero(7))
	P8 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(7), load => ld, count_out =>)
	end process;
end architecture ;