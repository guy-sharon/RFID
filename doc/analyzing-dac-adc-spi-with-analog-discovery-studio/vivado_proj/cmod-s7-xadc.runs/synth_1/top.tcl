# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 3
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7s25csga225-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Playground/cmod-s7-xadc/cmod-s7-xadc.cache/wt [current_project]
set_property parent.project_path D:/Playground/cmod-s7-xadc/cmod-s7-xadc.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {D:/Github/vivado-boards/new/board_files} [current_project]
set_property board_part digilentinc.com:cmod-s7-25:part0:1.0 [current_project]
set_property ip_output_repo d:/Playground/cmod-s7-xadc/cmod-s7-xadc.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/new/spi.v
  D:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/new/xadc.v
  D:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/new/top.v
  D:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/new/axis_components.v
}
read_ip -quiet d:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xci
set_property used_in_implementation false [get_files -all d:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xdc]

read_ip -quiet d:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all d:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all d:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/constrs_1/imports/digilent-xdc/Cmod-S7-25-Master.xdc
set_property used_in_implementation false [get_files D:/Playground/cmod-s7-xadc/cmod-s7-xadc.srcs/constrs_1/imports/digilent-xdc/Cmod-S7-25-Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7s25csga225-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
