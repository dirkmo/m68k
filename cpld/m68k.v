`timescale 1ns/1ns

module m68kdecoder(
    input reset_n,
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
wire ds_n = uds_n & lds_n;

// oe_n must be held high when in bootloader mode
assign oe_n = boot ? 1'b1 : ~rw;

assign eeprom_lds_n = (cs == DEV_EEPROM) ? lds_n : 1'b1;
assign eeprom_uds_n = (cs == DEV_EEPROM) ? uds_n : 1'b1;
assign ram_ce_n = (cs == DEV_RAM) ? uds_n & lds_n : 1'b1;

//---------------------------------------------------------------
// address decoding

// memory map:
//        0..0x003FFF EEPROM (only after reset, masks RAM until first write to this range)
//        0..0x0FFFFF RAM
// 0x100000..0x104000 EEPROM

// at first power up, eeprom overlays ram at address 0. When cpu tries to write there,
// eeprom will be masked out and is only available at address 0x100000 (right after RAM).

reg eeprom_at_zero_n; // 0: eeprom starts at address 0, 1: RAM at address 0.

localparam
    DEV_NONE = 0,
    DEV_EEPROM = 1,
    DEV_RAM = 2,
    DEV_OTHER = 3;

always @(*) begin
    cs = DEV_NONE;
    if( ~as_n ) begin
        if( a < 'h00_4000 && ((~eeprom_at_zero_n && rw) || boot) ) begin
            cs = DEV_EEPROM;
        end else if( a < 'h10_0000 ) begin
            cs = DEV_RAM;
        end else if( a < 'h10_4000 ) begin
            cs = DEV_EEPROM;
        end else begin
            // no bus error handling atm
            cs = DEV_OTHER;
        end
    end
end

always @(posedge clk16)
begin
    if( ~reset_n ) begin
        // eeprom at address 0
        eeprom_at_zero_n = 1'b0;
    end else if( a < 'h00_4000 && ~eeprom_at_zero_n && ~rw && ~boot ) begin
        // no eeprom at 0 anymore
        eeprom_at_zero_n <= 1'b1;
    end
end

assign berr_n = as_n ? 1'b1 : ( cs != DEV_NONE );

//---------------------------------------------------------------
// dtack generation

// state machine registers
reg [1:0] state;
reg [1:0] next_state;
localparam IDLE = 2'd0, COUNT = 2'd1, DTACK = 2'd2;

reg [2:0] dtack_counter; // wait counter until dtack
reg [2:0] next_dtack_counter;

reg dtack_reg; // actual dtack output value register
// output dtack_reg when when state is non-zero. Make dtack hi-z when state=0
assign dtack_n = state == 'd0 ? 1'bz : dtack_reg;

// dtack_trig handling, rising edge detection
reg [1:0] dtack_trig_old;
always @(posedge clk16) dtack_trig_old[1:0] <= { dtack_trig_old[0], dtack_trig };
wire dtack_trig_pe = (dtack_trig_old[1:0] == 2'b01); // rising edge

always @(posedge clk16)
begin
    state <= next_state;
    dtack_counter <= next_dtack_counter;
    if( ~reset_n || as_n ) begin
        state <= 'd0;
    end
end

always @(*)
begin
    next_state = state;
    next_dtack_counter = dtack_counter;
    dtack_reg = 1'b1;
    case( state )
        IDLE: begin // wait for dtack cycle start
            if( boot ) begin
                if( dtack_trig_pe ) begin
                    next_dtack_counter = 'd4;
                    next_state = COUNT;
                end
            end else if ( ds_n == 1'b0 ) begin
                if( cs == DEV_EEPROM ) begin
                    // eeprom is slow, 200 ns access time for reading
                    next_dtack_counter = 'd4;
                    next_state = COUNT;
                end else if( cs == DEV_RAM ) begin
                    // RAM is fast, got directly to dtack state
                    next_state = DTACK;
                end
            end
        end
        COUNT: begin // count down to zero
            if( dtack_counter == 'd0 ) begin
                next_state = DTACK;
            end else begin
                next_dtack_counter = dtack_counter - 1;
            end
        end
        DTACK: begin // dtack as long as ds_n is active
            if( ds_n == 1'b0 ) begin
                dtack_reg = 1'b0;
            end else begin
                next_state = IDLE;
            end
        end
    endcase
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
    clkgen_counter = 0;
    dtack_counter = 0;
end

endmodule
