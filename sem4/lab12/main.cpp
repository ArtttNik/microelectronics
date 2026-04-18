#include <systemc.h>
#include "SegDisplay.h"
#include "SegDisplayTest.h"

// main is defined in systemc.lib
int sc_main(int argc, char* argv[])
{
    // create modules
    SegDisplay              segdisp("segdisp");
    SegDisplayTest          segtest("segtest");

    //create 200MHz clock
    sc_clock                s_clk("clk", 5, SC_NS);

    // create signals
    sc_signal<sc_uint<4> >  s_digit("digit");
    sc_signal<sc_uint<7> >  s_segments("segments");

    // connect signals
    segtest.clk(s_clk);
    segtest.digit(s_digit);
    segtest.segments(s_segments);

    segdisp.digit(s_digit);
    segdisp.segments(s_segments);

    // create output trace file
    sc_trace_file* tf = sc_create_vcd_trace_file("lab2");
    tf->set_time_unit(1, SC_PS);

    // all changed signals will be auto output'ed to trace file
    sc_trace(tf, s_clk, "clk");
    sc_trace(tf, s_digit, "digit");
    sc_trace(tf, s_segments, "segments");

    sc_start(20000, SC_NS);

    sc_close_vcd_trace_file(tf);

    return 0;
}