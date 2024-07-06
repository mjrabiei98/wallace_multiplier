library verilog;
use verilog.vl_types.all;
entity wallace_16bit is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        Mul             : out    vl_logic_vector(31 downto 0)
    );
end wallace_16bit;
