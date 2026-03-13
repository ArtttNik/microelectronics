restart -f

force clk 0 0, 1 50 ns -r 100 ns
force reset 1 0, 0 200 ns
force start 0 0, 1 300 ns, 0 1000 ns
force inArr(0) 3 0
force inArr(1) 6 0
force inArr(2) 7 0
force inArr(3) 5 0
force inArr(4) 3 0
force inArr(5) 5 0
force inArr(6) 6 0
force inArr(7) 2 0


