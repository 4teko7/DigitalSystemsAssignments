`timescale 1ns / 1ns
module TestMuxDecoder(
	output [3:0] Y,
	input [3:0] X,
	input [1:0] S
);

wire w0,w1;

mux_4_1 mux_4_1_test(w0, X, S);
and(w1,w0,1'b0);
decoder_2_4 decoder_2_4_test(Y, {w1,1'b0});

endmodule
