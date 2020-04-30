`timescale 1ns / 1ns
module TestBench();

reg [1:0] X;
wire [3:0] Y;

decoder_2_4 decoder_2_4_test(Y, X);

initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0, Y, X);
	
	X = 2'b00;
	#20;
	X = 2'b01;
	#20;
	X = 2'b10;
	#20;
	X = 2'b11;
	#20;
	X = 2'b11;
	#20;
	
	$finish;
end

endmodule
