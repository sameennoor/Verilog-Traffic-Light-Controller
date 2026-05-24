module traffic_light_tb;

    reg clk;
    reg reset;
    reg ped_req;

    wire A_red, A_yellow, A_green;
    wire B_red, B_yellow, B_green;
    wire Ped_green;

    traffic_light DUT (
        .clk(clk),
        .reset(reset),
        .ped_req(ped_req),
        .A_red(A_red),
        .A_yellow(A_yellow),
        .A_green(A_green),
        .B_red(B_red),
        .B_yellow(B_yellow),
        .B_green(B_green),
        .Ped_green(Ped_green)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        ped_req = 0;

        #10 reset = 0;

        // ?? HOLD pedestrian request LONG
        #40 ped_req = 1;
        #120 ped_req = 0;   // <<< KEY FIX

        #300 $stop;
    end
endmodule
