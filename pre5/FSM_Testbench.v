`timescale 1ns/1ns
module testbench();

wire [1:0] Y;

reg X;
reg reset;
reg clk;

FSM fsm(Y, X, reset, clk);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, fsm, Y, X, reset, clk);
    
    reset = 1;
    X = 0;
    #30;
    reset = 0;
	X = 0;
    #40;
	X = 1;
    #40;
	X = 1;
    #40;
	X = 1;
    #40;
	X = 1;
    #40;
	X = 0;
    #40;
	X = 0;
    #40;
	X = 1;
    #40;
	
	#80;
	
    $finish;
end

always begin	
	clk = 0;
	#20;
	clk = 1;
	#20;
    end

endmodule
