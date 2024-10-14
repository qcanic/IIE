set base_dir "./"
set inc_dir "../../include"
set src_dir "../../srcs"

set TOP_NAME    [lindex $argv 0] 
set CLK_FREQ    [lindex $argv 1]
set CORE_NUM    [lindex $argv 2]

#part info
set device          xcu280
set package         fsvh2892
set speed           2L
set temperature     e
set part            $device-$package-$speed-$temperature
set project_name    ${TOP_NAME}_${CORE_NUM}_${device}_${CLK_FREQ}
puts $part
puts $project_name

set proj_dir $base_dir/project
puts $proj_dir
# Create project
create_project $project_name $proj_dir/$project_name -part $part -force
set obj [current_project]
set_property -name "board_part" -value "xilinx.com:au280:part0:1.1" -objects $obj
set_property -name "platform.board_id" -value "au280" -objects $obj


# Set the directory path for the new project


# Set project properties
set obj [get_projects $project_name]
set_property "default_lib" "xil_defaultlib" $obj
set_property "simulator_language" "Mixed" $obj


add_files	[glob $inc_dir/*.vh]

# Add Top_RTL and other rtls and ips and.vh
add_files	[glob $src_dir/cb/*.v]
add_files	[glob $src_dir/cb/autom/*.v]
add_files	[glob $src_dir/cb/core/*.v]
add_files	[glob $src_dir/cb/exec/*.v]
add_files	[glob $src_dir/cb/mod/*.v]
add_files	[glob $src_dir/cb/ntt/*.v]
add_files	[glob $src_dir/utils/*.v]
add_files	[glob $src_dir/utils/fifo/*.v]
add_files	[glob $src_dir/utils/sram/*.v]


# add fpga srcs and include
add_files   [glob $base_dir/srcs/${TOP_NAME}_${CORE_NUM}.v]
add_files   [glob $base_dir/include/*.vh]

update_compile_order -fileset sources_1

# Add aurora ip
add_files   [glob $base_dir/srcs/aurora/*.v]
add_files   [glob $base_dir/srcs/aurora/ip/*.xci]
add_files   [glob $base_dir/srcs/aurora/src/*.v]
add_files   [glob $base_dir/srcs/aurora/src/shared_logic/*.v]

# add basic ip: clk_wiz
source $base_dir/tcl/clk_wiz_${CLK_FREQ}.tcl
source $base_dir/tcl/vio_0.tcl
source $base_dir/tcl/dsp.tcl
source $base_dir/tcl/fifo.tcl
source $base_dir/tcl/bram.tcl
source $base_dir/tcl/hbm_design_${CORE_NUM}.tcl


update_compile_order -fileset sources_1


# Add constraint files and set target xdc
add_files -fileset constrs_1 [glob $base_dir/xdc/${TOP_NAME}.xdc]
add_files -fileset constrs_1 [glob $base_dir/xdc/debug.xdc]
set_property target_constrs_file $base_dir/xdc/${TOP_NAME}.xdc [current_fileset -constrset]

# Set Top Module
set_property top ${TOP_NAME}_${CORE_NUM} [current_fileset]

# Set Syn & Imp constaints
# set_property strategy Performance_BalanceSLLs [get_runs impl_1]
# set_property -name {STEPS.OPT_DESIGN.ARGS.MORE OPTIONS} -value -retarget -objects [get_runs impl_1]

update_compile_order -fileset sources_1

# start_gui

launch_runs impl_1 -to_step write_bitstream -jobs 112
