#include "SegDisplayTest.h"

void SegDisplayTest::test_process()
{

    for (int i = 0; i < 16; i++)
    {
        current_digit = i;
        digit.write(i);

        wait(1, SC_NS);

        sc_uint<7> expected;

        switch (current_digit)
        {
        case 0: expected = 0x7E; break;
        case 1: expected = 0x30; break;
        case 2: expected = 0x6D; break;
        case 3: expected = 0x79; break;
        case 4: expected = 0x33; break;
        case 5: expected = 0x5B; break;
        case 6: expected = 0x5F; break;
        case 7: expected = 0x70; break;
        case 8: expected = 0x7F; break;
        case 9: expected = 0x7B; break;
        default: expected = 0x4F; break;
        }

        if (segments.read() != expected)
        {
            std::cerr << "Error at " << sc_time_stamp()
                << ": digit=" << current_digit
                << " expected=" << expected
                << " got=" << segments.read()
                << std::endl;
        }

    }

    sc_stop();
}