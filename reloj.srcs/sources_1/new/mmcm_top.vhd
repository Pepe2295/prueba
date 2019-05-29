library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity mmcm_top is

    Generic ( 
        -- reloj a 50Mhz: 50000000 ciclos en un segundo.
        N : NATURAL := 50000000
    );
    
    Port ( CLK : in STD_LOGIC;
        AN : out STD_LOGIC_VECTOR (3 downto 0);
        LED : out STD_LOGIC_VECTOR (15 downto 0));
end mmcm_top;

architecture Behavioral of mmcm_top is    
    -- contador de 1hz
    signal clk_1hz : NATURAL;
    
    -- señal de habilitación para contador binario
    signal cont_ena : STD_LOGIC;
    
    -- señales para el MMCM
    signal reset_in: STD_LOGIC;
    signal MCLK: STD_LOGIC;
    signal locked: STD_LOGIC;
    
    -- señal de reset global
    signal mrst: STD_LOGIC;
    
    -- registro binario 8 bits para contador
    signal reg_bin: UNSIGNED (7 downto 0);
    
    alias leds_contador is LED (7 downto 0); 
     
begin

    -- apagamos displays de 7 seg. (no lo usaremos)
    AN <= "1111";
    
    -- mostrar contador en los leds
    leds_contador <= std_logic_vector(reg_bin);
    
    -- Control reset global del sistema.
    -- La señal locked se pone a 1 cuando el reloj es estable.
    -- Es entonces cuando lo podemos usar.
    -- Por eso aquí lo usamos como reset global del sistema.
    mrst <= not locked;
    
    -- reset del reloj mmcm no activo
    reset_in <= '0'; 
    
    -- Módulo MMCM (Core IP)
    MMCM_clk: entity WORK.clk_wiz_0 port map ( 
        clk_in1     => CLK,
        reset       => reset_in,
        clk_out1    => MCLK,
        locked      => locked );
        
  
    -- contador 1Hz
    process(MCLK)
    begin
        if (MCLK'event and MCLK='1') then
            if clk_1hz < N then 
                clk_1hz <= clk_1hz + 1;
            else
                clk_1hz <= 0;
            end if;
        end if;
    end process;
    
    -- señal de fin de cuenta 1Hz. Pulso para contador binario,
    cont_ena <= '1' when clk_1hz=N else '0';
    
    -- contador binario (sincrono)
    process(MCLK)
    begin
        if (MCLK'event and MCLK='1') then
            if (mrst = '1') then
                -- reset síncrono. 
                -- msrt se pone a 0 cuando el reloj es estable.
                reg_bin <= (others => '0');
             elsif (cont_ena = '1') then
                reg_bin <= reg_bin + 1;
            end if;
        end if;    
    end process;
                     
end Behavioral;