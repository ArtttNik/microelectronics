#include <systemc.h>
#include "SegDisplayRTL.h"
#include "SegDisplayTest.h"

int sc_main(int argc, char* argv[])
{
    SegDisplayRTL segdisp("segdisp");
    SegDisplayTest test("test");

    sc_signal<sc_uint<4>> s_digit("digit");
    sc_signal<sc_uint<7>> s_segments("segments");

    test.digit(s_digit);
    test.segments(s_segments);

    segdisp.digit(s_digit);
    segdisp.segments(s_segments);

    sc_trace_file* tf = sc_create_vcd_trace_file("lab3");
    tf->set_time_unit(1, SC_NS);

    sc_trace(tf, s_digit, "digit");
    sc_trace(tf, s_segments, "segments");

    sc_start();

    sc_close_vcd_trace_file(tf);

    return 0;
}