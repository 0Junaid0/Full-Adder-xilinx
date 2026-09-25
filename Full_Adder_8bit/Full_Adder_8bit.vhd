LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Full_Adder_8bit IS
    PORT(
        A    : IN  std_logic_vector(7 downto 0);
        B    : IN  std_logic_vector(7 downto 0);
        Cin  : IN  std_logic;
        Sum  : OUT std_logic_vector(7 downto 0);
        Cout : OUT std_logic
    );
END Full_Adder_8bit;

ARCHITECTURE Structural OF Full_Adder_8bit IS

    COMPONENT Full_Adder_4bit
    PORT(
        A    : IN  std_logic_vector(3 downto 0);
        B    : IN  std_logic_vector(3 downto 0);
        Cin  : IN  std_logic;
        Sum  : OUT std_logic_vector(3 downto 0);
        Cout : OUT std_logic
    );
    END COMPONENT;

    signal C4 : std_logic;

BEGIN

    -- Lower 4 bits
    FA4_LOW: Full_Adder_4bit
    PORT MAP(
        A    => A(3 downto 0),
        B    => B(3 downto 0),
        Cin  => Cin,
        Sum  => Sum(3 downto 0),
        Cout => C4
    );

    -- Upper 4 bits
    FA4_HIGH: Full_Adder_4bit
    PORT MAP(
        A    => A(7 downto 4),
        B    => B(7 downto 4),
        Cin  => C4,
        Sum  => Sum(7 downto 4),
        Cout => Cout
    );

END Structural;