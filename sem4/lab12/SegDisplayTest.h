#ifndef SEGDISPLAYTEST_H
#define SEGDISPLAYTEST_H

#include <iostream>
#include <systemc.h>

SC_MODULE(SegDisplayTest)
{
    sc_out<sc_uint<4>> digit;
    sc_in<sc_uint<7>>  segments;

    sc_uint<4> current_digit;

    void test_process();

    SC_CTOR(SegDisplayTest) :
        current_digit(0)
    {
        SC_THREAD(test_process);
    }
};

#endif