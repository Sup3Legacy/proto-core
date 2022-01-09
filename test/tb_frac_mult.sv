`include "../IPs/frac_mult.sv"

`timescale 1 ns/10 ps
module fractionned_multiplier_tb;

    // Parameters
  
    // Ports
    reg [31:0] input_a = 69;
    reg [31:0] input_b = 127;
    reg  signed_a = 0;
    reg  signed_b = 0;
    reg  enable = 0;
    reg  clock = 0;
    wire [31:0] output_lower;
    wire [31:0] output_higher;
    wire output_valid;
    logic [15:0] period = 0;
  
    fractionned_multiplier 
    fractionned_multiplier_dut (
      .input_a (input_a ),
      .input_b (input_b ),
      .signed_a (signed_a ),
      .signed_b (signed_b ),
      .enable (enable ),
      .clock (clock ),
      .output_lower (output_lower ),
      .output_higher (output_higher ),
      .output_valid  ( output_valid)
    );
  
    initial
    begin
        $dumpfile("frac_mult.vcd");
        $dumpvars(0, fractionned_multiplier_dut);
    end

    always
    begin
        #5  clock = !clock;
        enable = 1;
        period = period + 1;
        if (period == 250) 
        begin
            $finish;
        end
    end
  
  endmodule
  