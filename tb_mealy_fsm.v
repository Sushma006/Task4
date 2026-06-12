`timescale 1ns/1ps

module tb_mealy_fsm;

reg clk;
reg reset;
reg in;
wire out;

mealy_fsm uut(
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_moore_fsm);
    clk = 0;
    reset = 1;
    in = 0;

    #10 reset = 0;

    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;

    #30 $finish;
end

endmodule
