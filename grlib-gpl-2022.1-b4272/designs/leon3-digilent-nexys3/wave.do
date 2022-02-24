onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /testbench/clk
add wave -noupdate -format Logic /testbench/rst
add wave -noupdate -format Logic /testbench/d3/btn
add wave -noupdate -format Logic /testbench/d3/rstn
add wave -noupdate -format Logic /testbench/rstn1
add wave -noupdate -format Logic /testbench/rstn2
add wave -noupdate -format Logic /testbench/error
add wave -noupdate -format Literal /testbench/address
add wave -noupdate -format Literal /testbench/data
add wave -noupdate -format Logic /testbench/oen
add wave -noupdate -format Logic /testbench/writen
add wave -noupdate -format Logic /testbench/iosn
add wave -noupdate -format Logic /testbench/dsubre
add wave -noupdate -format Logic /testbench/dsurx
add wave -noupdate -format Logic /testbench/dsutx
add wave -noupdate -format Logic /testbench/urxd
add wave -noupdate -format Logic /testbench/utxd
add wave -noupdate -format Logic /testbench/etx_clk
add wave -noupdate -format Logic /testbench/erx_clk
add wave -noupdate -format Literal /testbench/erxdt
add wave -noupdate -format Logic /testbench/erx_dv
add wave -noupdate -format Logic /testbench/erx_er
add wave -noupdate -format Logic /testbench/erx_col
add wave -noupdate -format Logic /testbench/erx_crs
add wave -noupdate -format Literal /testbench/etxdt
add wave -noupdate -format Logic /testbench/etx_en
add wave -noupdate -format Logic /testbench/etx_er
add wave -noupdate -format Logic /testbench/emdc
add wave -noupdate -format Logic /testbench/emdio
add wave -noupdate -format Logic /testbench/spi_sel_n
add wave -noupdate -format Logic /testbench/spi_clk
add wave -noupdate -format Logic /testbench/spi_mosi
add wave -noupdate -format Literal /testbench/led
add wave -noupdate -format Logic /testbench/brdyn
add wave -noupdate -divider {CPU 1}
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/apbi
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/apbo
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/ahbsi
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/ahbso
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/ahbmi
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/ahbmo
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/address
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/data 
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/memi 
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/memo 

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {141151108 ps} 0}
configure wave -namecolwidth 234
configure wave -valuecolwidth 77
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {525 us}
