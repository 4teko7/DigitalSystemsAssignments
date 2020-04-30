`timescale 1ns / 1ns
module TestBench();

reg [3:0] X;
reg [1:0] S;
wire [3:0] Y;

TestMuxDecoder TestMuxDecoderTest(Y, X, S);

initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0, Y, X, S);
	
	X = 4'b0111; S = 2'b00;
	#20;
	X = 4'b0101; S = 2'b01;
	#20;
	X = 4'b0101; S = 2'b10;
	#20;
	X = 4'b0101; S = 2'b11;
	#20;
	X = 4'b1100; S = 2'b11;
	#20;
	
	$finish;
end

endmodule
