module carry_lookahead_adder (
    input wire [31:0] input_a,
    input wire [31:0] input_b,
    input wire carry_in,

    output wire [31:0] output_c,
    output wire carry_out
);
    wire [8:0] carries;
    assign carries[0] = carry_in;
    assign carry_out = carries[8];

    genvar i;

    generate
        for (i = 0; i < 8; i = i + 1) begin
            cla_4_bits_module mod (
                carries[i],
                input_a[(i + 1) * 4 - 1:i * 4],
                input_b[(i + 1) * 4 - 1:i * 4],

                output_c[(i + 1) * 4 - 1:i * 4],
                carries[i + 1]
            );
        end
    endgenerate
endmodule

module cla_4_bits_module (
    input wire carry_in,
    input wire [3:0] input_a,
    input wire [3:0] input_b,

    output wire [3:0] output_c,
    output wire carry_out
);
    wire [3:0] ands;
    wire [3:0] xors;
    wire [4:0] carries;

    assign carries[0] = carry_in;
    assign carry_out = carries[4];

    genvar j;

    generate
        for(j = 0; j < 4; j = j+1)
        begin
            assign ands[j] = input_a[j] & input_b[j];
            assign xors[j] = input_a[j] ^ input_b[j];
            assign output_c[j] = xors[j] ^ carries[j];
        end
    endgenerate

    assign carries[1] = ands[0] | 
        (carries[0] & carries[1]);
    assign carries[2] = ands[1] | 
        (carries[1] & carries[2]) | 
        (carries[0] & carries[1] & carries[2]);
    assign carries[3] = ands[2] | 
        (carries[2] & carries[3]) | 
        (carries[1] & carries[2] & carries[3]) |
        (carries[0] & carries[1] & carries[2] & carries[3]);
    assign carries[4] = ands[3] | 
        (carries[3] & carries[4]) | 
        (carries[2] & carries[3] & carries[4]) |
        (carries[1] & carries[2] & carries[3] & carries[4]) | 
        (carries[0] & carries[1] & carries[2] & carries[3] & carries[4]);
endmodule