LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Half_Adder_tb IS
END Half_Adder_tb;

ARCHITECTURE behavior OF Half_Adder_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Half_Adder
    PORT(
        A     : IN  std_logic;
        B     : IN  std_logic;
        SUM   : OUT std_logic;
        CARRY : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Outputs
    signal SUM   : std_logic;
    signal CARRY : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Half_Adder PORT MAP(
        A     => A,
        B     => B,
        SUM   => SUM,
        CARRY => CARRY
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: 0 + 0
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- Test 2: 0 + 1
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test 3: 1 + 0
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test 4: 1 + 1
        A <= '1';
        B <= '1';
        wait for 100 ns;

        -- Stop simulation
        wait;

    end process;

END behavior;