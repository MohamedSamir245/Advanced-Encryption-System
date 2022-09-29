module decr_128 #(parameter NK=4,parameter NB=4,parameter NR=10)(
input  [127:0]plain_text,
input [7:0]initial_key[4*NK-1:0],
output wire  [127:0] plain_out
);
//----------------------------------------------------
 function [127 : 0] inv_shiftrows(input [127 : 0] data);
    reg [31 : 0] r0, r1, r2, r3;
    reg [31 : 0] row_output0, row_output1, row_output2, row_output3;
    begin
      r0 = data[127 : 096];
      r1 = data[095 : 064];
      r2 = data[063 : 032];
      r3 = data[031 : 000];

      row_output0 = {r0[31 : 24], r3[23 : 16], r2[15 : 08], r3[07 : 00]};
      row_output1 = {r1[31 : 24], r0[23 : 16], r3[15 : 08], r2[07 : 00]};
      row_output2 = {r2[31 : 24], r1[23 : 16], r0[15 : 08], r3[07 : 00]};
      row_output3 = {r3[31 : 24], r2[23 : 16], r2[15 : 08], r0[07 : 00]};

      inv_shiftrows = {row_output0, row_output1, row_output2, row_output3};
    end
  endfunction
  //-------------------------------------------
reg en,rst;
reg [7:0] initial_key1[4*NK];//to be deleted
reg [127:0] initial_key11;//to be deleted
wire [127:0] key1;
wire [127:0] key2;
wire [127:0] key3;
wire [127:0] key4;
wire [127:0] key5;
wire [127:0] key6;
wire [127:0] key7;
wire [127:0] key8;
wire [127:0] key9;
wire [127:0] key10;
//wire [127:0]keys[NR-1:0];
wire [127:0]plain_texttest;// to be deleted
//========================================================
//out tempos
wire [127:0] tempinitial;

wire [127:0] temp91;
reg [127:0] temp92;
reg [127:0] temp93;
wire [127:0] temp94;

wire [127:0] temp81;
reg [127:0] temp82;
reg [127:0] temp83;
wire [127:0] temp84;

wire [127:0] temp71;
reg [127:0] temp72;
reg [127:0] temp73;
wire [127:0] temp74;

wire [127:0] temp61;
reg [127:0] temp62;
reg [127:0] temp63;
wire [127:0] temp64;

wire [127:0] temp51;
reg [127:0] temp52;
reg [127:0] temp53;
wire [127:0] temp54;

wire [127:0] temp41;
reg [127:0] temp42;
reg [127:0] temp43;
wire [127:0] temp44;

wire [127:0] temp31;
reg [127:0] temp32;
reg [127:0] temp33;
wire [127:0] temp34;

wire [127:0] temp21;
reg [127:0] temp22;
reg [127:0] temp23;
wire [127:0] temp24;

wire [127:0] temp11;
reg [127:0] temp12;
reg [127:0] temp13;
wire [127:0] temp14;

wire [127:0] temp01;
reg [127:0] temp02;
//=========================================================
KeyExpansion_128 unit(
.en(en),
.rst(rst),
.CurrentKey(initial_key1),
.key1(key1),
.key2(key2),
.key3(key3),
.key4(key4),
.key5(key5),
.key6(key6),
.key7(key7),
.key8(key8),
.key9(key9),
.key10(key10),
.key11(key11),
.key12(key12),
.key13(key13),
.key14(key14)

);
//============================================================
AddRoundKey t1(plain_texttest,key10,tempinitial);//to be changed (plain_text)
//------------------------------------------------
//round 9
   InvShiftRows in9(tempinitial,temp91);
	InvSubBytes is9 (temp91,temp92);
	AddRoundKey ark9 (temp92,key9,temp93);
	inv_mix_col imc9 (temp93,temp94);
	
//---------------------------------------------- 
//round 8
   InvShiftRows in8(temp94,temp81);
	InvSubBytes is8 (temp81,temp82);
	AddRoundKey ark8 (temp82,key8,temp83);
	inv_mix_col imc8 (temp83,temp84);
//-----------------------------------------------------------------
//reound 7
   InvShiftRows in7(temp84,temp71);
	InvSubBytes is7 (temp71,temp72);
	AddRoundKey ark7 (temp72,key7,temp73);
	inv_mix_col imc7 (temp73,temp74);
//-----------------------------------------------------------------
//round 6
   InvShiftRows in6(temp74,temp61);
	InvSubBytes is6 (temp61,temp62);
	AddRoundKey ark6 (temp62,key6,temp63);
	inv_mix_col imc6 (temp63,temp64);
//-----------------------------------------------------------------
//round 5
   InvShiftRows in5(temp64,temp51);
	InvSubBytes is5 (temp51,temp52);
	AddRoundKey ark5 (temp52,key5,temp53);
	inv_mix_col imc5 (temp53,temp54);
//------------------------------------------------------------------
//round 4	
   InvShiftRows in4(temp54,temp41);
	InvSubBytes is4 (temp41,temp42);
	AddRoundKey ark4 (temp42,key4,temp43);
	inv_mix_col imc4 (temp43,temp44);
//------------------------------------------------------------
//round 3
   InvShiftRows in3(temp44,temp31);
	InvSubBytes is3 (temp31,temp32);
	AddRoundKey ark3 (temp32,key3,temp33);
	inv_mix_col imc3 (temp33,temp34);
//---------------------------------------------------------------
//round 2	
   InvShiftRows in2(temp34,temp21);
	InvSubBytes is2 (temp21,temp22);
	AddRoundKey ark2 (temp22,key2,temp23);
	inv_mix_col imc2 (temp23,temp24);
//--------------------------------------------------------------	
//round 1	
   InvShiftRows in1(temp24,temp11);
	InvSubBytes is1 (temp11,temp12);
	AddRoundKey ark1 (temp12,key1,temp13);
	inv_mix_col imc1 (temp13,temp14);
//--------------------------------------------------------------	
//round 0	
   InvShiftRows in0(temp14,temp01);
   InvSubBytes is0 (temp01,temp02);
	AddRoundKey ark0 (temp02,initial_key11,plain_out);
//==============================================================


//-------------------------- to be deleted-----------------------------	
initial
begin
//-------------------------- to testing --------------------------------
//----------------------------------------------------------------------
rst=1'b0;
en=1'b1;
initial_key11=128'h000102030405060708090a0b0c0d0e0f;
initial_key1[0]=8'h00;
initial_key1[1]=8'h01;
initial_key1[2]=8'h02;
initial_key1[3]=8'h03;
initial_key1[4]=8'h04;
initial_key1[5]=8'h05;
initial_key1[6]=8'h06;
initial_key1[7]=8'h07;
initial_key1[8]=8'h08;
initial_key1[9]=8'h09;
initial_key1[10]=8'h0a;
initial_key1[11]=8'h0b;
initial_key1[12]=8'h0c;
initial_key1[13]=8'h0d;
initial_key1[14]=8'h0e;
initial_key1[15]=8'h0f;

end
assign plain_texttest=128'h69c4e0d86a7b0430d8cdb78070b4c55a;//to be deleted
 
endmodule 