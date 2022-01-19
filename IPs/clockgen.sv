module clock_gen #(
    parameter clock_number = 8
) (
    input wire mainclock,

    output wire [clock_number - 1:0] out_clocks
);

    logic [$clog2(clock_number) - 1:0] counters [clock_number - 1:0];
    wire [clock_number - 1:0] counters_toggle;

    genvar j;

    generate
        for (j = 0; j < clock_number; j = j + 1)
        begin
            assign counters_toggle[j] = (counters[j] == 0);
        end
    endgenerate

    
endmodule