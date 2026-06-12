module traffic_light(
    input clk,
    input reset,
    output reg [2:0] light
);

parameter RED    = 3'b100;
parameter YELLOW = 3'b010;
parameter GREEN  = 3'b001;

reg [1:0] state;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= 0;
        light <= RED;
    end
    else
    begin
        case(state)

        0:
        begin
            state <= 1;
            light <= GREEN;
        end

        1:
        begin
            state <= 2;
            light <= YELLOW;
        end

        2:
        begin
            state <= 0;
            light <= RED;
        end

        endcase
    end
end

endmodule
