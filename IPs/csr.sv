module CSR (
    input wire [1:0] core_mode,
    input wire [2:0] operation,
    input wire [31:0] csr_address, // TODO adjust width
    input wire [31:0] csr_write,

    output wire [1:0] interrupt, // TODO adapt when ISR functionnal
    output wire [31:0] csr_read
);
    
endmodule