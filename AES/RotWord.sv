module RotWord(word,out);

input [31:0]word;
output [31:0]out;

assign out={word[23:0],word[31:24]};
endmodule
