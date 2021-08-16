`include "div.sv"

module divider_tb;

    // Parameters
  
    // Ports
    reg [31:0] input_a;
    reg [31:0] input_b;
    reg  signed_a = 0;
    reg  signed_b = 0;
    reg  clock = 0;
    reg  enable = 0;
    wire [31:0] output_quotient;
    wire [31:0] output_remainder;
    wire data_valid;
  
    divider 
    divider_dut (
      .input_a (input_a ),
      .input_b (input_b ),
      .signed_a (signed_a ),
      .signed_b (signed_b ),
      .clock (clock ),
      .enable (enable ),
      .output_quotient (output_quotient ),
      .output_remainder (output_remainder ),
      .data_valid  ( data_valid)
    );

    logic [31:0] period = 0;
  
    initial begin
      begin
        $dumpfile("div.vcd");
        $dumpvars(0);
        input_a = 15634654;
        input_b = 21354;
        enable = 1;
      end
    end
  
    always
    begin
        #5  clock = ! clock ;
        period = period + 1;
        if (period == 128)
        begin
            $finish;
        end
    end
      
  
  endmodule
  