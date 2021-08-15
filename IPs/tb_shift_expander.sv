`include "shift_expander.sv"

`timescale 1 ns/10 ps
module shift_expander_tb;

    // Parameters
  
    // Ports
    reg [31:0] input_a = 32'b00111010111001010001100101011001;
    reg [6:0] shift_index = 0;
    wire [63:0] output_b;
  
    shift_expander 
    shift_expander_dut (
      .input_a (input_a ),
      .shift_index (shift_index[5:0] ),
      .output_b  ( output_b)
    );
  
    initial
    begin
        $dumpfile("shift_expander.vcd");
        $dumpvars(0, input_a);
        $dumpvars(1, shift_index);
        $dumpvars(3, output_b);
    end
  
    always
    begin
        #1
        shift_index = shift_index + 1;
        if (shift_index == 33) 
        begin
            $finish;
        end
    end

  endmodule
  