
`timescale 1 ns / 1 ps

	module myMotorControl_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		input		wire					i_rot_ccw,
		input		wire		[2 : 0]		i_hall_state,
		output		wire					o_U_pos,
		output		wire					o_U_neg,
		output		wire					o_V_pos,
		output		wire					o_V_neg,
		output		wire					o_W_pos,
		output		wire					o_W_neg,
		// output		wire		[12 : 0]	o_RPM,
		output		wire					o_get_RPM,
		output		wire		[5 : 0]		o_hall_one_hot_state,
		output       wire          [7 : 0]        o_seg_7,
		output       wire           [3 : 0]       o_com,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);

		wire	[31 : 0]	w_time_count;
		wire				w_get_RPM;
		wire	[12 : 0]	w_RPM;
		wire				w_valid;
            wire        [15 : 0]    w_RPM_bcd;
// Instantiation of Axi Bus Interface S00_AXI
	myMotorControl_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) myMotorControl_v1_0_S00_AXI_inst 		(
		.i_time_count						(w_time_count),
		.o_RPM								(w_RPM),
		.o_valid							(w_valid),

		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here
	Motor_Control							i_Motor_Control(
		.i_clk								(s00_axi_aclk),
		.i_n_reset							(s00_axi_aresetn),
		.i_rot_ccw							(i_rot_ccw),
		.i_hall_state						(i_hall_state),
		.o_U_pos							(o_U_pos),
		.o_U_neg							(o_U_neg),
		.o_V_pos							(o_V_pos),
		.o_V_neg							(o_V_neg),
		.o_W_pos							(o_W_pos),
		.o_W_neg							(o_W_neg),
		.i_RPM								(w_RPM),
		.i_valid							(w_valid),
		.o_time_count						(w_time_count),
		.o_get_RPM							(o_get_RPM),
		.o_RPM								(),
		.o_hall_one_hot_state				(o_hall_one_hot_state)
	);
	
	
	bin_to_dec B2D(
	.bin(w_RPM[0 +: 12]),
	.bcd(w_RPM_bcd)
	);
	
	fnd_4digit_cntr(
	.clk(s00_axi_aclk),
	.reset_p(~s00_axi_aresetn),
	.value(w_RPM_bcd),
	.seg_7(o_seg_7),
	.com(o_com)
	);
	
	// User logic ends

	endmodule
