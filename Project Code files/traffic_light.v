module traffic_light(
    input  clk,
    input  reset,
    input  ped_req,

    output reg A_red,
    output reg A_yellow,
    output reg A_green,

    output reg B_red,
    output reg B_yellow,
    output reg B_green,

    output reg Ped_green
);

    // FSM States
    parameter A_G = 3'd0,   // A green, B red
              A_Y = 3'd1,   // A yellow, B red
              B_G = 3'd2,   // B green, A red
              B_Y = 3'd3,   // B yellow, A red
              PED = 3'd4;   // Pedestrian

    reg [2:0] state;
    reg [3:0] timer;
    reg ped_latched;

    // ---------------- Pedestrian Request Latch ----------------
    always @(posedge clk or posedge reset) begin
        if (reset)
            ped_latched <= 1'b0;
        else if (ped_req)
            ped_latched <= 1'b1;
        else if (state == PED)
            ped_latched <= 1'b0;
    end

    // ---------------- FSM + Timer ----------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= A_G;
            timer <= 4'd0;
        end else begin
            timer <= timer + 1'b1;

            if (timer == 4'd9) begin
                timer <= 4'd0;
                case (state)
                    A_G: state <= A_Y;
                    A_Y: state <= B_G;
                    B_G: state <= B_Y;
                    B_Y: state <= (ped_latched ? PED : A_G);
                    PED: state <= A_G;
                    default: state <= A_G;
                endcase
            end
        end
    end

    // ---------------- Output Logic ----------------
    always @(*) begin
        // default OFF
        A_red = 0; A_yellow = 0; A_green = 0;
        B_red = 0; B_yellow = 0; B_green = 0;
        Ped_green = 0;

        case (state)
            A_G: begin
                A_green = 1;
                B_red   = 1;
            end
            A_Y: begin
                A_yellow = 1;
                B_red    = 1;
            end
            B_G: begin
                B_green = 1;
                A_red   = 1;
            end
            B_Y: begin
                B_yellow = 1;
                A_red    = 1;
            end
            PED: begin
                A_red     = 1;
                B_red     = 1;
                Ped_green = 1;
            end
        endcase
    end

endmodule
