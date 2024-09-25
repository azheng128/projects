# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/zhenga6/CoCO/Studio3Final/Studio3Final.cache/wt [current_project]
set_property parent.project_path C:/Users/zhenga6/CoCO/Studio3Final/Studio3Final.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/zhenga6/Downloads/Display_driver.vhd
  C:/Users/zhenga6/CoCO/Studio3Final/Studio3Final.srcs/sources_1/new/bit_full_adder.vhd
  C:/Users/zhenga6/Downloads/LEDdisplay.vhd
  C:/Users/zhenga6/CoCO/Studio3Final/Studio3Final.srcs/sources_1/new/toplevel.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/zhenga6/CoCO/Studio3Final/Studio3Final.srcs/constrs_1/new/topconstrainst.xdc
set_property used_in_implementation false [get_files C:/Users/zhenga6/CoCO/Studio3Final/Studio3Final.srcs/constrs_1/new/topconstrainst.xdc]


synth_design -top toplevel -part xc7a35tcpg236-1


write_checkpoint -force -noxdef toplevel.dcp

catch { report_utilization -file toplevel_utilization_synth.rpt -pb toplevel_utilization_synth.pb }
