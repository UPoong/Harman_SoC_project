## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports i_clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports i_clk]


## Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {i_rot_ccw}]
# set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {i_sw_x_coord[1]}]
# set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {i_sw_x_coord[2]}]
# set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports {i_sw_x_coord[3]}]
# set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports {i_sw[4]}]
# set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports {i_sw[5]}]
# set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports {i_sw[6]}]
# set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports {i_sw_enable}]
# set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports {i_sw[8]}]
# set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports {i_sw[9]}]
# set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports {i_sw[10]}]
# set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports {i_sw[11]}]
# set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports {i_sw_y_coord[0]}]
# set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports {i_sw_y_coord[1]}]
# set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports {i_sw_y_coord[2]}]
# set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports {i_sw_y_coord[3]}]


## LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports {o_hall_one_hot_state[0]}]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports {o_hall_one_hot_state[1]}]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports {o_hall_one_hot_state[2]}]
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports {o_hall_one_hot_state[3]}]
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports {o_hall_one_hot_state[4]}]
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports {o_hall_one_hot_state[5]}]
# set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports {o_RPM[6]}]
# set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports {o_RPM[7]}]
# set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports {o_RPM[8]}]
# set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports {o_RPM[9]}]
# set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports {o_RPM[10]}]
# set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports {o_RPM[11]}]
# set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports {o_RPM[12]}]
# set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports {o_led_h_status[0]}]
# set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports {o_led_h_status[0]}]
# set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports {o_led_h_status[1]}]


##7 Segment Display
 set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[7]}]
 set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[6]}]
 set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[5]}]
 set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[4]}]
 set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[3]}]
 set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[2]}]
 set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[1]}]
 set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports {o_fnd[0]}]

 set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {o_fnd_sel[0]}]
 set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports {o_fnd_sel[1]}]
 set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports {o_fnd_sel[2]}]
 set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports {o_fnd_sel[3]}]


##Buttons
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports {i_reset}]; # Center
# set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports {i_btn_u}]; # Up
# set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports {i_btn_l}]; # Left
# set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports {i_btn_r}]; # Right
# set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports {i_btn_d}]; # Down


##Pmod Header JA
# set_property -dict { PACKAGE_PIN J1   IOSTANDARD LVCMOS33} [get_ports {o_U_pos}];#Sch name = JA1
# set_property -dict { PACKAGE_PIN L2   IOSTANDARD LVCMOS33} [get_ports {o_U_neg}];#Sch name = JA2
# set_property -dict { PACKAGE_PIN J2   IOSTANDARD LVCMOS33} [get_ports {o_V_pos}];#Sch name = JA3
# set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33} [get_ports {o_V_neg}];#Sch name = JA4
# set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports {o_W_pos}];#Sch name = JA7
# set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports {o_W_neg}];#Sch name = JA8
# set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports {o_col[2]}];#Sch name = JA9
# set_property -dict { PACKAGE_PIN G3   IOSTANDARD LVCMOS33 } [get_ports {o_col[3]}];#Sch name = JA10

##Pmod Header JB
set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports {i_hall_state[0]}];#Sch name = JB1
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports {i_hall_state[1]}];#Sch name = JB2
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports {i_hall_state[2]}];#Sch name = JB3
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports {o_V_neg}];#Sch name = JB4
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports {U_PWM}];#Sch name = JB7
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports {V_PWM}];#Sch name = JB8
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports {W_PWM}];#Sch name = JB9
# set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports {}];#Sch name = JB10

##Pmod Header JC
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33}  [get_ports {o_U_pos}];#Sch name = JC1
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33}  [get_ports {o_U_neg}];#Sch name = JC2
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33}  [get_ports {o_V_pos}];#Sch name = JC3
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33}  [get_ports {o_V_neg}];#Sch name = JC4
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports {o_W_pos}];#Sch name = JC7
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports {o_W_neg}];#Sch name = JC8
# set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports {o_col[2]}];#Sch name = JC9
# set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports {o_col[3]}];#Sch name = JC10

##Pmod Header JXADC
 set_property -dict { PACKAGE_PIN J3   IOSTANDARD LVCMOS33 } [get_ports {vauxp6}];#Sch name = XA1_P;     #bank 35
# ##set_property -dict { PACKAGE_PIN L3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[1]}];#Sch name = XA2_P;  # bank 35
# ##set_property -dict { PACKAGE_PIN M2   IOSTANDARD LVCMOS33 } [get_ports {JXADC[2]}];#Sch name = XA3_P;  # bank 35
# set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS33 } [get_ports {vauxp15}];#Sch name = XA4_P;  # bank 35
 set_property -dict { PACKAGE_PIN K3   IOSTANDARD LVCMOS33 } [get_ports {vauxn6}];#Sch name = XA1_N  ;   # bank 35    
# ##set_property -dict { PACKAGE_PIN M3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[5]}];#Sch name = XA2_N;  # bank 35
# ##set_property -dict { PACKAGE_PIN M1   IOSTANDARD LVCMOS33 } [get_ports {JXADC[6]}];#Sch name = XA3_N; # bank 35
# set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS33 } [get_ports {vauxn15}];#Sch name = XA4_N; # bank 35


##VGA Connector
#set_property -dict { PACKAGE_PIN G19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[0]}]
#set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[1]}]
#set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[2]}]
#set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[3]}]
#set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[0]}]
#set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[1]}]
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[2]}]
#set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[3]}]
#set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[0]}]
#set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[1]}]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[2]}]
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[3]}]
#set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports Hsync]
#set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports Vsync]


##USB-RS232 Interface
# set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports i_rx]
# set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports o_tx]


##USB HID (PS/2)
#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33   PULLUP true } [get_ports PS2Clk]
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33   PULLUP true } [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[0]}]
#set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[1]}]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[2]}]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[3]}]
#set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports QspiCSn]


## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

## SPI configuration mode options for QSPI boot, can be used for all designs
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
