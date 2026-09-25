LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nor_gate_tb IS
END nor_gate_tb;

ARCHITECTURE behavior OF nor_gate_tb IS

    -- Component Declaration
    COMPONENT NOR_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Output
    signal Y : std_logic;

BEGIN

    -- Instantiate NOR gate
    uut: NOR_gate PORT MAP(
        A => A,
        B => B,
        Y => Y
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: 0 NOR 0
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- Test 2: 0 NOR 1
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test 3: 1 NOR 0
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test 4: 1 NOR 1
        A <= '1';
        B <= '1';
        wait for 100 ns;

        -- Stop simulation
        wait;

    end process;

END behavior;