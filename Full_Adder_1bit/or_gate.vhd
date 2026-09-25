LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY OR_gate IS
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
END OR_gate;


ARCHITECTURE Structural OF OR_gate IS

    -- Component declaration
    COMPONENT NAND_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    -- Intermediate signals
    signal A_not : std_logic;
    signal B_not : std_logic;

BEGIN

    -- NAND Gate 1: A NAND A = NOT A
    NAND1: NAND_gate
    PORT MAP(
        A => A,
        B => A,
        Y => A_not
    );

    -- NAND Gate 2: B NAND B = NOT B
    NAND2: NAND_gate
    PORT MAP(
        A => B,
        B => B,
        Y => B_not
    );

    -- NAND Gate 3: NOT A NAND NOT B = A OR B
    NAND3: NAND_gate
    PORT MAP(
        A => A_not,
        B => B_not,
        Y => Y
    );

END Structural;