#ifndef SEGDISPLAYTEST_H
#define SEGDISPLAYTEST_H

#include <iostream>
#include <systemc.h>

/**
 UnitTest for digit to 7-segment display converter
 */
SC_MODULE(SegDisplayTest)
{
    /*** SegDisplay interface signals ***/
    sc_in<bool>           clk;
    sc_out<sc_uint<4> >   digit;
    sc_in<sc_uint<7> >    segments;

    // internal signal to call check_segments
    sc_signal<bool>       check;

    // current digit being tested
    sc_uint<4>            current_digit;

    // SC_THREAD: drives digit signal through all values 0..15
    void generate_digits();
    // SC_METHOD: checks that segments output matches expected value
    void check_segments();

    // constructor of test bench
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

#endif // SEGDISPLAYTEST_H