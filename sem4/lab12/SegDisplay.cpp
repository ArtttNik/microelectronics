#include "SegDisplay.h"

void SegDisplay::on_digit()
{
    sc_uint<7> seg;

    switch (digit.read())
    {
    case 0:  seg = 0x7E; break; // 0b1111110
    case 1:  seg = 0x30; break; // 0b0110000
    case 2:  seg = 0x6D; break; // 0b1101101
    case 3:  seg = 0x79; break; // 0b1111001
    case 4:  seg = 0x33; break; // 0b0110011
    case 5:  seg = 0x5B; break; // 0b1011011
    case 6:  seg = 0x5F; break; // 0b1011111
    case 7:  seg = 0x70; break; // 0b1110000
    case 8:  seg = 0x7F; break; // 0b1111111
    case 9:  seg = 0x7B; break; // 0b1111011
    default: seg = 0x4F; break; // 0b1001111 - 'E' for error (10-15)
    }

    segments.write(seg);
}