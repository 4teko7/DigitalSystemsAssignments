`timescale 1ns/1ns
module ep2(s,u,r,g,x);

    input u,r,g,x;
    wire wRG,wURG;
    output s;

    or(wRG,r,g);
    and(wURG,wRG,u);
    or(s,wURG,x);


endmodule
