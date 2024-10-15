##################################################################
# CREATE IP FIFO_Builtin_ASYN_W256D512_F500E0_R200W215
##################################################################

set FIFO_Builtin_ASYN_W256D512_F500E0_R200W215 [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name FIFO_Builtin_ASYN_W256D512_F500E0_R200W215]

# User Parameters
set_property -dict [list \
  CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
  CONFIG.Full_Threshold_Assert_Value {500} \
  CONFIG.Input_Data_Width {256} \
  CONFIG.Input_Depth {512} \
  CONFIG.Performance_Options {First_Word_Fall_Through} \
  CONFIG.Programmable_Full_Type {Single_Programmable_Full_Threshold_Constant} \
  CONFIG.Read_Clock_Frequency {200} \
  CONFIG.Use_Embedded_Registers {false} \
  CONFIG.Valid_Flag {true} \
  CONFIG.Write_Clock_Frequency {215} \
] [get_ips FIFO_Builtin_ASYN_W256D512_F500E0_R200W215]

# Runtime Parameters
set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $FIFO_Builtin_ASYN_W256D512_F500E0_R200W215

##################################################################

##################################################################
# CREATE IP FIFO_Builtin_ASYN_W256D512_F500E0_R215W200
##################################################################

set FIFO_Builtin_ASYN_W256D512_F500E0_R215W200 [create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name FIFO_Builtin_ASYN_W256D512_F500E0_R215W200]

# User Parameters
set_property -dict [list \
  CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
  CONFIG.Full_Threshold_Assert_Value {500} \
  CONFIG.Input_Data_Width {256} \
  CONFIG.Input_Depth {512} \
  CONFIG.Performance_Options {First_Word_Fall_Through} \
  CONFIG.Programmable_Full_Type {Single_Programmable_Full_Threshold_Constant} \
  CONFIG.Read_Clock_Frequency {215} \
  CONFIG.Use_Embedded_Registers {false} \
  CONFIG.Valid_Flag {true} \
  CONFIG.Write_Clock_Frequency {200} \
] [get_ips FIFO_Builtin_ASYN_W256D512_F500E0_R215W200]

# Runtime Parameters
set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {1}
} $FIFO_Builtin_ASYN_W256D512_F500E0_R215W200