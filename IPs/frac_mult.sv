`include "cla_adder.sv"
`include "shift_expander.sv"

module fractionned_multiplier (
    input wire [31:0] input_a,
    input wire [31:0] input_b,

    input wire signed_a,
    input wire signed_b,

    input wire enable,
    input wire clock,

    output wire [31:0] output_lower,
    output wire [31:0] output_higher,

    output logic output_valid
);

    logic [4:0] index = 8'b0;

    logic [63:0] accumulator =  64'b0;
    logic [31:0] temp =         32'b0;
    wire [63:0] extended_temp;

    assign output_lower = accumulator[31:0];
    assign output_higher = accumulator[64:0];

    shift_expander expander (
        temp,
        index,
        extended_temp
    );

    wire [64:0] adder_output;
    wire adder_carry;

    logic cst1 = 0;
    wire void_wire;

    carry_lookahead_adder adder_lower (
        accumulator[31:0],
        extended_temp[31:0],
        cst1,

        adder_output[31:0],
        adder_carry
    );

    carry_lookahead_adder adder_higher (
        accumulator[63:32],
        extended_temp[63:32],
        adder_carry,

        adder_output[63:32],
        void_wire
    );

    always @(posedge (clock & ~enable)) begin
        index = 0;
    end

    always @(posedge (clock & enable)) begin
        accumulator = adder_output;
        temp = {32{input_a[index]}} & input_b;
        index = index + 1; // Replace by custom adder ?
    end

endmodule