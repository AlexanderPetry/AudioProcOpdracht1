# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\PatrickKenis\AudioProccesing\LAB2_Delay\Taak1\AudioProcessing21\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\PatrickKenis\AudioProccesing\LAB2_Delay\Taak1\AudioProcessing21\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {AudioProcessing21}\
-hw {C:\Users\PatrickKenis\Downloads\AudioProcessing21.xsa}\
-out {C:/Users/PatrickKenis/AudioProccesing/LAB2_Delay/Taak1}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {zynq_fsbl}
platform generate -domains 
platform active {AudioProcessing21}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
