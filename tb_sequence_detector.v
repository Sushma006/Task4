`timescale 1ns/1ps

module tb_sequence_detector;

reg clk;
reg reset;
reg in;
wire detected;

sequence_detector uut(
    .clk(clk),
    .reset(reset),
    .in(in),
    .detected(detected)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_moore_fsm);
    clk = 0;
    reset = 1;
    in = 0;

    #10 reset = 0;

    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 1; #10;

    #30 $finish;
end

endmodule
