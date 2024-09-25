# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/zhenga6/CoCO/Studio0/Studio0.cache/wt [current_project]
set_property parent.project_path C:/Users/zhenga6/CoCO/Studio0/Studio0.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib C:/Users/zhenga6/CoCO/Studio0/Studio0.srcs/sources_1/new/Zheng_Andy_Studio1.vhd
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/zhenga6/CoCO/Studio0/Studio0.srcs/constrs_1/new/and_gate.xdc
set_property used_in_implementation false [get_files C:/Users/zhenga6/CoCO/Studio0/Studio0.srcs/constrs_1/new/and_gate.xdc]


synth_design -top Zheng_Andy_Studio1 -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Zheng_Andy_Studio1.dcp

catch { report_utilization -file Zheng_Andy_Studio1_utilization_synth.rpt -pb Zheng_Andy_Studio1_utilization_synth.pb }
