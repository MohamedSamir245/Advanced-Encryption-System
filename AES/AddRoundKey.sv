module AddRoundKey#(parameter NK=4)(state,key,out);
input [127:0]state;
input [127:0]key;
output [127:0]out;

assign out = key^state;

//assign out[127:120]=key[127:120] ^ state[127:120];
//assign out[119:112]=key[119:112] ^ state[119:112];
//assign out[111:104]=key[111:104] ^ state[111:104];
//assign out[103:96]=key[103:96] ^ state[103:96];
//assign out[95:88]=key[95:88] ^ state[95:88];
//assign out[87:80]=key[87:80] ^ state[87:80];
//assign out[79:72]=key[79:72] ^ state[79:72];
//assign out[71:64]=key[71:64] ^ state[71:64];
//assign out[63:56]=key[63:56] ^ state[63:56];
//assign out[55:48]=key[55:48] ^ state[55:48];
//assign out[47:40]=key[47:40] ^ state[47:40];
//assign out[39:32]=key[39:32] ^ state[39:32];
//assign out[31:24]=key[31:24] ^ state[31:24];
//assign out[23:16]=key[23:16] ^ state[23:16];
//assign out[15:8]=key[15:8] ^ state[15:8];
//assign out[7:0]=key[7:0] ^ state[7:0];


endmodule

module AddRoundKey_tb();
reg [127:0]state;
reg [127:0]key;
wire [127:0]out;

AddRoundKey unit(
.state(state),
.key(key),
.out(out)
);

initial 
begin 

state[127:0]=128'hbd6e7c3df2b5779e0b61216e8b10b689;

key[127:0]=128'h549932d1f08557681093ed9cbe2c974e;


#100;
end
endmodule

