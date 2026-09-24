LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NOR_gate IS
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
END NOR_gate;

ARCHITECTURE Structural OF NOR_gate IS

    -- NAND gate component
    COMPONENT NAND_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    -- Intermediate signals
    signal N1 : std_logic;
    signal N2 : std_logic;
    signal N3 : std_logic;
    signal OR_out : std_logic;

BEGIN

    -- NAND1: A NAND A = NOT A
    NAND1: NAND_gate
    PORT MAP(
        A => A,
        B => A,
        Y => N1
    );

    -- NAND2: B NAND B = NOT B
    NAND2: NAND_gate
    PORT MAP(
        A => B,
        B => B,
        Y => N2
    );

    -- NAND3: NOT A NAND NOT B = A OR B
    NAND3: NAND_gate
    PORT MAP(
        A => N1,
        B => N2,
        Y => OR_out
    );

    -- NAND4: OR_out NAND OR_out = NOT OR_out
    NAND4: NAND_gate
    PORT MAP(
        A => OR_out,
        B => OR_out,
        Y => Y
    );

END Structural;