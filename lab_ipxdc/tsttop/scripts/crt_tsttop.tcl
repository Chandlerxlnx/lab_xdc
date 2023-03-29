
create_project -force proj_tsttop ./proj_tsttop -part xc7s25csga225-2
add_files -fileset sources_1 {./src/sources_1/tsttop.v}
update_compile_order -fileset sources_1
add_files -fileset constrs_1 {./src/constrs_1/top.xdc}
set_property  ip_repo_paths  ../user_repo [current_project]
update_ip_catalog
set_property dataflow_viewer_settings "min_width=16"   [current_fileset]
create_ip -name sync_ff -vendor user.org -library user -version 1.0 -module_name sync_ff_0
generate_target {instantiation_template} [get_files sync_ff_0.xci]
update_compile_order -fileset sources_1
generate_target all [get_files  sync_ff_0.xci]
export_ip_user_files -of_objects [get_files sync_ff_0.xci] -no_script -sync -force -quiet
launch_runs synth_1 -jobs 26
wait_on_run synth_1
open_run synth_1 -name synth_1
write_xdc -force ./recheck.xdc
