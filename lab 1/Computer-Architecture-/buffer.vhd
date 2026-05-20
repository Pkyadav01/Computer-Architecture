-- Library declarations ( always required for std_logic )
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
-- Entity : one input , one output
entity MY_BUFFER is
port (
A : in std_logic ;
Y : out std_logic
) ;
end entity MY_BUFFER ;
-- Architecture : output simply follows input
architecture Dataflow of MY_BUFFER is
begin
Y <= A ;
end architecture Dataflow ;