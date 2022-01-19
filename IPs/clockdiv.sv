/*
    Used to select a clock channel.
*/

module clock_div (
    input wire [7:0] clocks,
    input wire [2:0] selector,

    output wire clock
);
    assign clock = clocks[selector]; 
    
endmodule