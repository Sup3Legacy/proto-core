module moduleName #(
    parameter ram_size = 32000
) (
    input wire [31:0] read_address,
    input wire [31:0] write_address,
    input wire [31:0] write_data,

    input wire write_enable,
    input wire clock,

    output wire [31:0] read_data,

    output wire out_of_bounds_exception
);

    logic [7:0] RAM_FILE[ram_size - 1:0];
    /*
        TODO : add initialisation of RAM
    */

    assign out_of_bounds_exception = (read_address >= ram_size) | (write_address >= ram_size);

    assign read_data = {RAM_FILE[read_address], 
                        RAM_FILE[read_address + 1], 
                        RAM_FILE[read_address + 2], 
                        RAM_FILE[read_address + 3]};
    
    always @(posedge clock) begin
        if (write_enable) begin
            RAM_FILE[write_address] = write_data;
        end
    end
    
endmodule