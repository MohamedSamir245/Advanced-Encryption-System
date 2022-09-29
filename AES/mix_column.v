module x_time(
input[7:0] in_data,
output reg [7:0] out_data
);
reg [7:0] temp;
//initial
always@*
begin
					 temp=in_data<<1;
					out_data=(in_data[7]==1'b1) ?temp^8'h1b:temp;
end
endmodule 
//=--==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
module multi(
input [7:0] in_data,
input [7:0] mat,
output reg [7:0] out_data
);
wire [7:0]temp;
wire [7:0]temp1;
x_time unit (in_data,temp1);
x_time unit1 (in_data,temp);
always@*
begin
	case(mat)
	8'h01 :	  out_data=in_data;
	8'h02 :    out_data=temp1;
	8'h03: begin
				out_data=temp^in_data;
			end
	//default  out_data=in_data;
	endcase
end
endmodule
//-----------------------------------------
module colbyrow(
input [31:0]col,
input [7:0] r1,
input [7:0] r2,
input [7:0] r3,
input [7:0] r4,
output wire [7:0] s
);
wire [7:0] m1;
wire [7:0] m2;
wire [7:0] m3;
wire [7:0] m4;
multi n1(col[31:24],r1,m1);
multi n2(col[23:16],r2,m2);
multi n3(col[15:8],r3,m3);
multi n4(col[7:0],r4,m4);
//initial
//begin
 assign s=m1^m2^m3^m4;
//end
endmodule
//=-=-=--==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
module mix_col(
input [127:0] in_data,
output wire [127:0] out_data
);
//----------------------------------------------------------
//c11		c21		c31		c41
//c12		c22		c32		c42
//c13		c23		c33		c43
//c14		c24		c34		c44
colbyrow c11(in_data[127:96],8'h02,8'h03,8'h01,8'h01,out_data[127:120]);
colbyrow c12(in_data[127:96],8'h01,8'h02,8'h03,8'h01,out_data[119:112]);
colbyrow c13(in_data[127:96],8'h01,8'h01,8'h02,8'h03,out_data[111:104]);
colbyrow c14(in_data[127:96],8'h03,8'h01,8'h01,8'h02,out_data[103:96]);
colbyrow c21(in_data[95:64],8'h02,8'h03,8'h01,8'h01,out_data[95:88]);
colbyrow c22(in_data[95:64],8'h01,8'h02,8'h03,8'h01,out_data[87:80]);
colbyrow c23(in_data[95:64],8'h01,8'h01,8'h02,8'h03,out_data[79:72]);
colbyrow c24(in_data[95:64],8'h03,8'h01,8'h01,8'h02,out_data[71:64]);
colbyrow c31(in_data[63:32],8'h02,8'h03,8'h01,8'h01,out_data[63:56]);
colbyrow c32(in_data[63:32],8'h01,8'h02,8'h03,8'h01,out_data[55:48]);
colbyrow c33(in_data[63:32],8'h01,8'h01,8'h02,8'h03,out_data[47:40]);
colbyrow c34(in_data[63:32],8'h03,8'h01,8'h01,8'h02,out_data[39:32]);
colbyrow c41(in_data[31:0],8'h02,8'h03,8'h01,8'h01,out_data[31:24]);
colbyrow c42(in_data[31:0],8'h01,8'h02,8'h03,8'h01,out_data[23:16]);
colbyrow c43(in_data[31:0],8'h01,8'h01,8'h02,8'h03,out_data[15:8]);
colbyrow c44(in_data[31:0],8'h03,8'h01,8'h01,8'h02,out_data[7:0]);
//----------------_______________

endmodule

//module test();
//reg [127:0] in;
//wire [127:0] out;
//initial
//begin
 //in=128'h09287F476F746ABF2C4A6204DA08E3EE;
//end
 //mix_col h1(in,out);
//endmodule 