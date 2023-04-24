library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity Parquero_Inteligente is
	port (
    	parqueadero : in std_logic_vector(7 downto 0);
		reloj 		: in std_logic;
		selector	: in std_logic;
		Display_D	: out std_logic_vector(6 downto 0);
		Display_U	: out std_logic_vector(6 downto 0);
		Numero		: out std_logic_vector(6 downto 0);
		Alarm		: out std_logic_vector(7 downto 0)
	);
end Parquero_Inteligente;

architecture arch of Parquero_Inteligente is

	signal rst 	: STD_LOGIC := '1';
	signal ld	: STD_LOGIC := '1';
	signal clock: STD_LOGIC;
	signal clock_2: STD_LOGIC;
	signal contador_int : integer range 1 to 9 := 1;
	signal opcion : integer range 1 to 8;

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

	signal unidades : integer range 0 to 9;
	signal decenas : integer range 0 to 6;



	component Contador_Tiempo
		Port ( clk, reset, enable, load : in STD_LOGIC;
			count_out_D : out integer;
			count_out_U : out integer;
			alarma      : out std_logic);
	end component;

	component freq_divider
		PORT (  clk : IN STD_LOGIC;
				out1, out2 : BUFFER STD_LOGIC);
	end component;

begin

	--Divisor de frecuencia a 1 segundo
	Relog_1_segundo: freq_divider port map (clk => reloj, out1 => clock, out2 =>clock_2);

	--Vehiculo 1
	
	P1 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(0), load => ld, count_out_D => S1_D,count_out_U => S1_U, alarma => Alarm(0));
	
	--Vehiculo 2
	
	P2 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(1), load => ld, count_out_D => S2_D,count_out_U => S2_U, alarma => Alarm(1));
	
	--Vehiculo 3
	
	P3 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(2), load => ld, count_out_D => S3_D,count_out_U => S3_U, alarma => Alarm(2));
	
	--Vehiculo 4
	
	P4 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(3), load => ld, count_out_D => S4_D,count_out_U => S4_U, alarma => Alarm(3));
	
	--Vehiculo 5
	
	P5 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(4), load => ld, count_out_D => S5_D,count_out_U => S5_U, alarma => Alarm(4));
	
	--Vehiculo 6
	
	P6 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(5), load => ld, count_out_D => S6_D,count_out_U => S6_U, alarma => Alarm(5));
	
	--Vehiculo 7
	
	P7 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(6), load => ld, count_out_D => S7_D,count_out_U => S7_U, alarma => Alarm(6));
	
	--Vehiculo 8
	
	P8 : Contador_Tiempo port map (clk => clock, reset => rst, enable => parqueadero(7), load => ld, count_out_D => S8_D,count_out_U => S8_U, alarma => Alarm(7));


	--Contador del selector
	process(selector)

    begin
        if rising_edge(selector) then
            if contador_int < 8 then
                contador_int <= 1;
            else
                contador_int <= contador_int + 1;
            end if;
        end if;
        opcion <= contador_int;
    end process;


	--multiplexor
	with opcion select
		unidades <= S1_U when 1,
					S2_U when 2,
					S3_U when 3,
					S4_U when 4,
					S5_U when 5,
					S6_U when 6,
					S7_U when 7,
					S8_U when 8;

	with opcion select
		decenas <= 	S1_D when 1,
					S2_D when 2,
					S3_D when 3,
					S4_D when 4,
					S5_D when 5,
					S6_D when 6,
					S7_D when 7,
					S8_D when 8;

	
					
	--Decodificador
	process (unidades) begin
		case unidades is 
			when 0 =>Display_U<= "0000001";
			when 1 =>Display_U<= "1001111";
			when 2 =>Display_U<= "0010010";
			when 3 =>Display_U<= "0000110";
			when 4 =>Display_U<= "1001100";
			when 5 =>Display_U<= "0100100";
			when 6 =>Display_U<= "0100000";
			when 7 =>Display_U<= "0001111";
			when 8 =>Display_U<= "0000000";
			when 9 =>Display_U<= "0000100";
			when others  =>Display_U<= "1111111";
		end case;
	end process;
		
	process (decenas) begin
		case decenas is
			when 1 =>Display_D<= "1001111";
			when 2 =>Display_D<= "0010010";
			when 3 =>Display_D<= "0000110";
			when 4 =>Display_D<= "1001100";
			when 5 =>Display_D<= "0100100";
			when 6 =>Display_D<= "0100000";
			when others  =>Display_D<= "1111111";
		end case;
	end process;

	process (opcion) begin
		case opcion is 
			when 1 =>Numero<= "1001111";
			when 2 =>Numero<= "0010010";
			when 3 =>Numero<= "0000110";
			when 4 =>Numero<= "1001100";
			when 5 =>Numero<= "0100100";
			when 6 =>Numero<= "0100000";
			when 7 =>Numero<= "0001111";
			when 8 =>Numero<= "0000000";
			when others  =>Numero<= "1111111";
		end case;
	end process;


end architecture ;