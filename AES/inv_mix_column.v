module inv_multi (input [7:0] in_data,
input [7:0] mat,
output reg [7:0] out_data);
reg [7:0] temp;
reg [7:0] temp2;
reg [7:0] temp4;
reg [7:0] temp8;
always @*
begin
	temp=in_data<<1;
	temp2=(in_data[7]==1'b1) ?temp^8'h1b:temp;// multi. by 2
	
	temp=temp2<<1;
	temp4=(temp2[7]==1'b1) ?temp^8'h1b:temp;//multi.by 4
	
	temp=temp4<<1;
	temp8=(temp4[7]==1'b1) ?temp^8'h1b:temp;//multi. by 8
	end 
	
always@*
	begin
	case(mat)
	8'h09: begin
			out_data=temp8^in_data;
			end
	8'h0b: begin
			out_data=temp8^temp2^in_data;
			end
	8'h0d: begin
			out_data=temp8^temp4^in_data;
			end
	8'h0e: begin
			out_data=temp8^temp4^temp2;
			end
	default :out_data=in_data;
	endcase
	end
endmodule	
//============================================================


module inv_colbyrow(
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
inv_multi n1(col[31:24],r1,m1);
inv_multi n2(col[23:16],r2,m2);
inv_multi n3(col[15:8],r3,m3);
inv_multi n4(col[7:0],r4,m4);
//initial
//begin
 assign s=m1^m2^m3^m4;
//end
endmodule
//_____________________________________________________________
module inv_mix_col(
input [127:0] in_data,
output  [127:0] out_data
);
//----------------------------------------------------------
//c11		c21		c31		c41
//c12		c22		c32		c42
//c13		c23		c33		c43
//c14		c24		c34		c44
 inv_colbyrow c11(in_data[127:96],8'h0e,8'h0b,8'h0d,8'h09,out_data[127:120]);
 inv_colbyrow c12(in_data[127:96],8'h09,8'h0e,8'h0b,8'h0d,out_data[119:112]);
 inv_colbyrow c13(in_data[127:96],8'h0d,8'h09,8'h0e,8'h0b,out_data[111:104]);
 inv_colbyrow c14(in_data[127:96],8'h0b,8'h0d,8'h09,8'h0e,out_data[103:96]);
 //-----------------------------------------
 inv_colbyrow c21(in_data[95:64],8'h0e,8'h0b,8'h0d,8'h09,out_data[95:88]);
 inv_colbyrow c22(in_data[95:64],8'h09,8'h0e,8'h0b,8'h0d,out_data[87:80]);
 inv_colbyrow c23(in_data[95:64],8'h0d,8'h09,8'h0e,8'h0b,out_data[79:72]);
 inv_colbyrow c24(in_data[95:64],8'h0b,8'h0d,8'h09,8'h0e,out_data[71:64]);
  //----------------------------------------
 inv_colbyrow c31(in_data[63:32],8'h0e,8'h0b,8'h0d,8'h09,out_data[63:56]);
 inv_colbyrow c32(in_data[63:32],8'h09,8'h0e,8'h0b,8'h0d,out_data[55:48]);
 inv_colbyrow c33(in_data[63:32],8'h0d,8'h09,8'h0e,8'h0b,out_data[47:40]);
 inv_colbyrow c34(in_data[63:32],8'h0b,8'h0d,8'h09,8'h0e,out_data[39:32]);
  //---------------------------------------------------
 inv_colbyrow c41(in_data[31:0],8'h0e,8'h0b,8'h0d,8'h09,out_data[31:24]);
 inv_colbyrow c42(in_data[31:0],8'h09,8'h0e,8'h0b,8'h0d,out_data[23:16]);
 inv_colbyrow c43(in_data[31:0],8'h0d,8'h09,8'h0e,8'h0b,out_data[15:8]);
 inv_colbyrow c44(in_data[31:0],8'h0b,8'h0d,8'h09,8'h0e,out_data[7:0]);
 //---------------------------------------------------------------------
 endmodule
 
 module test();
 reg [127:0] in;
 wire [127:0] out;
 initial
 begin
 in=128'he9f74eec023020f61bf2ccf2353c21c7;
 end
 inv_mix_col rr(in,out);
 endmodule
 