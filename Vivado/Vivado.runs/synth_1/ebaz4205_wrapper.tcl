# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.runs/synth_1/ebaz4205_wrapper.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

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
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param chipscope.maxJobs 4
set_param xicom.use_bs_reader 1
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.cache/wt [current_project]
set_property parent.project_path /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part miner.ebang.com.cn:ebaz4205:part0:1.0 [current_project]
set_property ip_repo_paths {
  /home/guido/GitHub/EBAZ4205_SDR_spectrum/IP_rgb2dvi
  /home/guido/GitHub/EBAZ4205_SDR_spectrum/IP_axi_dynclk
  /home/guido/GitHub/EBAZ4205_SDR_spectrum/IP_axis_capture
  /home/guido/GitHub/EBAZ4205_SDR_spectrum/IP_ps2_mouse
} [current_project]
update_ip_catalog
set_property ip_output_repo /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
add_files /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.srcs/sources_1/imports/EBAZ4205_SDR_HDMI/matlab/mycoefile.coe
add_files /home/guido/GitHub/EBAZ4205_SDR_HDMI_PS2/matlab/mycoefile.coe
read_verilog -library xil_defaultlib /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/hdl/ebaz4205_wrapper.v
add_files /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.srcs/sources_1/bd/ebaz4205/ebaz4205.bd
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_clk_wiz_0_0/ebaz4205_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_clk_wiz_0_0/ebaz4205_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_clk_wiz_0_0/ebaz4205_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_proc_sys_reset_0_0/ebaz4205_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_proc_sys_reset_0_0/ebaz4205_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_proc_sys_reset_0_0/ebaz4205_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_proc_sys_reset_0_1/ebaz4205_proc_sys_reset_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_proc_sys_reset_0_1/ebaz4205_proc_sys_reset_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_proc_sys_reset_0_1/ebaz4205_proc_sys_reset_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_processing_system7_0_0/ebaz4205_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ENET0_GMII_RX_CLK_0_100M_0/ebaz4205_rst_ENET0_GMII_RX_CLK_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ENET0_GMII_RX_CLK_0_100M_0/ebaz4205_rst_ENET0_GMII_RX_CLK_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ENET0_GMII_RX_CLK_0_100M_0/ebaz4205_rst_ENET0_GMII_RX_CLK_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ps7_0_140M_0/ebaz4205_rst_ps7_0_140M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ps7_0_140M_0/ebaz4205_rst_ps7_0_140M_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ps7_0_140M_0/ebaz4205_rst_ps7_0_140M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ps7_0_64M_0/ebaz4205_rst_ps7_0_64M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ps7_0_64M_0/ebaz4205_rst_ps7_0_64M_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_rst_ps7_0_64M_0/ebaz4205_rst_ps7_0_64M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_c_addsub_0_1/ebaz4205_c_addsub_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_dds_compiler_0_0/ebaz4205_dds_compiler_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_dds_compiler_0_2/ebaz4205_dds_compiler_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_gen_0_2/ebaz4205_mult_gen_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_1_0/ebaz4205_axi_gpio_1_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_1_0/ebaz4205_axi_gpio_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_1_0/ebaz4205_axi_gpio_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_RF_test_1MHz_0/ebaz4205_RF_test_1MHz_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_gen_0_0/ebaz4205_mult_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_sin_0/ebaz4205_mult_sin_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_c_addsub_0_0/ebaz4205_c_addsub_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_gen_0_1/ebaz4205_mult_gen_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_gen_1_0/ebaz4205_mult_gen_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_cic_compiler_0_0/ebaz4205_cic_compiler_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_fir_compiler_0_0/constraints/fir_compiler_v7_2.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_fir_compiler_0_0/ebaz4205_fir_compiler_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_1/ebaz4205_axi_gpio_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_1/ebaz4205_axi_gpio_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_1/ebaz4205_axi_gpio_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_vdma_0_0/ebaz4205_axi_vdma_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_vdma_0_0/ebaz4205_axi_vdma_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_vdma_0_0/ebaz4205_axi_vdma_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axis_subset_converter_0_0/ebaz4205_axis_subset_converter_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_v_tc_0_0/ebaz4205_v_tc_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_v_tc_0_0/ebaz4205_v_tc_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_v_axi4s_vid_out_0_1/ebaz4205_v_axi4s_vid_out_0_1_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_v_axi4s_vid_out_0_1/ebaz4205_v_axi4s_vid_out_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_2/ebaz4205_axi_gpio_0_2_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_2/ebaz4205_axi_gpio_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_2/ebaz4205_axi_gpio_0_2.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_xbar_0/ebaz4205_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_gen_0_4/ebaz4205_mult_gen_0_4_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_gen_1_1/ebaz4205_mult_gen_1_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_dds_compiler_0_3/ebaz4205_dds_compiler_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_cic_compiler_0_1/ebaz4205_cic_compiler_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_fir_compiler_0_1/constraints/fir_compiler_v7_2.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_fir_compiler_0_1/ebaz4205_fir_compiler_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_5/ebaz4205_axi_gpio_0_5_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_5/ebaz4205_axi_gpio_0_5_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_5/ebaz4205_axi_gpio_0_5.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_mult_gen_0_5/ebaz4205_mult_gen_0_5_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_4/ebaz4205_axi_gpio_0_4_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_4/ebaz4205_axi_gpio_0_4_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_4/ebaz4205_axi_gpio_0_4.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_3/ebaz4205_axi_gpio_0_3_board.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_3/ebaz4205_axi_gpio_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_axi_gpio_0_3/ebaz4205_axi_gpio_0_3.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_s00_regslice_0/ebaz4205_s00_regslice_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_s00_regslice_0/ebaz4205_s00_regslice_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_s00_data_fifo_0/ebaz4205_s00_data_fifo_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_s00_data_fifo_0/ebaz4205_s00_data_fifo_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_s00_data_fifo_0/ebaz4205_s00_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_auto_pc_0/ebaz4205_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ip/ebaz4205_auto_pc_1/ebaz4205_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.gen/sources_1/bd/ebaz4205/ebaz4205_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.srcs/constrs_1/imports/new/ebaz4205.xdc
set_property used_in_implementation false [get_files /home/guido/GitHub/EBAZ4205_SDR_spectrum/Vivado/Vivado.srcs/constrs_1/imports/new/ebaz4205.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -incremental /home/guido/GitHub/EBAZ4205_HDMI/Vivado/Vivado.srcs/utils_1/imports/synth_1/ebaz4205_wrapper.dcp
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top ebaz4205_wrapper -part xc7z010clg400-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ebaz4205_wrapper.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file ebaz4205_wrapper_utilization_synth.rpt -pb ebaz4205_wrapper_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }