LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Full_Adder_8bit_tb IS
END Full_Adder_8bit_tb;

ARCHITECTURE behavior OF Full_Adder_8bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Full_Adder_8bit
    PORT(
        A    : IN  std_logic_vector(7 downto 0);
        B    : IN  std_logic_vector(7 downto 0);
        Cin  : IN  std_logic;
        Sum  : OUT std_logic_vector(7 downto 0);
        Cout : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal A   : std_logic_vector(7 downto 0) := "00000000";
    signal B   : std_logic_vector(7 downto 0) := "00000000";
    signal Cin : std_logic := '0';

    -- Outputs
    signal Sum  : std_logic_vector(7 downto 0);
    signal Cout : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Full_Adder_8bit PORT MAP (
        A    => A,
        B    => B,
        Cin  => Cin,
        Sum  => Sum,
        Cout => Cout
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1: 0 + 0 + 0 = 0
        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        wait for 100 ns;

        -- Test 2: 1 + 1 + 0 = 2
        A <= "00000001";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Test 3: 5 + 3 + 0 = 8
        A <= "00000101";
        B <= "00000011";
        Cin <= '0';
        wait for 100 ns;

        -- Test 4: 15 + 10 + 0 = 25
        A <= "00001111";
        B <= "00001010";
        Cin <= '0';
        wait for 100 ns;

        -- Test 5: 100 + 50 + 0 = 150
        A <= "01100100";
        B <= "00110010";
        Cin <= '0';
        wait for 100 ns;

        -- Test 6: 100 + 50 + 1 = 151
        A <= "01100100";
        B <= "00110010";
        Cin <= '1';
        wait for 100 ns;

        -- Test 7: 255 + 1 = 256
        -- Expected Sum = 00000000
        -- Expected Cout = 1
        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Test 8: 255 + 255 + 1 = 511
        -- Expected Sum = 11111111
        -- Expected Cout = 1
        A <= "11111111";
        B <= "11111111";
        Cin <= '1';
        wait for 100 ns;

        -- Stop simulation
        wait;

    end process;

END behavior;