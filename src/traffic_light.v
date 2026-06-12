module traffic_light(
    input clk,
    input reset,
    output reg [1:0] ns_light,
    output reg [1:0] ew_light
);

reg [1:0] state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

parameter GREEN  = 2'b00;
parameter YELLOW = 2'b01;
parameter RED    = 2'b10;

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
    begin
        case(state)
            S0: state <= S1;
            S1: state <= S2;
            S2: state <= S3;
            S3: state <= S0;
            default: state <= S0;
        endcase
    end
end

always @(*)
begin
    case(state)

        S0:
        begin
            ns_light = GREEN;
            ew_light = RED;
        end

        S1:
        begin
            ns_light = YELLOW;
            ew_light = RED;
        end

        S2:
        begin
            ns_light = RED;
            ew_light = GREEN;
        end

        S3:
        begin
            ns_light = RED;
            ew_light = YELLOW;
        end

        default:
        begin
            ns_light = RED;
            ew_light = RED;
        end

    endcase
end

endmodule