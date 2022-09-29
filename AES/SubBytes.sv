module SubBytes(
in,
out
);

input [127:0]in;
output [127:0]out;

SBox unit1(
.in(in[7:0]),
.out(out[7:0])
);
SBox unit2(
.in(in[15:8]),
.out(out[15:8])
);
SBox unit3(
.in(in[23:16]),
.out(out[23:16])
);
SBox unit4(
.in(in[31:24]),
.out(out[31:24])
);
SBox unit5(
.in(in[39:32]),
.out(out[39:32])
);
SBox unit6(
.in(in[47:40]),
.out(out[47:40])
);
SBox unit7(
.in(in[55:48]),
.out(out[55:48])
);
SBox unit8(
.in(in[63:56]),
.out(out[63:56])
);
SBox unit9(
.in(in[71:64]),
.out(out[71:64])
);
SBox unit10(
.in(in[79:72]),
.out(out[79:72])
);
SBox unit11(
.in(in[87:80]),
.out(out[87:80])
);
SBox unit12(
.in(in[95:88]),
.out(out[95:88])
);
SBox unit13(
.in(in[103:96]),
.out(out[103:96])
);
SBox unit14(
.in(in[111:104]),
.out(out[111:104])
);
SBox unit15(
.in(in[119:112]),
.out(out[119:112])
);
SBox unit16(
.in(in[127:120]),
.out(out[127:120])
);



endmodule

module SubBytes_tb();
reg [127:0]in;
wire [127:0]out;
SubBytes uut(
.in(in),
.out(out)
);

initial 
begin
in=128'h003C6E471F4E22740E081B3154590B1A;
#100
$stop;
end
endmodule
