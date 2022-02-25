new_design -name "noelvmp" -family ""
set_device -die "" -package " " -speed "" -voltage "" -iostd "LVTTL" -jtag "yes" -probe "yes" -trst "yes" -temprange "" -voltrange ""
if {[file exist noelvmp.pdc]} {
import_source -format "edif" -edif_flavor "GENERIC" -merge_physical "no" -merge_timing "no" {synplify/noelvmp.edf} -format "pdc" -abort_on_error "no" {noelvmp.pdc}
} else {
import_source -format "edif" -edif_flavor "GENERIC" -merge_physical "no" -merge_timing "no" {synplify/noelvmp.edf}
}

save_design  {noelvmp.adb}

