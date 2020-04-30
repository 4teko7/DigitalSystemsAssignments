`timescale 1ns/1ns
module testbench();
wire [0:0] z;
wire [1:0] cs;
wire [1:0] ns;
reg w;
reg rst;
reg clk;
parameter inputseq = 46'b1101010011000010101101010011000000010011000011;
integer i;

source s(z, cs, ns, w, rst, clk);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, z, cs, ns, w, rst, clk);
    
    rst = 1;
    w = 0;
    #20;
    rst = 0;
    
    for (i=45; i>=0; i--) begin
        w = inputseq[i];
        #40;
    end
    //
    
    $finish;
end

always begin	
	clk = 1;
	#20;
	clk = 0;
	#20;
    end

endmodule
