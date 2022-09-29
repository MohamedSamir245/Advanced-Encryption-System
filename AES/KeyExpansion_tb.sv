module KeyExpansion_tb(output wire[127:0]key);
reg[7:0]ck[16];
reg[127:0]key1;
reg[127:0]key2;
reg[127:0]key3;
reg[127:0]key4;
reg[127:0]key5;
reg[127:0]key6;
reg[127:0]key7;
reg[127:0]key8;
reg[127:0]key9;
reg[127:0]key10;
reg[127:0]key11;
reg[127:0]key12;
reg[127:0]key13;
reg[127:0]key14;


KeyExpansion unit(
.CurrentKey(ck),
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

initial begin

ck[0]=8'h2b;
ck[1]=8'h7e;
ck[2]=8'h15;
ck[3]=8'h16;
ck[4]=8'h28;
ck[5]=8'hae;
ck[6]=8'hd2;
ck[7]=8'ha6;
ck[8]=8'hab;
ck[9]=8'hf7;
ck[10]=8'h15;
ck[11]=8'h88;
ck[12]=8'h09;
ck[13]=8'hcf;
ck[14]=8'h4f;
ck[15]=8'h3c;

end

assign key=key1;

endmodule 