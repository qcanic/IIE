
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2022.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcu280-fsvh2892-2L-e
   set_property BOARD_PART xilinx.com:au280:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:aurora_64b66b:12.0\
xilinx.com:ip:fifo_generator:13.2\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set rxn_0 [ create_bd_port -dir I -from 0 -to 3 rxn_0 ]
  set rxp_0 [ create_bd_port -dir I -from 0 -to 3 rxp_0 ]
  set txn_0 [ create_bd_port -dir O -from 0 -to 3 txn_0 ]
  set txp_0 [ create_bd_port -dir O -from 0 -to 3 txp_0 ]
  set user_clk [ create_bd_port -dir I user_clk ]

  # Create instance: aurora_64b66b_0, and set properties
  set aurora_64b66b_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:12.0 aurora_64b66b_0 ]
  set_property -dict [list \
    CONFIG.C_AURORA_LANES {4} \
    CONFIG.C_INIT_CLK {50} \
    CONFIG.C_LINE_RATE {25} \
    CONFIG.SupportLevel {0} \
    CONFIG.drp_mode {Disabled} \
    CONFIG.interface_mode {Streaming} \
  ] $aurora_64b66b_0


  # Create instance: fifo_generator_0, and set properties
  set fifo_generator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0 ]
  set_property -dict [list \
    CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
    CONFIG.Performance_Options {First_Word_Fall_Through} \
  ] $fifo_generator_0


  # Create instance: fifo_generator_1, and set properties
  set fifo_generator_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_1 ]
  set_property -dict [list \
    CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
    CONFIG.Input_Data_Width {512} \
    CONFIG.Performance_Options {First_Word_Fall_Through} \
    CONFIG.Valid_Flag {true} \
  ] $fifo_generator_1


  # Create port connections
  connect_bd_net -net aurora_64b66b_0_m_axi_rx_tdata [get_bd_pins aurora_64b66b_0/m_axi_rx_tdata] [get_bd_pins fifo_generator_0/din]
  connect_bd_net -net aurora_64b66b_0_m_axi_rx_tvalid [get_bd_pins aurora_64b66b_0/m_axi_rx_tvalid] [get_bd_pins fifo_generator_0/wr_en]
  connect_bd_net -net aurora_64b66b_0_s_axi_tx_tready [get_bd_pins aurora_64b66b_0/s_axi_tx_tready] [get_bd_pins fifo_generator_1/rd_en]
  connect_bd_net -net aurora_64b66b_0_tx_out_clk [get_bd_pins aurora_64b66b_0/tx_out_clk] [get_bd_pins fifo_generator_0/wr_clk]
  connect_bd_net -net aurora_64b66b_0_txn [get_bd_ports txn_0] [get_bd_pins aurora_64b66b_0/txn]
  connect_bd_net -net aurora_64b66b_0_txp [get_bd_ports txp_0] [get_bd_pins aurora_64b66b_0/txp]
  connect_bd_net -net fifo_generator_1_dout [get_bd_pins aurora_64b66b_0/s_axi_tx_tdata] [get_bd_pins fifo_generator_1/dout]
  connect_bd_net -net fifo_generator_1_valid [get_bd_pins aurora_64b66b_0/s_axi_tx_tvalid] [get_bd_pins fifo_generator_1/valid]
  connect_bd_net -net rxn_0_1 [get_bd_ports rxn_0] [get_bd_pins aurora_64b66b_0/rxn]
  connect_bd_net -net rxp_0_1 [get_bd_ports rxp_0] [get_bd_pins aurora_64b66b_0/rxp]
  connect_bd_net -net user_clk_1 [get_bd_ports user_clk] [get_bd_pins aurora_64b66b_0/user_clk]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


common::send_gid_msg -ssname BD::TCL -id 2053 -severity "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

