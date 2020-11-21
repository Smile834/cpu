`timescale 1ns / 1ps
module add_4_testbench;
    reg[3:0] ina;
    reg[3:0] inb;
    reg cin;
    wire[3:0] sum;
    wire cout;
    add_4 add_4_1(ina,inb,cin,sum,cout);
    initial
    begin
        #10
        ina=4'b0001;inb=4'b0001;cin=1'b1;
        #10
        ina=4'b1011;inb=4'b1001;cin=1'b1;
        #10
        ina=4'b0101;inb=4'b0001;cin=1'b0;
        #10
        ina=4'b1001;inb=4'b0101;cin=1'b0;
        #10
        ina=4'b1010;inb=4'b1010;cin=1'b1;
    end
endmodule