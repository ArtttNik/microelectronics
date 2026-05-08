
#include "systemc.h"

SC_MODULE(SegDisplayRTL)
{
    sc_in< sc_uint<4> > digit;
    sc_out< sc_uint<7> > segments;

    void comb_logic();

    SC_CTOR(SegDisplayRTL)
    {
        SC_METHOD(comb_logic);
        sensitive << digit;
    }
};
