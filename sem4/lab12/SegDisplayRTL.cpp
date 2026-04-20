#include "SegDisplayRTL.h"

void SegDisplayRTL::comb_logic()
{
    sc_uint<7> seg;

    switch (digit.read())
    {
    case 0: seg = 0x7E; break;
    case 1: seg = 0x30; break;
    case 2: seg = 0x6D; break;
    case 3: seg = 0x79; break;
    case 4: seg = 0x33; break;
    case 5: seg = 0x5B; break;
    case 6: seg = 0x5F; break;
    case 7: seg = 0x70; break;
    case 8: seg = 0x7F; break;
    case 9: seg = 0x7B; break;
    default: seg = 0x4F; break;
    }

    segments.write(seg);
}