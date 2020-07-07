module TB();

reg rst;
reg [31:0] c;
reg clk;


wire [31:0] minOutputOfController;
wire [31:0] maxOutputOfController;

Middleware middleware(
    .minOutputOfController(minOutputOfController),
    .maxOutputOfController(maxOutputOfController),
    .rst(rst),
    .c(c),
    .clk(clk)

);





initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, TB);

    rst = 1;
    clk = 0;
    #20
    rst = 0;
    #20
    clk = 0;
    c=1;
    #20
    clk = 0;
    c=2;
    #20
    clk = 0;
    c=-1;
    #20
    clk = 0;
    c=4;
    #40
    #50;
    $finish(0);
end



always begin
    #5 clk = !clk;
end

endmodule