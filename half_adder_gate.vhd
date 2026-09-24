LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Half_Adder IS
    PORT(
        A     : IN  std_logic;
        B     : IN  std_logic;
        SUM   : OUT std_logic;
        CARRY : OUT std_logic
    );
END Half_Adder;


ARCHITECTURE Structural OF Half_Adder IS

    -- XOR gate component
    COMPONENT XOR_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    -- AND gate component
    COMPONENT AND_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

BEGIN

    -- XOR gate for SUM
    XOR1: XOR_gate
    PORT MAP(
        A => A,
        B => B,
        Y => SUM
    );

    -- AND gate for CARRY
    AND1: AND_gate
    PORT MAP(
        A => A,
        B => B,
        Y => CARRY
    );

END Structural;LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Half_Adder IS
    PORT(
        A     : IN  std_logic;
        B     : IN  std_logic;
        SUM   : OUT std_logic;
        CARRY : OUT std_logic
    );
END Half_Adder;


ARCHITECTURE Structural OF Half_Adder IS

    -- XOR gate component
    COMPONENT XOR_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    -- AND gate component
    COMPONENT AND_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

BEGIN

    -- XOR gate for SUM
    XOR1: XOR_gate
    PORT MAP(
        A => A,
        B => B,
        Y => SUM
    );

    -- AND gate for CARRY
    AND1: AND_gate
    PORT MAP(
        A => A,
        B => B,
        Y => CARRY
    );

END Structural;