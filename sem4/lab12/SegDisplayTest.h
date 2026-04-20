#ifndef SEGDISPLAYTEST_H
#define SEGDISPLAYTEST_H

#include <iostream>
#include <systemc.h>


SC_MODULE(SegDisplayTest)
{
    sc_in<bool>           clk;
    sc_out<sc_uint<4> >   digit;
    sc_in<sc_uint<7> >    segments;

    sc_signal<bool>       check;

    sc_uint<4>            current_digit;

    void generate_digits();
    void check_segments();

    SC_CTOR(SegDisplayTest) :
        current_digit(0)
    {
        SC_THREAD(generate_digits);
        sensitive << clk.pos();

        SC_METHOD(check_segments);
        dont_initialize();
        sensitive << check.posedge_event();
    }
};

#endif