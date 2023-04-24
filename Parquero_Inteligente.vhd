library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Parquero_Inteligente is
  port (
    parqueadero : in std_logic_vector(7 downto 0);
	clock 		: in std_logic;
	Display_D	: std_logic_vector(6 downto 0);
	Display_U	: std_logic_vector(6 downto 0);
	Numero		: std_logic_vector(6 downto 0)
	) ;
end Parquero_Inteligente ; 

architecture arch of Parquero_Inteligente is

	signal rst : STD_LOGIC <= '1';
	signal ld : STD_LOGIC <= '1';

	signal S1_D : integer;
	signal S2_D : integer;
	signal S3_D : integer;
	signal S4_D : integer;
	signal S5_D : integer;
	signal S6_D : integer;
	signal S7_D : integer;
	signal S8_D : integer;

	signal S1_U : integer;
	signal S2_U : integer;
	signal S3_U : integer;
	signal S4_U : integer;
	signal S5_U : integer;
	signal S6_U : integer;
	signal S7_U : integer;
	signal S8_U : integer;


	component Contador_Tiempo
		Port ( clk, reset, enable, load : in STD_LOGIC;
			count_out_D : out integer;
			count_out_U : out integer);
	end component;

begin

	--Vehiculo 1
	process(parqueadero(0))
		P1 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(0), load => ld, count_out_D => S1_D,count_out_U => S1_U)
	end process;
	
	--Vehiculo 2
	process(parqueadero(1))
		P2 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(1), load => ld, count_out_D => S2_D,count_out_U => S2_U)
	end process;
	
	--Vehiculo 3
	process(parqueadero(2))
		P3 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(2), load => ld, count_out_D => S3_D,count_out_U => S3_U)
	end process;
	
	--Vehiculo 4
	process(parqueadero(3))
		P4 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(3), load => ld, count_out_D => S4_D,count_out_U => S4_U)
	end process;
	
	--Vehiculo 5
	process(parqueadero(4))
		P5 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(4), load => ld, count_out_D => S5_D,count_out_U => S5_U)
	end process;
	
	--Vehiculo 6
	process(parqueadero(5))
		P6 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(5), load => ld, count_out_D => S6_D,count_out_U => S6_U)
	end process;
	
	--Vehiculo 7
	process(parqueadero(6))
		P7 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(6), load => ld, count_out_D => S7_D,count_out_U => S7_U)
	end process;
	
	--Vehiculo 8
	process(parqueadero(7))
		P8 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(7), load => ld, count_out_D => S8_D,count_out_U => S8_U)
	end process;



end architecture ;