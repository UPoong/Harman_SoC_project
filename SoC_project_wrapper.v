//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Oct  7 16:49:50 2024
//Host        : LAPTOP-1N2TLSL7 running 64-bit major release  (build 9200)
//Command     : generate_target SoC_project_wrapper.bd
//Design      : SoC_project_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SoC_project_wrapper
   (U_PWM,
    V_PWM,
    W_PWM,
    i_hall_state,
    i_rot_ccw,
    o_U_neg,
    o_U_pos,
    o_V_neg,
    o_V_pos,
    o_W_neg,
    o_W_pos,
    o_fnd,
    o_fnd_sel,
    o_hall_one_hot_state,
    reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd,
    vauxn6,
    vauxp6);
  output U_PWM;
  output V_PWM;
  output W_PWM;
  input [2:0]i_hall_state;
  input i_rot_ccw;
  output o_U_neg;
  output o_U_pos;
  output o_V_neg;
  output o_V_pos;
  output o_W_neg;
  output o_W_pos;
  output [7:0]o_fnd;
  output [3:0]o_fnd_sel;
  output [5:0]o_hall_one_hot_state;
  input reset;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;
  input vauxn6;
  input vauxp6;

  wire U_PWM;
  wire V_PWM;
  wire W_PWM;
  wire [2:0]i_hall_state;
  wire i_rot_ccw;
  wire o_U_neg;
  wire o_U_pos;
  wire o_V_neg;
  wire o_V_pos;
  wire o_W_neg;
  wire o_W_pos;
  wire [7:0]o_fnd;
  wire [3:0]o_fnd_sel;
  wire [5:0]o_hall_one_hot_state;
  wire reset;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;
  wire vauxn6;
  wire vauxp6;

  SoC_project SoC_project_i
       (.U_PWM(U_PWM),
        .V_PWM(V_PWM),
        .W_PWM(W_PWM),
        .i_hall_state(i_hall_state),
        .i_rot_ccw(i_rot_ccw),
        .o_U_neg(o_U_neg),
        .o_U_pos(o_U_pos),
        .o_V_neg(o_V_neg),
        .o_V_pos(o_V_pos),
        .o_W_neg(o_W_neg),
        .o_W_pos(o_W_pos),
        .o_fnd(o_fnd),
        .o_fnd_sel(o_fnd_sel),
        .o_hall_one_hot_state(o_hall_one_hot_state),
        .reset(reset),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd),
        .vauxn6(vauxn6),
        .vauxp6(vauxp6));
endmodule
