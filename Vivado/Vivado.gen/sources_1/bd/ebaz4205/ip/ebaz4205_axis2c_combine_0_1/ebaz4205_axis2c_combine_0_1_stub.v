// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Wed Apr 19 12:01:34 2023
// Host        : guido-UM690 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axis2c_combine_0_1/ebaz4205_axis2c_combine_0_1_stub.v
// Design      : ebaz4205_axis2c_combine_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis2c_combine,Vivado 2022.2" *)
module ebaz4205_axis2c_combine_0_1(clk, aresetn, channel1_data, channel2_data, 
  tvalid, tlast, tready, tdata)
/* synthesis syn_black_box black_box_pad_pin="clk,aresetn,channel1_data[15:0],channel2_data[15:0],tvalid,tlast,tready,tdata[15:0]" */;
  input clk;
  input aresetn;
  input [15:0]channel1_data;
  input [15:0]channel2_data;
  output tvalid;
  output tlast;
  input tready;
  output [15:0]tdata;
endmodule