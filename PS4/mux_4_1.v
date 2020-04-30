`timescale 1ns / 1ns
module mux_4_1(
	output reg Y,
	input [3:0] X,
	input [1:0] S
);

always @(*) begin
	case(S)
		2'b00: Y <= X[0];
		2'b01: Y <= X[1];
		2'b10: Y <= X[2];
		2'b11: Y <= X[3];
		default: Y <= X[0];
	endcase
end

endmodule
