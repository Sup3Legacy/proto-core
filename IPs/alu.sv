`include "./cla_adder.sv"

module ALU (
    input [31:0]  input_a,
    input [31:0]  input_b,
    input [3:0]   opcode,

    output [31:0] res
);
    /*
        opcodes :
            - 4'b0000 : nop
            - 4'b0010 : inc
            - 4'b0011 : dec
            - 4'b0100 : add
            - 4'b0101 : sub
            - 4'b1000 : or
            - 4'b1001 : and
            - 4'b1010 : xor
            - 4'b1011 : not
    */


    wire [31:0] or_sig;
    wire [31:0] and_sig;
    wire [31:0] xor_sig;
    wire [31:0] not_sig;

    assign or_sig  = input_a | input_b;
    assign and_sig = input_a & input_b;
    assign xor_sig = input_a ^ input_b;
    assign not_sig = ~input_a;

    wire [31:0] corrected_b;
    wire carry_in;

    assign corrected_b =    (opcode == 4'b0101) ? ~input_b : 
                            (opcode == 4'b0010) ? 32'b1 :
                            (opcode == 4'b0011) ? ~(32'b1) :
                            input_b;

    assign carry_in =   ((opcode == 4'b0101) | (opcode == 4'b0011)) ? 32'b1 :
                        32'b0;

    wire [31:0] adder_output;
    // Output carry from adder
    wire carry_out; 

    carry_lookahead_adder adder (
        input_a,
        corrected_b,
        carry_in,

        adder_output,
        carry_out
    );

    assign res =    ((opcode & 4'b1000) == 0) ? adder_output :
                    (opcode == 4'b1000) ? or_sig :
                    (opcode == 4'b1001) ? and_sig :
                    (opcode == 4'b1010) ? xor_sig :
                    (opcode == 4'b1011) ? not_sig : 32'b0;
    
endmodule