`timescale 1ns / 1ps

module counter60_testbench;
    reg clk,rst,en;
    wire[7:0] count;
    wire cout;
    counter60 c60(clk,rst,en,count,cout);
    always
        #1 clk=~clk;
    initial
    begin
        clk=1'b0;
        rst=1'b0;
        en=1'b0;
        #3
        rst=1'b1;
        #3
        en=1'b1;
    end
endmodule
