module divider (
    input wire [31:0] input_a,
    input wire [31:0] input_b,

    input wire signed_a,
    input wire signed_b,

    input wire clock,
    input wire enable,

    output wire [31:0] output_quotient,
    output wire [31:0] output_remainder,

    output logic data_valid
);
    logic [31:0] quotient;
    logic [31:0] remainder;

    // May want to only output when data is valid
    assign output_quotient =    quotient;
    assign output_remainder =   remainder;

    logic [5:0] index;

    initial begin
        data_valid = 0;
        quotient = 0;
        remainder = 0;
        index = 31;
    end


    always @(posedge (clock & enable & ~data_valid)) begin
        remainder = remainder << 1;
        remainder[0] = input_a[index];
        if (remainder >= input_b)
        begin
            remainder = remainder - input_b;
            quotient[index] = 1'b1;
        end
        if (index == 0)
        begin
            data_valid = 1;
        end
        index = index - 1;
    end

    always @(posedge (clock & ~enable & data_valid)) begin
        quotient = 0;
        remainder = 0;
        index = 31;
        data_valid = 0;
    end
    
endmodule