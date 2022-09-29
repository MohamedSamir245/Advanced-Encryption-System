module KeyExpansion_128 #(parameter NK=4,NB=4,NR=10)(key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,CurrentKey,rst,en);
input [7:0]CurrentKey[0:4*NK-1];
input rst,en;
output reg[127:0]key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14;

//reg [7:0]CurrentKey[0:4*NK-1];

function [7:0] sBox_fn;

input [7:0]in;

begin
	 sBox_fn=(in==8'h00)? 8'h63:
				(in==8'h01)? 8'h7c:
				(in==8'h02)? 8'h77:
				(in==8'h03)? 8'h7b:
				(in==8'h04)? 8'hf2:
				(in==8'h05)? 8'h6b:
				(in==8'h06)? 8'h6f:
				(in==8'h07)? 8'hc5:
				(in==8'h08)? 8'h30:
				(in==8'h09)? 8'h01:
				(in==8'h0a)? 8'h67:
				(in==8'h0b)? 8'h2b:
				(in==8'h0c)? 8'hfe:
				(in==8'h0d)? 8'hd7:
				(in==8'h0e)? 8'hab:
				(in==8'h0f)? 8'h76:
				(in==8'h10)? 8'hca:
				(in==8'h11)? 8'h82:
				(in==8'h12)? 8'hc9:
				(in==8'h13)? 8'h7d:
				(in==8'h14)? 8'hfa:
				(in==8'h15)? 8'h59:
				(in==8'h16)? 8'h47:
				(in==8'h17)? 8'hf0:
				(in==8'h18)? 8'had:
				(in==8'h19)? 8'hd4:
				(in==8'h1a)? 8'ha2:
				(in==8'h1b)? 8'haf:
				(in==8'h1c)? 8'h9c:
				(in==8'h1d)? 8'ha4:
				(in==8'h1e)? 8'h72:
				(in==8'h1f)? 8'hc0:
				(in==8'h20)? 8'hb7:
				(in==8'h21)? 8'hfd:
				(in==8'h22)? 8'h93:
				(in==8'h23)? 8'h26:
				(in==8'h24)? 8'h36:
				(in==8'h25)? 8'h3f:
				(in==8'h26)? 8'hf7:
				(in==8'h27)? 8'hcc:
				(in==8'h28)? 8'h34:
				(in==8'h29)? 8'ha5:
				(in==8'h2a)? 8'he5:
				(in==8'h2b)? 8'hf1:
				(in==8'h2c)? 8'h71:
				(in==8'h2d)? 8'hd8:
				(in==8'h2e)? 8'h31:
				(in==8'h2f)? 8'h15:
				(in==8'h30)? 8'h04:
				(in==8'h31)? 8'hc7:
				(in==8'h32)? 8'h23:
				(in==8'h33)? 8'hc3:
				(in==8'h34)? 8'h18:
				(in==8'h35)? 8'h96:
				(in==8'h36)? 8'h05:
				(in==8'h37)? 8'h9a:
				(in==8'h38)? 8'h07:
				(in==8'h39)? 8'h12:
				(in==8'h3a)? 8'h80:
				(in==8'h3b)? 8'he2:
				(in==8'h3c)? 8'heb:
				(in==8'h3d)? 8'h27:
				(in==8'h3e)? 8'hb2:
				(in==8'h3f)? 8'h75:
				(in==8'h40)? 8'h09:
				(in==8'h41)? 8'h83:
				(in==8'h42)? 8'h2c:
				(in==8'h43)? 8'h1a:
				(in==8'h44)? 8'h1b:
				(in==8'h45)? 8'h6e:
				(in==8'h46)? 8'h5a:
				(in==8'h47)? 8'ha0:
				(in==8'h48)? 8'h52:
				(in==8'h49)? 8'h3b:
				(in==8'h4a)? 8'hd6:
				(in==8'h4b)? 8'hb3:
				(in==8'h4c)? 8'h29:
				(in==8'h4d)? 8'he3:
				(in==8'h4e)? 8'h2f:
				(in==8'h4f)? 8'h84:
				(in==8'h50)? 8'h53:
				(in==8'h51)? 8'hd1:
				(in==8'h52)? 8'h00:
				(in==8'h53)? 8'hed:
				(in==8'h54)? 8'h20:
				(in==8'h55)? 8'hfc:
				(in==8'h56)? 8'hb1:
				(in==8'h57)? 8'h5b:
				(in==8'h58)? 8'h6a:
				(in==8'h59)? 8'hcb:
				(in==8'h5a)? 8'hbe:
				(in==8'h5b)? 8'h39:
				(in==8'h5c)? 8'h4a:
				(in==8'h5d)? 8'h4c:
				(in==8'h5e)? 8'h58:
				(in==8'h5f)? 8'hcf:
				(in==8'h60)? 8'hd0:
				(in==8'h61)? 8'hef:
				(in==8'h62)? 8'haa:
				(in==8'h63)? 8'hfb:
				(in==8'h64)? 8'h43:
				(in==8'h65)? 8'h4d:
				(in==8'h66)? 8'h33:
				(in==8'h67)? 8'h85:
				(in==8'h68)? 8'h45:
				(in==8'h69)? 8'hf9:
				(in==8'h6a)? 8'h02:
				(in==8'h6b)? 8'h7f:
				(in==8'h6c)? 8'h50:
				(in==8'h6d)? 8'h3c:
				(in==8'h6e)? 8'h9f:
				(in==8'h6f)? 8'ha8:
				(in==8'h70)? 8'h51:
				(in==8'h71)? 8'ha3:
				(in==8'h72)? 8'h40:
				(in==8'h73)? 8'h8f:
				(in==8'h74)? 8'h92:
				(in==8'h75)? 8'h9d:
				(in==8'h76)? 8'h38:
				(in==8'h77)? 8'hf5:
				(in==8'h78)? 8'hbc:
				(in==8'h79)? 8'hb6:
				(in==8'h7a)? 8'hda:
				(in==8'h7b)? 8'h21:
				(in==8'h7c)? 8'h10:
				(in==8'h7d)? 8'hff:
				(in==8'h7e)? 8'hf3:
				(in==8'h7f)? 8'hd2:
				(in==8'h80)? 8'hcd:
				(in==8'h81)? 8'h0c:
				(in==8'h82)? 8'h13:
				(in==8'h83)? 8'hec:
				(in==8'h84)? 8'h5f:
				(in==8'h85)? 8'h97:
				(in==8'h86)? 8'h44:
				(in==8'h87)? 8'h17:
				(in==8'h88)? 8'hc4:
				(in==8'h89)? 8'ha7:
				(in==8'h8a)? 8'h7e:
				(in==8'h8b)? 8'h3d:
				(in==8'h8c)? 8'h64:
				(in==8'h8d)? 8'h5d:
				(in==8'h8e)? 8'h19:
				(in==8'h8f)? 8'h73:
				(in==8'h90)? 8'h60:
				(in==8'h91)? 8'h81:
				(in==8'h92)? 8'h4f:
				(in==8'h93)? 8'hdc:
				(in==8'h94)? 8'h22:
				(in==8'h95)? 8'h2a:
				(in==8'h96)? 8'h90:
				(in==8'h97)? 8'h88:
				(in==8'h98)? 8'h46:
				(in==8'h99)? 8'hee:
				(in==8'h9a)? 8'hb8:
				(in==8'h9b)? 8'h14:
				(in==8'h9c)? 8'hde:
				(in==8'h9d)? 8'h5e:
				(in==8'h9e)? 8'h0b:
				(in==8'h9f)? 8'hdb:
				(in==8'ha0)? 8'he0:
				(in==8'ha1)? 8'h32:
				(in==8'ha2)? 8'h3a:
				(in==8'ha3)? 8'h0a:
				(in==8'ha4)? 8'h49:
				(in==8'ha5)? 8'h06:
				(in==8'ha6)? 8'h24:
				(in==8'ha7)? 8'h5c:
				(in==8'ha8)? 8'hc2:
				(in==8'ha9)? 8'hd3:
				(in==8'haa)? 8'hac:
				(in==8'hab)? 8'h62:
				(in==8'hac)? 8'h91:
				(in==8'had)? 8'h95:
				(in==8'hae)? 8'he4:
				(in==8'haf)? 8'h79:
				(in==8'hb0)? 8'he7:
				(in==8'hb1)? 8'hc8:
				(in==8'hb2)? 8'h37:
				(in==8'hb3)? 8'h6d:
				(in==8'hb4)? 8'h8d:
				(in==8'hb5)? 8'hd5:
				(in==8'hb6)? 8'h4e:
				(in==8'hb7)? 8'ha9:
				(in==8'hb8)? 8'h6c:
				(in==8'hb9)? 8'h56:
				(in==8'hba)? 8'hf4:
				(in==8'hbb)? 8'hea:
				(in==8'hbc)? 8'h65:
				(in==8'hbd)? 8'h7a:
				(in==8'hbe)? 8'hae:
				(in==8'hbf)? 8'h08:
				(in==8'hc0)? 8'hba:
				(in==8'hc1)? 8'h78:
				(in==8'hc2)? 8'h25:
				(in==8'hc3)? 8'h2e:
				(in==8'hc4)? 8'h1c:
				(in==8'hc5)? 8'ha6:
				(in==8'hc6)? 8'hb4:
				(in==8'hc7)? 8'hc6:
				(in==8'hc8)? 8'he8:
				(in==8'hc9)? 8'hdd:
				(in==8'hca)? 8'h74:
				(in==8'hcb)? 8'h1f:
				(in==8'hcc)? 8'h4b:
				(in==8'hcd)? 8'hbd:
				(in==8'hce)? 8'h8b:
				(in==8'hcf)? 8'h8a:
				(in==8'hd0)? 8'h70:
				(in==8'hd1)? 8'h3e:
				(in==8'hd2)? 8'hb5:
				(in==8'hd3)? 8'h66:
				(in==8'hd4)? 8'h48:
				(in==8'hd5)? 8'h03:
				(in==8'hd6)? 8'hf6:
				(in==8'hd7)? 8'h0e:
				(in==8'hd8)? 8'h61:
				(in==8'hd9)? 8'h35:
				(in==8'hda)? 8'h57:
				(in==8'hdb)? 8'hb9:
				(in==8'hdc)? 8'h86:
				(in==8'hdd)? 8'hc1:
				(in==8'hde)? 8'h1d:
				(in==8'hdf)? 8'h9e:
				(in==8'he0)? 8'he1:
				(in==8'he1)? 8'hf8:
				(in==8'he2)? 8'h98:
				(in==8'he3)? 8'h11:
				(in==8'he4)? 8'h69:
				(in==8'he5)? 8'hd9:
				(in==8'he6)? 8'h8e:
				(in==8'he7)? 8'h94:
				(in==8'he8)? 8'h9b:
				(in==8'he9)? 8'h1e:
				(in==8'hea)? 8'h87:
				(in==8'heb)? 8'he9:
				(in==8'hec)? 8'hce:
				(in==8'hed)? 8'h55:
				(in==8'hee)? 8'h28:
				(in==8'hef)? 8'hdf:
				(in==8'hf0)? 8'h8c:
				(in==8'hf1)? 8'ha1:
				(in==8'hf2)? 8'h89:
				(in==8'hf3)? 8'h0d:
				(in==8'hf4)? 8'hbf:
				(in==8'hf5)? 8'he6:
				(in==8'hf6)? 8'h42:
				(in==8'hf7)? 8'h68:
				(in==8'hf8)? 8'h41:
				(in==8'hf9)? 8'h99:
				(in==8'hfa)? 8'h2d:
				(in==8'hfb)? 8'h0f:
				(in==8'hfc)? 8'hb0:
				(in==8'hfd)? 8'h54:
				(in==8'hfe)? 8'hbb:
								 8'h16;

end
							 
endfunction

function[31:0] SubWord_fn(input [31:0]word);
begin
reg[7:0]s1;
reg[7:0]s2;
reg[7:0]s3;
reg[7:0]s4;

s1=sBox_fn(word[7:0]);
s2=sBox_fn(word[15:8]);
s3=sBox_fn(word[23:16]);
s4=sBox_fn(word[31:24]);

SubWord_fn={s4,s3,s2,s1};

end

endfunction

function [31:0] RotWord_fn(input [31:0]word);


RotWord_fn={word[23:0],word[31:24]};
endfunction

reg [31:0]Rcon[0:13];


reg[31:0]words[0:NB*(NR+1)-1];

reg[31:0]temp;

reg[31:0]rotin;
reg[31:0]rotout;
reg[31:0]subin;
reg[31:0]subout;
int i;


always @(en,rst)
if(rst==1'b1)
begin
key1=128'bx;
key2=128'bx;
key3=128'bx;
key4=128'bx;
key5=128'bx;
key6=128'bx;
key7=128'bx;
key8=128'bx;
key9=128'bx;
key10=128'bx;
key11=128'bx;
key12=128'bx;
key13=128'bx;
key14=128'bx;

end
else if(en==1'b1)
begin
//key1=0;
//key2=0;
//key3=0;
//key4=0;
//key5=0;
//key6=0;
//key7=0;
//key8=0;
//key9=0;
//key10=0;
//key11=0;
//key12=0;
//key13=0;
//key14=0;

//CurrentKey[0]=8'h2b;
//CurrentKey[1]=8'h7e;
//CurrentKey[2]=8'h15;
//CurrentKey[3]=8'h16;
//CurrentKey[4]=8'h28;
//CurrentKey[5]=8'hae;
//CurrentKey[6]=8'hd2;
//CurrentKey[7]=8'ha6;
//CurrentKey[8]=8'hab;
//CurrentKey[9]=8'hf7;
//CurrentKey[10]=8'h15;
//CurrentKey[11]=8'h88;
//CurrentKey[12]=8'h09;
//CurrentKey[13]=8'hcf;
//CurrentKey[14]=8'h4f;
//CurrentKey[15]=8'h3c;

Rcon[0]=32'h01000000;
Rcon[1]=32'h02000000;
Rcon[2]=32'h04000000;
Rcon[3]=32'h08000000;
Rcon[4]=32'h10000000;
Rcon[5]=32'h20000000;
Rcon[6]=32'h40000000;
Rcon[7]=32'h80000000;
Rcon[8]=32'h1b000000;
Rcon[9]=32'h36000000;
Rcon[10]=32'h6c000000;
Rcon[11]=32'hd8000000;
Rcon[12]=32'hab000000;
Rcon[13]=32'h4d000000;


for(i=0;i<NK;i++)
begin
words[i]={CurrentKey[4*i],CurrentKey[4*i+1],CurrentKey[4*i+2],CurrentKey[4*i+3]};
end


for(i=NK;i<NB*(NR+1);i++)
begin
temp=words[i-1];

if(i%NK==0)
begin

rotout=RotWord_fn(temp);
subout=SubWord_fn(rotout);
temp=subout^Rcon[i/NK-1];

end
else if(NK>6 & i%NK==4)
begin

subout=SubWord_fn(temp);
temp=subout;

end

words[i]=words[i-NK]^temp;

end

//end
//always @(CurrentKey)
//begin
key1={words[4],words[5],words[6],words[7]};
key2={words[8],words[9],words[10],words[11]};
key3={words[12],words[13],words[14],words[15]};
key4={words[16],words[17],words[18],words[19]};
key5={words[20],words[21],words[22],words[23]};
key6={words[24],words[25],words[26],words[27]};
key7={words[28],words[29],words[30],words[31]};
key8={words[32],words[33],words[34],words[35]};
key9={words[36],words[37],words[38],words[39]};
key10={words[40],words[41],words[42],words[43]};

if(NK==6)
begin
key11={words[44],words[45],words[46],words[47]};
key12={words[48],words[49],words[50],words[51]};
key13=128'bx;
key14=128'bx;
end
else if(NK==4)
begin
key11=128'bx;
key12=128'bx;
key13=128'bx;
key14=128'bx;
end
else if(NK==8)
begin
key11={words[44],words[45],words[46],words[47]};
key12={words[48],words[49],words[50],words[51]};
key13={words[52],words[53],words[54],words[55]};
key14={words[56],words[57],words[58],words[59]};
end
end



endmodule






//module KeyExpansion_tb();
//---------128bits tb-----------
//reg[7:0]ck[16];
//reg en,rst;
//wire[127:0]key1;
//wire[127:0]key2;
//wire[127:0]key3;
//wire[127:0]key4;
//wire[127:0]key5;
//wire[127:0]key6;
//wire[127:0]key7;
//wire[127:0]key8;
//wire[127:0]key9;
//wire[127:0]key10;
//wire[127:0]key11;
//wire[127:0]key12;
//wire[127:0]key13;
//wire[127:0]key14;


//---------192bits tb-----------

//reg[7:0]ck[24];
//reg en,rst;
//wire[127:0]key1;
//wire[127:0]key2;
//wire[127:0]key3;
//wire[127:0]key4;
//wire[127:0]key5;
//wire[127:0]key6;
//wire[127:0]key7;
//wire[127:0]key8;
//wire[127:0]key9;
//wire[127:0]key10;
//wire[127:0]key11;
//wire[127:0]key12;
//wire[127:0]key13;
//wire[127:0]key14;


//---------256bits tb-----------
//reg[7:0]ck[32];
//reg en,rst;
//wire[127:0]key1;
//wire[127:0]key2;
//wire[127:0]key3;
//wire[127:0]key4;
//wire[127:0]key5;
//wire[127:0]key6;
//wire[127:0]key7;
//wire[127:0]key8;
//wire[127:0]key9;
//wire[127:0]key10;
//wire[127:0]key11;
//wire[127:0]key12;
//wire[127:0]key13;
//wire[127:0]key14;


//KeyExpansion unit(
//.en(en),
//.rst(rst),
//.CurrentKey(ck),
//.key1(key1),
//.key2(key2),
//.key3(key3),
//.key4(key4),
//.key5(key5),
//.key6(key6),
//.key7(key7),
//.key8(key8),
//.key9(key9),
//.key10(key10),
//.key11(key11),
//.key12(key12),
//.key13(key13),
//.key14(key14)
//
//);

//initial begin

//---------128bits tb-----------

//#50 rst=1'b1;
//#50 rst=1'b0;
//#50 en=1'b1;

//ck[0]=8'h2b;
//ck[1]=8'h7e;
//ck[2]=8'h15;
//ck[3]=8'h16;
//ck[4]=8'h28;
//ck[5]=8'hae;
//ck[6]=8'hd2;
//ck[7]=8'ha6;
//ck[8]=8'hab;
//ck[9]=8'hf7;
//ck[10]=8'h15;
//ck[11]=8'h88;
//ck[12]=8'h09;
//ck[13]=8'hcf;
//ck[14]=8'h4f;
//ck[15]=8'h3c;

//---------192bits tb-----------

//#50 rst=1'b1;
//#50 rst=1'b0;
//#50 en=1'b1;
//
//ck[0]=8'h8e;
//ck[1]=8'h73;
//ck[2]=8'hb0;
//ck[3]=8'hf7;
//ck[4]=8'hda;
//ck[5]=8'h0e;
//ck[6]=8'h64;
//ck[7]=8'h52;
//ck[8]=8'hc8;
//ck[9]=8'h10;
//ck[10]=8'hf3;
//ck[11]=8'h2b;
//ck[12]=8'h80;
//ck[13]=8'h90;
//ck[14]=8'h79;
//ck[15]=8'he5;
//ck[16]=8'h62;
//ck[17]=8'hf8;
//ck[18]=8'hea;
//ck[19]=8'hd2;
//ck[20]=8'h52;
//ck[21]=8'h2c;
//ck[22]=8'h6b;
//ck[23]=8'h7b;

//---------256bits tb-----------
//#50 rst=1'b1;
//#50 rst=1'b0;
//#50 en=1'b1;
//
//ck[0]=8'h60;
//ck[1]=8'h3d;
//ck[2]=8'heb;
//ck[3]=8'h10;
//ck[4]=8'h15;
//ck[5]=8'hca;
//ck[6]=8'h71;
//ck[7]=8'hbe;
//ck[8]=8'h2b;
//ck[9]=8'h73;
//ck[10]=8'hae;
//ck[11]=8'hf0;
//ck[12]=8'h85;
//ck[13]=8'h7d;
//ck[14]=8'h77;
//ck[15]=8'h81;
//ck[16]=8'h1f;
//ck[17]=8'h35;
//ck[18]=8'h2c;
//ck[19]=8'h07;
//ck[20]=8'h3b;
//ck[21]=8'h61;
//ck[22]=8'h08;
//ck[23]=8'hd7;
//ck[24]=8'h2d;
//ck[25]=8'h98;
//ck[26]=8'h10;
//ck[27]=8'ha3;
//ck[28]=8'h09;
//ck[29]=8'h14;
//ck[30]=8'hdf;
//ck[31]=8'hf4;



//end

//endmodule 