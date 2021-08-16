module register_file (
    input wire [4:0] read_register_1,
    input wire [4:0] read_register_2,

    input wire [4:0] write_register,
    input wire [31:0] write_data,

    input wire write_enable,
    input wire clock,

    output wire [31:0] read_data_1,
    output wire [31:0] read_data_2
);

    logic [31:0] REGS[31:0];

    integer i;
    initial begin
        for (i=0; i<32; i = i + 1) begin
            REGS[i] = 32'b0;
        end
    end

    /*
        TODO : add out-of-bounds detection (if necessary) and interruption output
    */
    assign read_data_1 = REGS[read_register_1];
    assign read_data_2 = REGS[read_register_2];

    always @(posedge clock) begin
        if (write_enable) begin
            REGS[write_register] = write_data;
        end
    end
    
endmodule