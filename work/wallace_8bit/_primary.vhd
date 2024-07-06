library verilog;
use verilog.vl_types.all;
entity wallace_8bit is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        Mul             : out    vl_logic_vector(15 downto 0)
    );
end wallace_8bit;
