`timescale 1ns / 1ns
module TestBench();

reg [1:0]x;
wire y;

and_behavioral_level behavioral_level_module(y, x);

reg [1:0] index;

initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0, y, x);
	
	index = 0;
	repeat(6) begin
		x = index;
		index = index + 1;
		#20;
	end
	
	$finish;
end

endmodule
