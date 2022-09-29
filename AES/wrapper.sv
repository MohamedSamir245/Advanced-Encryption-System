module wrapper(enable,reset,in128,in192,in256,out128,out192,out256,enable_led,reset_led);
input enable;
input reset;
input in128;
input in192;
input in256;
output reg out128;
output reg out192;
output reg out256;
output enable_led;
output reset_led;

wire [127:0]plain_text;
reg [7:0]initial_key128[4*4-1:0];
reg [7:0]initial_key192[4*6-1:0];
reg [7:0]initial_key256[4*8-1:0];

wire  [127:0] plain_out_128e;
wire  [127:0] plain_out_192e;
wire  [127:0] plain_out_256e;

wire  [127:0] plain_out_128d;
wire  [127:0] plain_out_192d;
wire  [127:0] plain_out_256d;

encrypt_128 unit10(
.plain_text(plain_text),
.initial_key(initial_key128),
.plain_out(plain_out_128e)
);
decr_128 unit11(.plain_text(plain_out_128e),
.initial_key(initial_key128),
.plain_out(plain_out_128d)
);

encrypt_192 unit20(
.plain_text(plain_text),
.initial_key(initial_key192),
.plain_out(plain_out_192e)
);
decr_192 unit21(.plain_text(plain_out_192e),
.initial_key(initial_key192),
.plain_out(plain_out_192d)
);

encrypt_256 unit30(
.plain_text(plain_text),
.initial_key(initial_key256),
.plain_out(plain_out_256e)
);
decr_256 unit31(.plain_text(plain_out_256e),
.initial_key(initial_key256),
.plain_out(plain_out_256d)
);

initial
begin
//-------------------------- to testing --------------------------------
//----------------------------------------------------------------------
//reset=1'b0;
//enable=1'b1;
initial_key128[0]=8'h00;
initial_key128[1]=8'h01;
initial_key128[2]=8'h02;
initial_key128[3]=8'h03;
initial_key128[4]=8'h04;
initial_key128[5]=8'h05;
initial_key128[6]=8'h06;
initial_key128[7]=8'h07;
initial_key128[8]=8'h08;
initial_key128[9]=8'h09;
initial_key128[10]=8'h0a;
initial_key128[11]=8'h0b;
initial_key128[12]=8'h0c;
initial_key128[13]=8'h0d;
initial_key128[14]=8'h0e;
initial_key128[15]=8'h0f;

initial_key192[0]=8'h00;
initial_key192[1]=8'h01;
initial_key192[2]=8'h02;
initial_key192[3]=8'h03;
initial_key192[4]=8'h04;
initial_key192[5]=8'h05;
initial_key192[6]=8'h06;
initial_key192[7]=8'h07;
initial_key192[8]=8'h08;
initial_key192[9]=8'h09;
initial_key192[10]=8'h0a;
initial_key192[11]=8'h0b;
initial_key192[12]=8'h0c;
initial_key192[13]=8'h0d;
initial_key192[14]=8'h0e;
initial_key192[15]=8'h0f;
initial_key192[16]=8'h10;
initial_key192[17]=8'h11;
initial_key192[18]=8'h12;
initial_key192[19]=8'h13;
initial_key192[20]=8'h14;
initial_key192[21]=8'h15;
initial_key192[22]=8'h16;
initial_key192[23]=8'h17;

initial_key256[0]=8'h00;
initial_key256[1]=8'h01;
initial_key256[2]=8'h02;
initial_key256[3]=8'h03;
initial_key256[4]=8'h04;
initial_key256[5]=8'h05;
initial_key256[6]=8'h06;
initial_key256[7]=8'h07;
initial_key256[8]=8'h07;
initial_key256[9]=8'h08;
initial_key256[10]=8'h09;
initial_key256[11]=8'h0a;
initial_key256[12]=8'h0b;
initial_key256[13]=8'h0c;
initial_key256[14]=8'h0d;
initial_key256[15]=8'h0e;
initial_key256[16]=8'h0f;
initial_key256[17]=8'h10;
initial_key256[18]=8'h11;
initial_key256[19]=8'h12;
initial_key256[20]=8'h13;
initial_key256[21]=8'h14;
initial_key256[22]=8'h15;
initial_key256[23]=8'h16;
initial_key256[24]=8'h17;
initial_key256[25]=8'h18;
initial_key256[26]=8'h19;
initial_key256[27]=8'h1a;
initial_key256[28]=8'h1b;
initial_key256[29]=8'h1c;
initial_key256[30]=8'h1d;
initial_key256[31]=8'h1e;

end
//initial begin 
//if(plain_text==plain_out_256d && in256)
//	 out256=1'b1;
//if(plain_text==plain_out_192d && in192)
//	 out192=1'b1;	 
//if(plain_text==plain_out_128d && in128)
//	 out128=1'b1;
//end


always@(enable or  reset)
begin
if(reset)
begin
out256=1'b0;
out192=1'b0;
out128=1'b0;
end
else
begin 
if(enable)
begin
if(plain_text==plain_out_256d && in256)
	 out256=1'b1;
else
	 out256=1'b0;
	 
if(plain_text==plain_out_192d && in192)
	 out192=1'b1;
else
	 out192=1'b0;
	 
if(plain_text==plain_out_128d && in128)
	 out128=1'b1;
else
	 out128=1'b0;
end 
end
end
assign plain_text=128'h00112233445566778899aabbccddeeff;
assign enable_led=enable;
assign reset_led=reset;

endmodule

module wrapper_tb();
reg enable;
reg reset;
reg in128;
reg in192;
reg in256;
reg out128;
reg out192;
reg out256;
reg enable_led;
reg reset_led;

wrapper unit(
.enable(enable),
.reset(reset),
.in128(in128),
.in192(in192),
.in256(in256),
.out128(out128),
.out192(out192),
.out256(out256),
.enable_led(enable_led),
.reset_led(reset_led)
);

//initial begin 
//forever #50 clk=~clk;
//
//end

initial begin
reset=0; enable=0; in128=0; in192=0; in256=0; #100

reset=1; #100
reset=0; enable=1; /*clk=1;*/ in128=1; in192=0; in256=0; #100
if(out128==1)
$display("test_1 passed correctly ");
//clk=0; #50 
reset=1; #50
reset=0; enable=1; /*clk=1;*/ in128=0; in192=1; in256=0; #100
if(out192==1)
$display("test_2 passed correctly ");
//clk=0; #50 
reset=1; #50
reset=0; enable=1; /*clk=1;*/ in128=0;  in192=0; in256=1; #100;
if(out256==1)
$display("test_3 passed correctly ");


end

endmodule
 