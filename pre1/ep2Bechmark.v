`timescale 1ns/1ns

module ep2Bechmark();
    reg u,r,g,x;
    wire s;

    ep2 xp(s,u,r,g,x);

    initial
        begin
            $dumpfile("test.vcd");
            $dumpvars(0,s,u,r,g,x);
            u = 0;
            r = 0;
            g = 0;
            x = 0;
            #20
            u = 0;
            r = 0;
            g = 0;
            x = 1;
            #20
            u = 0;
            r = 0;
            g = 1;
            x = 0;
            #20
            u = 0;
            r = 0;
            g = 1;
            x = 1;
            #20
            u = 0;
            r = 1;
            g = 0;
            x = 0;
            #20
            u = 0;
            r = 1;
            g = 0;
            x = 1;
            #20
            u = 0;
            r = 1;
            g = 1;
            x = 0;
            #20
            u = 0;
            r = 1;
            g = 1;
            x = 1;
            #20
            u = 1;
            r = 0;
            g = 0;
            x = 0;
            #20
            u = 1;
            r = 0;
            g = 0;
            x = 1;
            #20
            u = 1;
            r = 0;
            g = 1;
            x = 0;
            #20
            u = 1;
            r = 0;
            g = 1;
            x = 1;
            #20
            u = 1;
            r = 1;
            g = 0;
            x = 0;
            #20
            u = 1;
            r = 1;
            g = 0;
            x = 1;
            #20
            u = 1;
            r = 1;
            g = 1;
            x = 0;
            #20
            u = 1;
            r = 1;
            g = 1;
            x = 1;
            #20

            $finish;

        end

endmodule