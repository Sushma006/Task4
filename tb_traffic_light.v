`timescale 1ns/1ps

module tb_traffic_light;

reg clk;
reg reset;
wire [2:0] light;

traffic_light uut(
    .clk(clk),
    .reset(reset),
    .light(light)
);

always #5 clk = ~clk;

initial begin
   $dumpfile("dump.vcd");
    $dumpvars(0, tb_moore_fsm);
    clk = 0;
    reset = 1;

    #10 reset = 0;

    #100 $finish;
end

endmodule
