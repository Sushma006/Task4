module sequence_detector(
    input clk,
    input reset,
    input in,
    output reg detected
);

reg [2:0] state;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= 0;
        detected <= 0;
    end
    else
    begin
        detected <= 0;

        case(state)

        0: state <= (in) ? 1 : 0;

        1: state <= (in) ? 1 : 2;

        2: state <= (in) ? 3 : 0;

        3:
        begin
            if(in)
            begin
                detected <= 1;
                state <= 1;
            end
            else
                state <= 2;
        end

        endcase
    end
end

endmodule
