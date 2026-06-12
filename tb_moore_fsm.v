`timescale 1ns/1ps

module tb_moore_fsm;

reg clk;
reg reset;
wire [1:0] state;

moore_fsm uut(
    .clk(clk),
    .reset(reset),
    .state(state)
);

always #5 clk = ~clk;

initial begin
   $dumpfile("dump.vcd");
    $dumpvars(0, tb_moore_fsm);
    clk = 0;
    reset = 1;

    #10 reset = 0;

    #60 $finish;
end

endmodule
