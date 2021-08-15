module shift_expander(
    input wire [31:0] input_a,
    input wire [4:0] shift_index,

    output wire [63:0] output_b
);

    wire [31:0] components[31:0];

    genvar j;

    generate
        for (j = 0; j < 32; j = j + 1)
        begin
            assign components[j] = (shift_index == j) ? {{(32 - j){1'b0}}, input_a, {(j){1'b0}}} : 64'b0;
        end
    endgenerate
    
endmodule