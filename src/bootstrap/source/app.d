import core.thread;
import core.stdc.stdlib;
import control;
import databus;
import dserial;
import std.stdio;

enum Expander {
    MCP23017 = 0x20,
    MCP23008 = 0x21
}

SerialPort serialport;
Control ctrl;
DataBus db;

void init() {
    string port;
    version(linux) { port = "/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_AL03NOWB-if00-port0"; }
    version(OSX)   { port = "/dev/cu.usbserial-AL03NOWB"; }
    serialport = new SerialPort();
	
    if( ! serialport.open(port, 115200) ) {
        writefln("ERROR: Failed to open port %s", port);
        exit(1);
    }

    ctrl = new Control( serialport );
    if( !ctrl.init() ) {
        writeln("MCP23008 not found.");
        exit(2);
    }

    db = new DataBus( serialport );
    if( !db.init() ) {
        writeln("MCP23017 not found.");
        exit(3);
    }
}

void write_word( ushort eeprom_value, ushort cpu_value ) {
    ctrl.rw = 1;
    // EEProm beschreiben
    db.output( eeprom_value );
    writefln("db->eeprom( %04X );", eeprom_value); readln();
    ctrl.rw = 0;
    ctrl.rw = 1;

    db.output( cpu_value );
    writefln("db->cpu( %04X );", cpu_value); readln();
    ctrl.dtack();
}

int main(string[] args)
{
    writeln("m68k Bootstrap program");
    init();

    db.highz();

    ctrl.reset = true;
    // bootstrap mode starten
    ctrl.boot = true;
    // cpu laufen lassen
    ctrl.reset = false;

    enum NOP = 0x714E;

    ushort[] data = [
        //0x0010, 0x0000, 0x0000, 0x0008, 0x4efa, 0xfffe
        0x1000, 0x0000, 0x0000, 0x0800, 0xfa4e, 0xfeff
    ];
    
    int i;
    // SP und Resetvektor
    for ( i = 0; i<4; i++ ) {
        writef("%04X ", data[i]);
        write_word(data[i], data[i]);
    }
    writeln("Start");
    while(true) {
        //writef("%04X ", data[i]);
        //write_word(data[i], NOP);
        writef("%04X ", NOP);
        write_word(NOP, NOP);
    }

/*
    writeln();
    // restart cpu
    ctrl.reset = true;
    db.highz();
    // bootstrap mode beenden
    ctrl.highz();
  */  
	//return 0;
}
