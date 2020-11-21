`timescale 1ns / 1ps

module counter60(clk,rst,en,count,cout);
    input clk,rst,en;
    output [7:0] count;
    output cout;
    wire[3:0] count6,count10;
    wire cout6,cout10;
    counter10 c10(clk,rst,en,count10,cout10);
    counter6 c6(clk,rst,cout10,count6,cout6);
    assign cout=cout6 & cout10;
    assign count={count6,count10};
endmodule

module counter6(clk,rst,en,count,cout);
    input clk,rst,en;
    output reg [3:0] count;
    output cout;
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            count<=4'b0000;
        else if(en)
            if(count==4'b0101)
                count<=4'b0000;
            else
                count<=count+1'b1;
        else
            count<=count;
    end
    assign cout=count[0]&count[2];
endmodule

module counter10(clk,rst,en,count,cout);
    input clk,rst,en;
    output reg [3:0] count;
    output cout;
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            count<=4'b0000;
        else if(en)
            if(count==4'b1001)
                count<=4'b0000;
            else
                count<=count+1'b1;
        else
            count<=count;
    end
    assign cout=count[0]&count[3];
endmodule