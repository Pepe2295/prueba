-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Sun Apr  7 03:56:00 2019
-- Host        : jose-vpceg20el running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /opt/Xilinx/Vivado/2018.3/bin/reloj/reloj.srcs/sources_1/bd/design_1/ip/design_1_reloj_0_0/design_1_reloj_0_0_stub.vhdl
-- Design      : design_1_reloj_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_reloj_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    led : out STD_LOGIC
  );

end design_1_reloj_0_0;

architecture stub of design_1_reloj_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,led";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "reloj,Vivado 2018.3";
begin
end;
