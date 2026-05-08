#ifndef SEGDISPLAY_H
#define SEGDISPLAY_H

#include <systemc.h>

SC_MODULE(SegDisplay)
{
    sc_in<sc_uint<4>> digit;
    sc_out<sc_uint<7>> segments;

    void on_digit();

    SC_CTOR(SegDisplay)
    {
        SC_METHOD(on_digit);
        sensitive << digit;
    }
};

#endif