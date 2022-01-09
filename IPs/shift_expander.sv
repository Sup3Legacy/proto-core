module shift_expander(
    input wire [31:0] input_a,
    input wire [7:0] shift_index,

    output wire [63:0] output_b
);

    wire [63:0] components[32:0];

    genvar j;

    generate
        assign components[0] = ((shift_index == 0) ? {{32{1'b0}}, input_a} : 64'b0);
        for (j = 1; j <= 32; j = j + 1)
        begin
            assign components[j] = ((shift_index == j) ? {{(32 - j){1'b0}}, input_a, {(j){1'b0}}} : 64'b0) | components[j - 1];
        end
    endgenerate

    assign output_b = components[32];
    
endmodule