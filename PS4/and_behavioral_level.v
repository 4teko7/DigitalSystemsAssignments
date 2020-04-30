`timescale 1ns / 1ns
module and_behavioral_level(
	output reg y,
	input [1:0]x
);

always @(x) begin
	y <= x[1] & x[0];
end

endmodule
