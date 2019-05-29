// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sun Apr  7 03:56:00 2019
// Host        : jose-vpceg20el running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /opt/Xilinx/Vivado/2018.3/bin/reloj/reloj.srcs/sources_1/bd/design_1/ip/design_1_reloj_0_0/design_1_reloj_0_0_stub.v
// Design      : design_1_reloj_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "reloj,Vivado 2018.3" *)
module design_1_reloj_0_0(clk, led)
/* synthesis syn_black_box black_box_pad_pin="clk,led" */;
  input clk;
  output led;
endmodule
