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
    input [23:13] addr,
    output reg [3:0] cs
);

wire [23:0] a = { addr[23:13], 13'd0 };

// oe_n must be held high when in bootloader mode
assign oe_n = boot ? 1'b1 : ~rw;

assign eeprom_lds_n = (cs == DEV_EEPROM) ? lds_n : 1'b1;
assign eeprom_uds_n = (cs == DEV_EEPROM) ? uds_n : 1'b1;
assign ram_ce_n = (cs == DEV_RAM) ? uds_n & lds_n : 1'b1;

//---------------------------------------------------------------
// address decoding

localparam
    DEV_NONE = 0,
    DEV_EEPROM = 1,
    DEV_RAM = 2,
    DEV_OTHER = 3;

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

assign berr_n = as_n ? 1'b1 : ( cs != DEV_NONE );

//---------------------------------------------------------------
// dtack generation
reg [3:0] dtack_counter;
assign dtack_n = cs > DEV_RAM ? 1'bz : (dtack_counter != 'd0);

// dtack_trig handling
reg dtack_trig_old;
always @(posedge clk16) dtack_trig_old <= dtack_trig;
wire dtack_trig_pe = { dtack_trig_old , dtack_trig } == 2'b01; // rising edge

always @(posedge clk16)
begin
    if( boot ) begin
        if(dtack_trig_pe) begin
            dtack_counter <= 'd4;
        end
    end else if ( cs == DEV_EEPROM ) begin
        // eeprom read time 200ns. 16 MHz = 62.5ns
        // 200ns / 62.5ns = 3.2
        dtack_counter <= 'd4;
    end else if( cs == DEV_RAM ) begin
        // instant access to ram
        dtack_counter <= 'd0;
    end else begin
        if( dtack_counter > 'd0 ) begin
            dtack_counter <= dtack_counter - 1;
        end
    end
end

//---------------------------------------------------------------
// clk generator
localparam CLK_DIV = 4; // divide clk by 2**CLKDIV
reg [CLK_DIV-1:0] clkgen_counter;
assign clk_from_cpld = clkgen_counter[CLK_DIV-1];

always @(posedge clk16)
begin
    clkgen_counter <= clkgen_counter + 'b1;    
end

initial begin
end

endmodule