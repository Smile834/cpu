`timescale 1ns / 1ps
module add_1(input ina,input inb,input cin,output sum,output cout);
    assign {cout,sum}=ina+inb+cin;
endmodule

module add_4(input[3:0] in_a,input[3:0] in_b,input cin,output[3:0] sum,output cout);
    wire[3:0] c;
    add_1 a0(in_a[0],in_b[0],cin,sum[0],c[0]);
    add_1 a1(in_a[1],in_b[1],c[0],sum[1],c[1]);
    add_1 a2(in_a[2],in_b[2],c[1],sum[2],c[2]);
    add_1 a3(in_a[3],in_b[3],c[2],sum[3],c[3]);
    assign cout=c[3];
endmodule
