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
create_project proj_pack ./proj_pack -part xc7s25csga225-2
add_files -fileset source_1 {.src}
update_compile_order -fileset sources_1
add_files -fileset constrs_1 -norecurse {./src/constrs_1/new/false_path.xdc}

if 0 {
ipx::package_project -root_dir . -vendor user.org -library user -taxonomy /UserIP
set_property dataflow_viewer_settings "min_width=16"   [current_fileset]
ipx::merge_project_changes compatibility [ipx::current_core]
set_property supported_families {spartan7 Production artix7 Beta artix7l Beta artixuplus Beta qartix7 Beta qkintex7 Beta qkintex7l Beta kintexu Beta kintexuplus Beta versal Beta qvirtex7 Beta virtexuplus Beta virtexuplusHBM Beta qzynq Beta zynquplus Beta kintex7 Beta kintex7l Beta spartan7 Beta virtex7 Beta virtexu Beta virtexuplus58g Beta aartix7 Beta akintex7 Beta aspartan7 Beta azynq Beta zynq Beta} [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::check_integrity -quiet -xrt [ipx::current_core]
ipx::archive_core ./user.org_user_sync_ff_1.0.zip [ipx::current_core]
}
