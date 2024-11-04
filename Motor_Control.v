`timescale 1ns / 1ps

module Motor_Control #(
        parameter                                                                   NUM_HOLE_SENSOR = 3
)(
        input           wire                                                        i_clk,
        input           wire                                                        i_n_reset,

        input           wire                                                        i_rot_ccw,
        input           wire            [NUM_HOLE_SENSOR - 1 : 0]                   i_hall_state,

        // DIRECTION
        output          wire                                                        o_U_pos,
        output          wire                                                        o_U_neg,
        output          wire                                                        o_V_pos, 
        output          wire                                                        o_V_neg,
        output          wire                                                        o_W_pos, 
        output          wire                                                        o_W_neg,

        // PS
        input           wire            [12 : 0]                                    i_RPM,
        input           wire                                                        i_valid,

        output          wire            [31 : 0]                                    o_time_count,
        output          wire                                                        o_get_RPM, // IRQ

        output          wire            [12 : 0]                                    o_RPM,
        output          wire            [5 : 0]                                     o_hall_one_hot_state
    );

                        localparam      [NUM_HOLE_SENSOR - 1 : 0]                   CCW_ST_0 = 3'b001;
                        localparam      [NUM_HOLE_SENSOR - 1 : 0]                   CCW_ST_1 = 3'b101;
                        localparam      [NUM_HOLE_SENSOR - 1 : 0]                   CCW_ST_2 = 3'b100;
                        localparam      [NUM_HOLE_SENSOR - 1 : 0]                   CCW_ST_3 = 3'b110;
                        localparam      [NUM_HOLE_SENSOR - 1 : 0]                   CCW_ST_4 = 3'b010;
                        localparam      [NUM_HOLE_SENSOR - 1 : 0]                   CCW_ST_5 = 3'b011;

                        localparam      [5 : 0]                                     ONE_HOT_ST_0 = 6'b_000_001 << 0;
                        localparam      [5 : 0]                                     ONE_HOT_ST_1 = 6'b_000_001 << 1;
                        localparam      [5 : 0]                                     ONE_HOT_ST_2 = 6'b_000_001 << 2;
                        localparam      [5 : 0]                                     ONE_HOT_ST_3 = 6'b_000_001 << 3;
                        localparam      [5 : 0]                                     ONE_HOT_ST_4 = 6'b_000_001 << 4;
                        localparam      [5 : 0]                                     ONE_HOT_ST_5 = 6'b_000_001 << 5;

                        reg             [5 : 0]                                     r_hall_one_hot_state;
                        reg             [2 : 0]                                     r_hall_state;
                        reg             [31 : 0]                                    r_time_count;
                        reg             [12 : 0]                                    r_RPM;
                        reg                                                         r_rot_ccw;
                        reg                                                         r_rot_ccw_z;
                        wire                                                        w_rot_change;

                        reg                                                         r_U_pos, r_U_neg;
                        reg                                                         r_V_pos, r_V_neg;
                        reg                                                         r_W_pos, r_W_neg;

                        wire                                                        w_get_RPM;
                        reg                                                         r_get_RPM;

        always @(posedge i_clk) begin
            if (!i_n_reset) begin
                r_rot_ccw <= 0;
                r_rot_ccw_z <= 0;
            end
            else begin
                r_rot_ccw <= i_rot_ccw;
                r_rot_ccw_z <= r_rot_ccw;
            end
        end

        always @(posedge i_clk) begin
            if (!i_n_reset) begin
                r_get_RPM <= 0;
            end
            else if (w_get_RPM) begin
                r_get_RPM <= 1;
            end
            else if (i_valid) begin
                r_get_RPM <= 0;
            end
        end

        always @(posedge i_clk) begin
            if (!i_n_reset) begin
                r_RPM <= 0;
            end
            else if (i_valid) begin
                r_RPM <= i_RPM;
            end
        end

        always @(posedge i_clk) begin
            if (!i_n_reset) begin
                r_time_count <= 0;
            end
            else begin
                if (i_valid) begin
                    r_time_count <= 0;
                end
                else begin
                    if (o_get_RPM) begin
                        r_time_count <= r_time_count;
                    end
                    else begin
                        if (r_time_count >= 32'hFFFF_FFFF) begin
                            r_time_count <= r_time_count;
                        end
                        else begin
                            r_time_count <= r_time_count + 1;
                        end
                    end
                end
            end
        end

        always @(posedge i_clk) begin
            if (!i_n_reset) begin
                r_hall_one_hot_state <= 0;
                r_hall_state <= 0;

                r_U_pos <= 0;
                r_U_neg <= 0;

                r_V_pos <= 0;
                r_V_neg <= 0;

                r_W_pos <= 0;
                r_W_neg <= 0;
            end
            else begin

                case (i_hall_state)
                    CCW_ST_0 : begin
                        if (i_rot_ccw) begin
                            r_U_pos <= 0; r_U_neg <= 1;
                            r_V_pos <= 1; r_V_neg <= 0;
                            r_W_pos <= 0; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_1;
                            r_hall_one_hot_state    <= ONE_HOT_ST_1;
                        end
                        else begin
                            r_U_pos <= 0; r_U_neg <= 0;
                            r_V_pos <= 0; r_V_neg <= 1;
                            r_W_pos <= 1; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_0;
                            r_hall_one_hot_state    <= ONE_HOT_ST_0;
                        end
                    end
                    CCW_ST_1: begin
                        if (i_rot_ccw) begin
                            r_U_pos <= 0; r_U_neg <= 1;
                            r_V_pos <= 0; r_V_neg <= 0;
                            r_W_pos <= 1; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_2;
                            r_hall_one_hot_state    <= ONE_HOT_ST_2;
                        end
                        else begin
                            r_U_pos <= 1; r_U_neg <= 0;
                            r_V_pos <= 0; r_V_neg <= 1;
                            r_W_pos <= 0; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_5;
                            r_hall_one_hot_state    <= ONE_HOT_ST_5;
                        end
                    end
                    CCW_ST_2 : begin
                        if (i_rot_ccw) begin
                            r_U_pos <= 0; r_U_neg <= 0;
                            r_V_pos <= 0; r_V_neg <= 1;
                            r_W_pos <= 1; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_3;
                            r_hall_one_hot_state    <= ONE_HOT_ST_3;
                        end
                        else begin
                            r_U_pos <= 1; r_U_neg <= 0;
                            r_V_pos <= 0; r_V_neg <= 0;
                            r_W_pos <= 0; r_W_neg <= 1;
                            r_hall_state            <= CCW_ST_4;
                            r_hall_one_hot_state    <= ONE_HOT_ST_4;
                        end
                    end
                    CCW_ST_3 : begin
                        if (i_rot_ccw) begin
                            r_U_pos <= 1; r_U_neg <= 0;
                            r_V_pos <= 0; r_V_neg <= 1;
                            r_W_pos <= 0; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_4;
                            r_hall_one_hot_state    <= ONE_HOT_ST_4;
                        end
                        else begin
                            r_U_pos <= 0; r_U_neg <= 0;
                            r_V_pos <= 1; r_V_neg <= 0;
                            r_W_pos <= 0; r_W_neg <= 1;
                            r_hall_state            <= CCW_ST_3;
                            r_hall_one_hot_state    <= ONE_HOT_ST_3;
                        end
                    end
                    CCW_ST_4 : begin
                        if (i_rot_ccw) begin
                            r_U_pos <= 1; r_U_neg <= 0;
                            r_V_pos <= 0; r_V_neg <= 0;
                            r_W_pos <= 0; r_W_neg <= 1;
                            r_hall_state            <= CCW_ST_5;
                            r_hall_one_hot_state    <= ONE_HOT_ST_5;
                        end
                        else begin
                            r_U_pos <= 0; r_U_neg <= 1;
                            r_V_pos <= 1; r_V_neg <= 0;
                            r_W_pos <= 0; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_2;
                            r_hall_one_hot_state    <= ONE_HOT_ST_2;
                        end
                    end
                    CCW_ST_5 : begin
                        if (i_rot_ccw) begin
                            r_U_pos <= 0; r_U_neg <= 0;
                            r_V_pos <= 1; r_V_neg <= 0;
                            r_W_pos <= 0; r_W_neg <= 1;
                            r_hall_state            <= CCW_ST_0;
                            r_hall_one_hot_state    <= ONE_HOT_ST_0;
                        end
                        else begin
                            r_U_pos <= 0; r_U_neg <= 1;
                            r_V_pos <= 0; r_V_neg <= 0;
                            r_W_pos <= 1; r_W_neg <= 0;
                            r_hall_state            <= CCW_ST_1;
                            r_hall_one_hot_state    <= ONE_HOT_ST_1;
                        end
                    end
                    default: begin
                        r_U_pos <= 0; r_U_neg <= 0;
                        r_V_pos <= 0; r_V_neg <= 0;
                        r_W_pos <= 0; r_W_neg <= 0;
                        
                        r_hall_state            <= 'bz;
                        r_hall_one_hot_state    <= 6'b111_111;
                    end
                endcase
            end
        end

        assign w_get_RPM                =   (i_hall_state == r_hall_state);
        assign o_get_RPM                =   r_get_RPM;

        assign o_hall_one_hot_state     =   r_hall_one_hot_state;
        assign w_rot_change             =   i_rot_ccw & ~r_rot_ccw_z;

        assign o_U_pos                  =   r_U_pos;
        assign o_U_neg                  =   r_U_neg;
        assign o_V_pos                  =   r_V_pos;
        assign o_V_neg                  =   r_V_neg;
        assign o_W_pos                  =   r_W_pos;
        assign o_W_neg                  =   r_W_neg;

        assign o_time_count             =   r_time_count;
        assign o_RPM                    =   r_RPM;

endmodule