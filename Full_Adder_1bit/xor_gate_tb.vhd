LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY xor_gate_tb IS
END xor_gate_tb;

ARCHITECTURE behavior OF xor_gate_tb IS

    -- Component Declaration
    COMPONENT XOR_gate
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

    -- Instantiate XOR gate
    uut: XOR_gate PORT MAP(
        A => A,
        B => B,
        Y => Y
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: 0 XOR 0
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- Test 2: 0 XOR 1
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test 3: 1 XOR 0
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test 4: 1 XOR 1
        A <= '1';
        B <= '1';
        wait for 100 ns;

        -- Stop simulation
        wait;

    end process;

END behavior;