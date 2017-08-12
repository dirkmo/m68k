module m68kdecoder(
    input clk50,
    input clk16,
    inout dtack_n,
    input rw,
    output wire oe_n,
    input as_n,
    input lds_n,
    input uds_n,
    inout berr_n,
    output wire ram_ce_n,
    output wire eeprom_lds_n,
    output wire eeprom_uds_n,
    output clk_from_cpld,
    input boot,
    input dtack_trig,
    input [13:23] addr,
    output reg [3:0] cs
);

wire [23:0] a = { addr[23:13], 13'd0 };

// oe_n must be held high when in bootloader mode
assign oe_n = boot ? oe_n = 1'b1 : ~rw;

assign eeprom_lds_n = (cs == DEV_EEPROM) ? lds_n;
assign eeprom_uds_n = (cs == DEV_EEPROM) ? uds_n;
assign ram_ce_n = (cs == DEV_RAM) ? uds_n & lds_n;

localparam
    DEV_NONE = 0,
    DEV_EEPROM = 1,
    DEV_RAM = 2,
    DEV_OTHER = 3;

// address decoding
always @(*) begin
    cs = DEV_NONE;
    if( a < 'h00_4000 ) begin
        cs = DEV_EEPROM;
    end else if( a < 'h01_0000 ) begin
        cs = DEV_RAM;
    end else begin
        cs = DEV_OTHER;
    end
end


initial begin
end

endmodule