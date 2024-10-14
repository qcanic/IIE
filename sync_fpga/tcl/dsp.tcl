##################################################################
# CHECK IPs
##################################################################

set bCheckIPs 1
set bCheckIPsPassed 1
if { $bCheckIPs == 1 } {
  set list_check_ips { xilinx.com:ip:mult_gen:12.0 }
  set list_ips_missing ""
  common::send_msg_id "IPS_TCL-1001" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

  foreach ip_vlnv $list_check_ips {
  set ip_obj [get_ipdefs -all $ip_vlnv]
  if { $ip_obj eq "" } {
    lappend list_ips_missing $ip_vlnv
    }
  }

  if { $list_ips_missing ne "" } {
    catch {common::send_msg_id "IPS_TCL-105" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
    set bCheckIPsPassed 0
  }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "IPS_TCL-102" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 1
}

##################################################################
# CREATE IP IntMult_32_32_DSP_P3
##################################################################

set IntMult_32_32_DSP_P3 [create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name IntMult_32_32_DSP_P3]

# User Parameters
set_property -dict [list \
  CONFIG.ClockEnable {false} \
  CONFIG.Multiplier_Construction {Use_Mults} \
  CONFIG.PipeStages {3} \
  CONFIG.PortAType {Unsigned} \
  CONFIG.PortAWidth {32} \
  CONFIG.PortBType {Unsigned} \
  CONFIG.PortBWidth {32} \
] [get_ips IntMult_32_32_DSP_P3]

# Runtime Parameters
set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {0}
} $IntMult_32_32_DSP_P3

##################################################################

##################################################################
# CREATE IP IntMult_33_32_DSP_P3
##################################################################

set IntMult_33_32_DSP_P3 [create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name IntMult_33_32_DSP_P3]

# User Parameters
set_property -dict [list \
  CONFIG.ClockEnable {false} \
  CONFIG.Multiplier_Construction {Use_Mults} \
  CONFIG.PipeStages {3} \
  CONFIG.PortAType {Unsigned} \
  CONFIG.PortAWidth {33} \
  CONFIG.PortBType {Unsigned} \
  CONFIG.PortBWidth {32} \
] [get_ips IntMult_33_32_DSP_P3]

# Runtime Parameters
set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {0}
} $IntMult_33_32_DSP_P3

##################################################################

##################################################################
# CREATE IP IntMult_34_32_DSP_P3
##################################################################

set IntMult_34_32_DSP_P3 [create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name IntMult_34_32_DSP_P3]

# User Parameters
set_property -dict [list \
  CONFIG.ClockEnable {false} \
  CONFIG.Multiplier_Construction {Use_Mults} \
  CONFIG.PipeStages {3} \
  CONFIG.PortAType {Unsigned} \
  CONFIG.PortAWidth {34} \
  CONFIG.PortBType {Unsigned} \
  CONFIG.PortBWidth {32} \
] [get_ips IntMult_34_32_DSP_P3]

# Runtime Parameters
set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {0}
} $IntMult_34_32_DSP_P3

##################################################################

##################################################################
# CREATE IP IntMult_13_12_DSP_P3
##################################################################

set IntMult_13_12_DSP_P3 [create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name IntMult_13_12_DSP_P3]

# User Parameters
set_property -dict [list \
  CONFIG.ClockEnable {false} \
  CONFIG.Multiplier_Construction {Use_Mults} \
  CONFIG.PipeStages {3} \
  CONFIG.PortAType {Unsigned} \
  CONFIG.PortAWidth {13} \
  CONFIG.PortBType {Unsigned} \
  CONFIG.PortBWidth {12} \
] [get_ips IntMult_13_12_DSP_P3]

# Runtime Parameters
set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {0}
} $IntMult_13_12_DSP_P3

##################################################################


##################################################################
# CREATE IP IntMult_18_17_DSP_P3
##################################################################

set IntMult_18_17_DSP_P3 [create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name IntMult_18_17_DSP_P3]

# User Parameters
set_property -dict [list \
  CONFIG.ClockEnable {false} \
  CONFIG.Multiplier_Construction {Use_Mults} \
  CONFIG.PipeStages {3} \
  CONFIG.PortAType {Unsigned} \
  CONFIG.PortAWidth {18} \
  CONFIG.PortBType {Unsigned} \
  CONFIG.PortBWidth {17} \
] [get_ips IntMult_18_17_DSP_P3]

# Runtime Parameters
set_property -dict { 
  GENERATE_SYNTH_CHECKPOINT {0}
} $IntMult_18_17_DSP_P3

##################################################################

