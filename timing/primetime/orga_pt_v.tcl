## Copyright (C) 1991-2009 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.

## VENDOR "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 9.0 Build 132 02/25/2009 SJ Web Edition"

## DATE "06/18/2023 19:25:12"

## 
## Device: Altera EP2C20F484C8 Package FBGA484
## 

## 
## This Tcl script should be used for PrimeTime (Verilog) only
## 

## This file can be sourced in primetime

set report_default_significant_digits 3
set hierarchy_separator .

set quartus_root "c:/users/hp/desktop/programs/quartus/"
set search_path [list . [format "%s%s" $quartus_root "eda/synopsys/primetime/lib"]  ]

set link_path [list *  cycloneii_lcell_comb_lib.db  cycloneii_lcell_ff_lib.db  cycloneii_asynch_io_lib.db  bb2_lib.db  cycloneii_ram_internal_lib.db  cycloneii_memory_register_lib.db  cycloneii_memory_addr_register_lib.db  cycloneii_clk_delay_ctrl_lib.db  cycloneii_clk_delay_cal_ctrl_lib.db  cycloneii_mac_out_lib.db cycloneii_mac_mult_internal_lib.db  cycloneii_mac_register_lib.db  cycloneii_pll_lib.db  alt_vtl.db]

read_verilog  cycloneii_all_pt.v 

##########################
## DESIGN ENTRY SECTION ##
##########################

read_verilog  orga.vo
current_design CPU
link
## Set variable timing_propagate_single_condition_min_slew to false only for versions 2004.06 and earlier
regexp {([1-9][0-9][0-9][0-9]\.[0-9][0-9])} $sh_product_version dummy version
if { [string compare "2004.06" $version ] != -1 } {
   set timing_propagate_single_condition_min_slew false
}
set_operating_conditions -analysis_type single
read_sdf orga_v.sdo

################################
## TIMING CONSTRAINTS SECTION ##
################################


## Start clock definition ##
# WARNING:  The required clock period is not set. The default value (100 ns) is used. 
create_clock -period 100.000 -waveform {0.000 50.000} [get_ports { clock } ] -name clock  

set_propagated_clock [all_clocks]
## End clock definition ##

## Start create collections ##
## End create collections ##

## Start global settings ##
## End global settings ##

## Start collection commands definition ##

## End collection commands definition ##

## Start individual pin commands definition ##
## End individual pin commands definition ##

## Start Output pin capacitance definition ##
set_load -pin_load 0 [get_ports { AC[0] } ]
set_load -pin_load 0 [get_ports { AC[10] } ]
set_load -pin_load 0 [get_ports { AC[11] } ]
set_load -pin_load 0 [get_ports { AC[12] } ]
set_load -pin_load 0 [get_ports { AC[13] } ]
set_load -pin_load 0 [get_ports { AC[14] } ]
set_load -pin_load 0 [get_ports { AC[15] } ]
set_load -pin_load 0 [get_ports { AC[1] } ]
set_load -pin_load 0 [get_ports { AC[2] } ]
set_load -pin_load 0 [get_ports { AC[3] } ]
set_load -pin_load 0 [get_ports { AC[4] } ]
set_load -pin_load 0 [get_ports { AC[5] } ]
set_load -pin_load 0 [get_ports { AC[6] } ]
set_load -pin_load 0 [get_ports { AC[7] } ]
set_load -pin_load 0 [get_ports { AC[8] } ]
set_load -pin_load 0 [get_ports { AC[9] } ]
set_load -pin_load 0 [get_ports { IR[0] } ]
set_load -pin_load 0 [get_ports { IR[10] } ]
set_load -pin_load 0 [get_ports { IR[11] } ]
set_load -pin_load 0 [get_ports { IR[12] } ]
set_load -pin_load 0 [get_ports { IR[13] } ]
set_load -pin_load 0 [get_ports { IR[14] } ]
set_load -pin_load 0 [get_ports { IR[15] } ]
set_load -pin_load 0 [get_ports { IR[1] } ]
set_load -pin_load 0 [get_ports { IR[2] } ]
set_load -pin_load 0 [get_ports { IR[3] } ]
set_load -pin_load 0 [get_ports { IR[4] } ]
set_load -pin_load 0 [get_ports { IR[5] } ]
set_load -pin_load 0 [get_ports { IR[6] } ]
set_load -pin_load 0 [get_ports { IR[7] } ]
set_load -pin_load 0 [get_ports { IR[8] } ]
set_load -pin_load 0 [get_ports { IR[9] } ]
set_load -pin_load 0 [get_ports { MAR[0] } ]
set_load -pin_load 0 [get_ports { MAR[10] } ]
set_load -pin_load 0 [get_ports { MAR[1] } ]
set_load -pin_load 0 [get_ports { MAR[2] } ]
set_load -pin_load 0 [get_ports { MAR[3] } ]
set_load -pin_load 0 [get_ports { MAR[4] } ]
set_load -pin_load 0 [get_ports { MAR[5] } ]
set_load -pin_load 0 [get_ports { MAR[6] } ]
set_load -pin_load 0 [get_ports { MAR[7] } ]
set_load -pin_load 0 [get_ports { MAR[8] } ]
set_load -pin_load 0 [get_ports { MAR[9] } ]
set_load -pin_load 0 [get_ports { MBR[0] } ]
set_load -pin_load 0 [get_ports { MBR[10] } ]
set_load -pin_load 0 [get_ports { MBR[11] } ]
set_load -pin_load 0 [get_ports { MBR[12] } ]
set_load -pin_load 0 [get_ports { MBR[13] } ]
set_load -pin_load 0 [get_ports { MBR[14] } ]
set_load -pin_load 0 [get_ports { MBR[15] } ]
set_load -pin_load 0 [get_ports { MBR[1] } ]
set_load -pin_load 0 [get_ports { MBR[2] } ]
set_load -pin_load 0 [get_ports { MBR[3] } ]
set_load -pin_load 0 [get_ports { MBR[4] } ]
set_load -pin_load 0 [get_ports { MBR[5] } ]
set_load -pin_load 0 [get_ports { MBR[6] } ]
set_load -pin_load 0 [get_ports { MBR[7] } ]
set_load -pin_load 0 [get_ports { MBR[8] } ]
set_load -pin_load 0 [get_ports { MBR[9] } ]
set_load -pin_load 0 [get_ports { MemOut[0] } ]
set_load -pin_load 0 [get_ports { MemOut[10] } ]
set_load -pin_load 0 [get_ports { MemOut[11] } ]
set_load -pin_load 0 [get_ports { MemOut[12] } ]
set_load -pin_load 0 [get_ports { MemOut[13] } ]
set_load -pin_load 0 [get_ports { MemOut[14] } ]
set_load -pin_load 0 [get_ports { MemOut[15] } ]
set_load -pin_load 0 [get_ports { MemOut[1] } ]
set_load -pin_load 0 [get_ports { MemOut[2] } ]
set_load -pin_load 0 [get_ports { MemOut[3] } ]
set_load -pin_load 0 [get_ports { MemOut[4] } ]
set_load -pin_load 0 [get_ports { MemOut[5] } ]
set_load -pin_load 0 [get_ports { MemOut[6] } ]
set_load -pin_load 0 [get_ports { MemOut[7] } ]
set_load -pin_load 0 [get_ports { MemOut[8] } ]
set_load -pin_load 0 [get_ports { MemOut[9] } ]
set_load -pin_load 0 [get_ports { PC[0] } ]
set_load -pin_load 0 [get_ports { PC[10] } ]
set_load -pin_load 0 [get_ports { PC[1] } ]
set_load -pin_load 0 [get_ports { PC[2] } ]
set_load -pin_load 0 [get_ports { PC[3] } ]
set_load -pin_load 0 [get_ports { PC[4] } ]
set_load -pin_load 0 [get_ports { PC[5] } ]
set_load -pin_load 0 [get_ports { PC[6] } ]
set_load -pin_load 0 [get_ports { PC[7] } ]
set_load -pin_load 0 [get_ports { PC[8] } ]
set_load -pin_load 0 [get_ports { PC[9] } ]
set_load -pin_load 0 [get_ports { SR[0] } ]
set_load -pin_load 0 [get_ports { SR[1] } ]
set_load -pin_load 0 [get_ports { SR[2] } ]
set_load -pin_load 0 [get_ports { SR[3] } ]
set_load -pin_load 0 [get_ports { rd } ]
set_load -pin_load 0 [get_ports { wr } ]
## End Output pin capacitance definition ##

## Start clock uncertainty definition ##
## End clock uncertainty definition ##

## Start Multicycle and Cut Path definition ##
## End Multicycle and Cut Path definition ##

## Destroy Collections ##

update_timing
