module bench();

reg clk50;
reg clk16;
wire dtack_n;
wire rw;
wire oe_n;
reg as_n;
reg lds_n;
reg uds_n;
wire berr_n;
wire ram_ce_n;
wire eeprom_lds_n;
wire eeprom_uds_n;
wire clk_from_cpld;
reg boot;
reg dtack_trig;
reg [23:13] addr;
wire [3:0] cs;

m68kdecoder decoder(
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
     .addr(addr),
     .cs(cs)
);

initial begin
  
end

endmodule
