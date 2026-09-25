LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY XOR_gate IS
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
END XOR_gate;

ARCHITECTURE Structural OF XOR_gate IS

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

BEGIN

    -- NAND1: A NAND B
    NAND1: NAND_gate
    PORT MAP(
        A => A,
        B => B,
        Y => N1
    );

    -- NAND2: A NAND N1
    NAND2: NAND_gate
    PORT MAP(
        A => A,
        B => N1,
        Y => N2
    );

    -- NAND3: B NAND N1
    NAND3: NAND_gate
    PORT MAP(
        A => B,
        B => N1,
        Y => N3
    );

    -- NAND4: N2 NAND N3
    NAND4: NAND_gate
    PORT MAP(
        A => N2,
        B => N3,
        Y => Y
    );

END Structural;