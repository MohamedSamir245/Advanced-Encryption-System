module SubWord(word,out);
input [31:0]word;
output [31:0]out;


SBox unit1(
.in(word[7:0]),
.out(out[7:0])
);
SBox unit2(
.in(word[15:8]),
.out(out[15:8])
);
SBox unit3(
.in(word[23:16]),
.out(out[23:16])
);
SBox unit4(
.in(word[31:24]),
.out(out[31:24])
);

endmodule















