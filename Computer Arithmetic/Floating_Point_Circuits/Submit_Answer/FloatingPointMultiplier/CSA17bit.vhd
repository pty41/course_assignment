----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:31 11/30/2016 
-- Design Name: 
-- Module Name:    CarrySaveAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CSA17bit is
    Port ( a : in  STD_LOGIC_VECTOR (16 downto 0);
           b : in  STD_LOGIC_VECTOR (16 downto 0);
           c : in  STD_LOGIC_VECTOR (16 downto 0);
           d : in  STD_LOGIC_VECTOR (16 downto 0);
			  s : out  STD_LOGIC_VECTOR (16 downto 0);
           cout : out  STD_LOGIC_VECTOR (16 downto 0);
			  tout1 : out STD_LOGIC);  
end CSA17bit;

architecture Behavioral of CSA17bit is

component Counter4to2 is
	Port ( A : in  STD_LOGIC;
			 B : in  STD_LOGIC;
			 C : in  STD_LOGIC;
			 D : in  STD_LOGIC;
			 Tin : in  STD_LOGIC;
			 Tout : out  STD_LOGIC;
			 Co : out  STD_LOGIC;
			 S : out  STD_LOGIC);
end component;
	
SIGNAL   tout : STD_LOGIC_VECTOR (16 downto 0);

begin
	 sum_start : Counter4to2 port map(a(0), b(0), c(0), d(0), '0', tout(0), cout(0), s(0));
	 GEN_REG:
	 FOR i IN 1 TO 16 generate
			sum_loop : Counter4to2 port map(a(i), b(i), c(i), d(i), tout(i-1), tout(i), cout(i), s(i));
	 end generate GEN_REG;
	 
	 tout1 <= tout(16);
end Behavioral;
