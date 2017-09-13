import std.stdio, std.getopt, std.path;
import std.exception, std.conv;

bool parse( string l, ref uint type, ref uint addr, ref ubyte[] data ) {
    if( l[0] != 'S' || (l[1] < '0' && l[1] > '9') ) {
        return false;
    }
    type = l[1] - '0';
    immutable uint byteCount = to!uint(l[2..4], 16);
    uint addrlen = 2;
    if( type == 2 || type == 3 ) {
        addrlen = type + 1;
    } else if( type == 7 || type == 8 ) {
        addrlen = 11 - type;
    }

    ubyte[] raw;
    ubyte crc;
    for( int i = 0; i < byteCount+1; i++ ) {
        string s =  l[2+i*2 .. 4+i*2];
        raw ~= to!ubyte(s, 16);
        crc += raw[i];
    }

    if( addrlen == 2 ) {
    addr = (raw[1] << 8) | raw[2];
    } else if( addrlen == 3 ) {
        addr = (raw[1] << 16) | (raw[2] << 8) | raw[3];
    } else if( addrlen == 4 ) {
        addr = (raw[1] << 24) | (raw[2] << 16) | (raw[3] << 8) | raw[4];
    }
    data = raw[addrlen..$-1].dup();

    return (crc==0xFF);
}

int main(string[] args)
{
    string[] srec = [
        "S00F000068656C6C6F212020202000003B",
        "S11F00007C0802A6900100049421FFF07C6C1B787C8C23783C6000003863000026",
        "S11F001C4BFFFFE5398000007D83637880010014382100107C0803A64E800020E9",
        "S111003848656C6C6F20776F726C642E0A0042",
        "S5030003F9",
        "S9030000FC"
        ];

	foreach( s; srec ) {
        uint type;
        uint addr;
        ubyte[] data;
        writeln(s);
        if( parse(s, type, addr, data) ) {
            writefln("Type: %u, Addr: 0x%08X, data len: %u", type, addr, data.length);
        } else {
            writeln("Error");
        }
        writeln();
	}
	return 0;
}
