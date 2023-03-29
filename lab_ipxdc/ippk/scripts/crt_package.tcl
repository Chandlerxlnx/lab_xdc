#-----------------------------------------------------------
# Vivado v2022.2 (64-bit)
# SW Build 3671981 on Fri Oct 14 04:59:54 MDT 2022
# IP Build 3669848 on Fri Oct 14 08:30:02 MDT 2022
# Start of session at: Wed Mar 29 01:22:18 2023
# Process ID: 80141
# Current directory: .
# Command line: vivado
# Log file: ./vivado.log
# Journal file: ./vivado.jou
# Running On: xcoapps65, OS: Linux, CPU Frequency: 1277.770 MHz, CPU Physical cores: 24, Host memory: 540755 MB
#-----------------------------------------------------------
create_project -force proj_pack ./proj_pack -part xc7s25csga225-2

#create_fileset sources_1
add_files -fileset sources_1 {./src}
update_compile_order -fileset sources_1
set_property USED_IN_IMPLEMENTATION 0 [get_files -all sync_ff_tb.v]
set_property USED_IN_SYNTHESIS 0 [get_files -all sync_ff_tb.v]
update_compile_order -fileset sources_1
add_files -fileset  {constrs_1} {./src/constrs_1/}
set_property PROCESSING_ORDER LATE [get_files -all false_path.xdc]

###
ipx::package_project -root_dir . -vendor user.org -library user -taxonomy /UserIP
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
set_property  ip_repo_paths  . [current_project]
update_ip_catalog
ipx::check_integrity -quiet -xrt [ipx::current_core]
ipx::archive_core ./user.org_user_sync_ff_1.0.zip [ipx::current_core]

exit

