`include "frac_mult.sv"

module mdu (
    input wire [31:0] input_a,
    input wire [31:0] input_b,

    input wire [3:0] opcode,

    output wire [31:0] output_c,
);

fractionned_multiplier multiplier ();
    
endmodule