module InvSubBytes(
in,
out
);

input [127:0]in;
output [127:0]out;

InvSBox unit1(
.in(in[7:0]),
.out(out[7:0])
);
InvSBox unit2(
.in(in[15:8]),
.out(out[15:8])
);
InvSBox unit3(
.in(in[23:16]),
.out(out[23:16])
);
InvSBox unit4(
.in(in[31:24]),
.out(out[31:24])
);
InvSBox unit5(
.in(in[39:32]),
.out(out[39:32])
);
InvSBox unit6(
.in(in[47:40]),
.out(out[47:40])
);
InvSBox unit7(
.in(in[55:48]),
.out(out[55:48])
);
InvSBox unit8(
.in(in[63:56]),
.out(out[63:56])
);
InvSBox unit9(
.in(in[71:64]),
.out(out[71:64])
);
InvSBox unit10(
.in(in[79:72]),
.out(out[79:72])
);
InvSBox unit11(
.in(in[87:80]),
.out(out[87:80])
);
InvSBox unit12(
.in(in[95:88]),
.out(out[95:88])
);
InvSBox unit13(
.in(in[103:96]),
.out(out[103:96])
);
InvSBox unit14(
.in(in[111:104]),
.out(out[111:104])
);
InvSBox unit15(
.in(in[119:112]),
.out(out[119:112])
);
InvSBox unit16(
.in(in[127:120]),
.out(out[127:120])
);



endmodule

module InvSubBytes_tb();
reg [127:0]in;
wire [127:0]out;
InvSubBytes uut(
.in(in),
.out(out)
);

initial 
begin
in=128'h63EB9FA0C02F9392AB30AFC720CB2BA2;
#100
$stop;
end
endmodule
