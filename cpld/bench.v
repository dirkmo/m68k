`timescale 1ns/1ns

module bench();

reg reset_n;
reg clk50;
reg clk16;
reg as_n;
reg lds_n;
reg uds_n;
reg boot;
reg dtack_trig;
reg [23:0] addr;
reg rw;

wire dtack_n;
wire oe_n;
wire berr_n;
wire ram_ce_n;
wire eeprom_lds_n;
wire eeprom_uds_n;
wire clk_from_cpld;
wire [3:0] cs;

m68kdecoder decoder(
     .reset_n(reset_n),
     .clk50(clk50),
     .clk16(clk16),
     .dtack_n(dtack_n),
     .rw(rw),
     .oe_n(oe_n),
     .as_n(as_n),
     .lds_n(lds_n),
     .uds_n(uds_n),
     .berr_n(berr_n),
     .ram_ce_n(ram_ce_n),
     .eeprom_lds_n(eeprom_lds_n),
     .eeprom_uds_n(eeprom_uds_n),
     .clk_from_cpld(clk_from_cpld),
     .boot(boot),
     .dtack_trig(dtack_trig),
     .addr(addr[23:13]),
     .cs(cs)
);

always #10 clk50 = ~clk50;
always #31.25 clk16 = ~clk16;

localparam
    DEV_NONE = 0,
    DEV_EEPROM = 1,
    DEV_RAM = 2,
    DEV_OTHER = 3;

initial begin
    $dumpvars;
    reset_n = 0;
    clk50 = 0;
    clk16 = 0;
    as_n = 1;
    lds_n = 1;
    uds_n = 1;
    rw = 1;
    boot = 0;
    dtack_trig = 0;
    addr = 0;
    #50;
    reset_n = 1;
    #50;

    // dtack tests
    $display("dtack tests");
    boot = 0;
    as_n = 0;
    addr = 0;
    uds_n = 0;
    $monitor("dtack_n: %b", dtack_n);
    
    #450;
    uds_n = 1;

    #100;
    // write access on 0, should hide eeprom
    rw = 0;
    uds_n = 0;
    addr = 0;
    #100;
    uds_n = 1;
    rw = 1;
    #100;
    uds_n = 0;
    addr = 0;
    #100;
    uds_n = 1;
    #50;

    boot = 1;
    uds_n = 0;
    rw = 0;
    #400;
    uds_n = 1;


    #100;
    as_n = 1;

    #100;
    as_n = 0;
    addr = 'h4000;
    uds_n = 0;
    #100;
    uds_n = 1;
    #50;
    as_n = 1;
    #50;

    boot = 1;
    addr = 0;
    as_n = 0;
    uds_n = 0;
    #100;

    dtack_trig = 1;
    #50;
    dtack_trig = 0;
    #400;
    uds_n = 1;
    as_n = 1;
    #100;



    $finish;
end

endmodule
