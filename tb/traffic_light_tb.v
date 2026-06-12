`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg reset;

wire [1:0] ns_light;
wire [1:0] ew_light;

traffic_light uut(
    .clk(clk),
    .reset(reset),
    .ns_light(ns_light),
    .ew_light(ew_light)
);

always
begin
    #5 clk = ~clk;
end

initial
begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

    #80;

    $finish;
end

initial
begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);
end

endmodule