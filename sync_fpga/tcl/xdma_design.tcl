
################################################################
# This is a generated script based on design: xdma_design    
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
# source xdma_design_script.tcl

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
set design_name xdma_design    

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
xilinx.com:ip:axi_bram_ctrl:4.1\
xilinx.com:ip:axi_clock_converter:2.1\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:util_ds_buf:2.2\
xilinx.com:ip:xdma:4.1\
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
  set autom [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 autom ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $autom

  set cfg [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 cfg ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $cfg

  set core0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 core0 ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $core0

  set core1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 core1 ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $core1

  set core2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 core2 ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $core2

  set core3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 core3 ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $core3

  set instr [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 instr ]
  set_property -dict [ list \
   CONFIG.MASTER_TYPE {BRAM_CTRL} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   ] $instr

  set pci_express_x8 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x8 ]

  set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_refclk


  # Create ports
  set clk [ create_bd_port -dir I -type clk clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_RESET {rst_n} \
 ] $clk
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn
  set rst_n [ create_bd_port -dir I -type rst rst_n ]

  # Create instance: autom_bram, and set properties
  set autom_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 autom_bram ]
  set_property -dict [list \
    CONFIG.DATA_WIDTH {32} \
    CONFIG.PROTOCOL {AXI4} \
    CONFIG.SINGLE_PORT_BRAM {1} \
  ] $autom_bram


  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property CONFIG.SINGLE_PORT_BRAM {1} $axi_bram_ctrl_0


  # Create instance: axi_clock_converter_0, and set properties
  set axi_clock_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_0 ]

  # Create instance: core0_bram, and set properties
  set core0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 core0_bram ]
  set_property -dict [list \
    CONFIG.DATA_WIDTH {256} \
    CONFIG.PROTOCOL {AXI4} \
    CONFIG.SINGLE_PORT_BRAM {1} \
  ] $core0_bram


  # Create instance: core1_bram, and set properties
  set core1_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 core1_bram ]
  set_property -dict [list \
    CONFIG.DATA_WIDTH {256} \
    CONFIG.PROTOCOL {AXI4} \
    CONFIG.SINGLE_PORT_BRAM {1} \
  ] $core1_bram


  # Create instance: core2_bram, and set properties
  set core2_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 core2_bram ]
  set_property -dict [list \
    CONFIG.DATA_WIDTH {256} \
    CONFIG.PROTOCOL {AXI4} \
    CONFIG.SINGLE_PORT_BRAM {1} \
  ] $core2_bram


  # Create instance: core3_bram, and set properties
  set core3_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 core3_bram ]
  set_property -dict [list \
    CONFIG.DATA_WIDTH {256} \
    CONFIG.PROTOCOL {AXI4} \
    CONFIG.SINGLE_PORT_BRAM {1} \
  ] $core3_bram


  # Create instance: instr_bram, and set properties
  set instr_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 instr_bram ]
  set_property -dict [list \
    CONFIG.DATA_WIDTH {64} \
    CONFIG.PROTOCOL {AXI4} \
    CONFIG.SINGLE_PORT_BRAM {1} \
  ] $instr_bram


  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {1} \
    CONFIG.NUM_MI {7} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_0


  # Create instance: util_ds_buf, and set properties
  set util_ds_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf ]
  set_property -dict [list \
    CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {pcie_refclk} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $util_ds_buf


  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
  set_property -dict [list \
    CONFIG.PCIE_BOARD_INTERFACE {pci_express_x8} \
    CONFIG.SYS_RST_N_BOARD_INTERFACE {pcie_perstn} \
    CONFIG.mode_selection {Advanced} \
    CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
  ] $xdma_0


  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_ports cfg] [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_clock_converter_0_M_AXI [get_bd_intf_pins axi_clock_converter_0/M_AXI] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net instr_bram1_BRAM_PORTA [get_bd_intf_ports autom] [get_bd_intf_pins autom_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net instr_bram_BRAM_PORTA [get_bd_intf_ports instr] [get_bd_intf_pins instr_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net pcie_refclk_1 [get_bd_intf_ports pcie_refclk] [get_bd_intf_pins util_ds_buf/CLK_IN_D]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins core0_bram/S_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M01_AXI [get_bd_intf_pins core1_bram/S_AXI] [get_bd_intf_pins smartconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M02_AXI [get_bd_intf_pins core2_bram/S_AXI] [get_bd_intf_pins smartconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M03_AXI [get_bd_intf_pins core3_bram/S_AXI] [get_bd_intf_pins smartconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M04_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins smartconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M05_AXI [get_bd_intf_pins instr_bram/S_AXI] [get_bd_intf_pins smartconnect_0/M05_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M06_AXI [get_bd_intf_pins autom_bram/S_AXI] [get_bd_intf_pins smartconnect_0/M06_AXI]
  connect_bd_intf_net -intf_net uram_2_BRAM_PORTA [get_bd_intf_ports core0] [get_bd_intf_pins core0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net uram_2_BRAM_PORTA1 [get_bd_intf_ports core1] [get_bd_intf_pins core1_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net uram_2_BRAM_PORTA2 [get_bd_intf_ports core2] [get_bd_intf_pins core2_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net uram_2_BRAM_PORTA3 [get_bd_intf_ports core3] [get_bd_intf_pins core3_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins axi_clock_converter_0/S_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_ports pci_express_x8] [get_bd_intf_pins xdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net Net [get_bd_ports clk] [get_bd_pins autom_bram/s_axi_aclk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_clock_converter_0/m_axi_aclk] [get_bd_pins core0_bram/s_axi_aclk] [get_bd_pins core1_bram/s_axi_aclk] [get_bd_pins core2_bram/s_axi_aclk] [get_bd_pins core3_bram/s_axi_aclk] [get_bd_pins instr_bram/s_axi_aclk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net pcie_perstn_1 [get_bd_ports pcie_perstn] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net rstn_0_1 [get_bd_ports rst_n] [get_bd_pins autom_bram/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_clock_converter_0/m_axi_aresetn] [get_bd_pins core0_bram/s_axi_aresetn] [get_bd_pins core1_bram/s_axi_aresetn] [get_bd_pins core2_bram/s_axi_aresetn] [get_bd_pins core3_bram/s_axi_aresetn] [get_bd_pins instr_bram/s_axi_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net util_ds_buf_IBUF_OUT [get_bd_pins util_ds_buf/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins axi_clock_converter_0/s_axi_aclk] [get_bd_pins xdma_0/axi_aclk]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins axi_clock_converter_0/s_axi_aresetn] [get_bd_pins xdma_0/axi_aresetn]

  # Create address segments
  assign_bd_address -offset 0xCC000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs autom_bram/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC0000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC2000000 -range 0x00080000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs instr_bram/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC4000000 -range 0x00400000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs core0_bram/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC6000000 -range 0x00400000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs core1_bram/S_AXI/Mem0] -force
  assign_bd_address -offset 0xC8000000 -range 0x00400000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs core2_bram/S_AXI/Mem0] -force
  assign_bd_address -offset 0xCA000000 -range 0x00400000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs core3_bram/S_AXI/Mem0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


