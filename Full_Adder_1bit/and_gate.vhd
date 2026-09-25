LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY AND_gate IS
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
END AND_gate;

ARCHITECTURE Structural OF AND_gate IS

    -- NAND gate component
    COMPONENT NAND_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    -- Intermediate signal
    signal NAND_out : std_logic;

BEGIN

    -- First NAND gate
    NAND1: NAND_gate
    PORT MAP(
        A => A,
        B => B,
        Y => NAND_out
    );

    -- Second NAND gate
    NAND2: NAND_gate
    PORT MAP(
        A => NAND_out,
        B => NAND_out,
        Y => Y
    );

END Structural;