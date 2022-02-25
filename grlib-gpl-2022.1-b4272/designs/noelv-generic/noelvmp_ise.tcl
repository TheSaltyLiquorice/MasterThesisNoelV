project new noelvmp.ise
project set family ""
project set device 
project set speed 
project set package 
puts "Adding files to project"
lib_vhdl new grlib
xfile add "./../../lib/grlib/stdlib/version.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/stdlib/version.vhd"
xfile add "./../../lib/grlib/stdlib/config_types.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/stdlib/config_types.vhd"
xfile add "./grlib_config.vhd" -lib_vhdl grlib
puts "./grlib_config.vhd"
xfile add "./../../lib/grlib/stdlib/stdlib.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/stdlib/stdlib.vhd"
xfile add "./../../lib/grlib/sparc/sparc.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/sparc/sparc.vhd"
xfile add "./../../lib/grlib/riscv/riscv.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/riscv/riscv.vhd"
xfile add "./../../lib/grlib/modgen/multlib.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/modgen/multlib.vhd"
xfile add "./../../lib/grlib/modgen/leaves.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/modgen/leaves.vhd"
xfile add "./../../lib/grlib/amba/amba.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/amba.vhd"
xfile add "./../../lib/grlib/amba/devices.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/devices.vhd"
xfile add "./../../lib/grlib/amba/defmst.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/defmst.vhd"
xfile add "./../../lib/grlib/amba/apbctrl.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/apbctrl.vhd"
xfile add "./../../lib/grlib/amba/apbctrlx.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/apbctrlx.vhd"
xfile add "./../../lib/grlib/amba/apbctrlsp.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/apbctrlsp.vhd"
xfile add "./../../lib/grlib/amba/apbctrldp.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/apbctrldp.vhd"
xfile add "./../../lib/grlib/amba/apbctrl3p.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/apbctrl3p.vhd"
xfile add "./../../lib/grlib/amba/apbctrl4p.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/apbctrl4p.vhd"
xfile add "./../../lib/grlib/amba/ahbctrl.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/ahbctrl.vhd"
xfile add "./../../lib/grlib/amba/dma2ahb_pkg.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/dma2ahb_pkg.vhd"
xfile add "./../../lib/grlib/amba/dma2ahb.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/dma2ahb.vhd"
xfile add "./../../lib/grlib/amba/ahbmst.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/ahbmst.vhd"
xfile add "./../../lib/grlib/amba/ahblitm2ahbm.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/amba/ahblitm2ahbm.vhd"
xfile add "./../../lib/grlib/dftlib/dftlib.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/dftlib/dftlib.vhd"
xfile add "./../../lib/grlib/dftlib/trstmux.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/dftlib/trstmux.vhd"
xfile add "./../../lib/grlib/dftlib/synciotest.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/dftlib/synciotest.vhd"
xfile add "./../../lib/grlib/generic_bm/generic_bm_pkg.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/generic_bm_pkg.vhd"
xfile add "./../../lib/grlib/generic_bm/ahb_be.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/ahb_be.vhd"
xfile add "./../../lib/grlib/generic_bm/axi4_be.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/axi4_be.vhd"
xfile add "./../../lib/grlib/generic_bm/bmahbmst.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/bmahbmst.vhd"
xfile add "./../../lib/grlib/generic_bm/bm_fre.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/bm_fre.vhd"
xfile add "./../../lib/grlib/generic_bm/bm_me_rc.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/bm_me_rc.vhd"
xfile add "./../../lib/grlib/generic_bm/bm_me_wc.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/bm_me_wc.vhd"
xfile add "./../../lib/grlib/generic_bm/fifo_control_rc.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/fifo_control_rc.vhd"
xfile add "./../../lib/grlib/generic_bm/fifo_control_wc.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/fifo_control_wc.vhd"
xfile add "./../../lib/grlib/generic_bm/generic_bm_ahb.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/generic_bm_ahb.vhd"
xfile add "./../../lib/grlib/generic_bm/generic_bm_axi.vhd" -lib_vhdl grlib
puts "./../../lib/grlib/generic_bm/generic_bm_axi.vhd"
lib_vhdl new techmap
xfile add "./../../lib/techmap/gencomp/gencomp.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/gencomp/gencomp.vhd"
xfile add "./../../lib/techmap/gencomp/netcomp.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/gencomp/netcomp.vhd"
xfile add "./../../lib/techmap/alltech/allclkgen.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/alltech/allclkgen.vhd"
xfile add "./../../lib/techmap/alltech/allddr.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/alltech/allddr.vhd"
xfile add "./../../lib/techmap/alltech/allmem.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/alltech/allmem.vhd"
xfile add "./../../lib/techmap/alltech/allmul.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/alltech/allmul.vhd"
xfile add "./../../lib/techmap/alltech/allpads.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/alltech/allpads.vhd"
xfile add "./../../lib/techmap/alltech/alltap.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/alltech/alltap.vhd"
xfile add "./../../lib/techmap/inferred/memory_inferred.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/inferred/memory_inferred.vhd"
xfile add "./../../lib/techmap/inferred/ddr_inferred.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/inferred/ddr_inferred.vhd"
xfile add "./../../lib/techmap/inferred/mul_inferred.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/inferred/mul_inferred.vhd"
xfile add "./../../lib/techmap/inferred/ddr_phy_inferred.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/inferred/ddr_phy_inferred.vhd"
xfile add "./../../lib/techmap/inferred/ddrphy_datapath.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/inferred/ddrphy_datapath.vhd"
xfile add "./../../lib/techmap/inferred/fifo_inferred.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/inferred/fifo_inferred.vhd"
xfile add "./../../lib/techmap/maps/techbuf.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/techbuf.vhd"
xfile add "./../../lib/techmap/maps/clkgen.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/clkgen.vhd"
xfile add "./../../lib/techmap/maps/clkmux.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/clkmux.vhd"
xfile add "./../../lib/techmap/maps/clkinv.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/clkinv.vhd"
xfile add "./../../lib/techmap/maps/clkand.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/clkand.vhd"
xfile add "./../../lib/techmap/maps/grgates.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/grgates.vhd"
xfile add "./../../lib/techmap/maps/ddr_ireg.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/ddr_ireg.vhd"
xfile add "./../../lib/techmap/maps/ddr_oreg.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/ddr_oreg.vhd"
xfile add "./../../lib/techmap/maps/clkpad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/clkpad.vhd"
xfile add "./../../lib/techmap/maps/clkpad_ds.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/clkpad_ds.vhd"
xfile add "./../../lib/techmap/maps/inpad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/inpad.vhd"
xfile add "./../../lib/techmap/maps/inpad_ds.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/inpad_ds.vhd"
xfile add "./../../lib/techmap/maps/iodpad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/iodpad.vhd"
xfile add "./../../lib/techmap/maps/iopad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/iopad.vhd"
xfile add "./../../lib/techmap/maps/iopad_ds.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/iopad_ds.vhd"
xfile add "./../../lib/techmap/maps/lvds_combo.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/lvds_combo.vhd"
xfile add "./../../lib/techmap/maps/odpad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/odpad.vhd"
xfile add "./../../lib/techmap/maps/outpad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/outpad.vhd"
xfile add "./../../lib/techmap/maps/outpad_ds.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/outpad_ds.vhd"
xfile add "./../../lib/techmap/maps/toutpad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/toutpad.vhd"
xfile add "./../../lib/techmap/maps/toutpad_ds.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/toutpad_ds.vhd"
xfile add "./../../lib/techmap/maps/skew_outpad.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/skew_outpad.vhd"
xfile add "./../../lib/techmap/maps/ddrphy.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/ddrphy.vhd"
xfile add "./../../lib/techmap/maps/syncram.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram.vhd"
xfile add "./../../lib/techmap/maps/syncram64.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram64.vhd"
xfile add "./../../lib/techmap/maps/syncram_2p.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram_2p.vhd"
xfile add "./../../lib/techmap/maps/syncram_dp.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram_dp.vhd"
xfile add "./../../lib/techmap/maps/syncfifo_2p.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncfifo_2p.vhd"
xfile add "./../../lib/techmap/maps/regfile_3p.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/regfile_3p.vhd"
xfile add "./../../lib/techmap/maps/tap.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/tap.vhd"
xfile add "./../../lib/techmap/maps/nandtree.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/nandtree.vhd"
xfile add "./../../lib/techmap/maps/grlfpw_net.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/grlfpw_net.vhd"
xfile add "./../../lib/techmap/maps/grfpw_net.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/grfpw_net.vhd"
xfile add "./../../lib/techmap/maps/leon3_net.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/leon3_net.vhd"
xfile add "./../../lib/techmap/maps/leon4_net.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/leon4_net.vhd"
xfile add "./../../lib/techmap/maps/mul_61x61.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/mul_61x61.vhd"
xfile add "./../../lib/techmap/maps/cpu_disas_net.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/cpu_disas_net.vhd"
xfile add "./../../lib/techmap/maps/ringosc.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/ringosc.vhd"
xfile add "./../../lib/techmap/maps/grpci2_phy_net.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/grpci2_phy_net.vhd"
xfile add "./../../lib/techmap/maps/system_monitor.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/system_monitor.vhd"
xfile add "./../../lib/techmap/maps/inpad_ddr.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/inpad_ddr.vhd"
xfile add "./../../lib/techmap/maps/outpad_ddr.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/outpad_ddr.vhd"
xfile add "./../../lib/techmap/maps/iopad_ddr.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/iopad_ddr.vhd"
xfile add "./../../lib/techmap/maps/syncram128bw.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram128bw.vhd"
xfile add "./../../lib/techmap/maps/syncram256bw.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram256bw.vhd"
xfile add "./../../lib/techmap/maps/syncram128.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram128.vhd"
xfile add "./../../lib/techmap/maps/syncram156bw.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram156bw.vhd"
xfile add "./../../lib/techmap/maps/techmult.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/techmult.vhd"
xfile add "./../../lib/techmap/maps/spictrl_net.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/spictrl_net.vhd"
xfile add "./../../lib/techmap/maps/scanreg.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/scanreg.vhd"
xfile add "./../../lib/techmap/maps/syncrambw.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncrambw.vhd"
xfile add "./../../lib/techmap/maps/syncram_2pbw.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncram_2pbw.vhd"
xfile add "./../../lib/techmap/maps/sdram_phy.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/sdram_phy.vhd"
xfile add "./../../lib/techmap/maps/syncreg.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/syncreg.vhd"
xfile add "./../../lib/techmap/maps/serdes.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/serdes.vhd"
xfile add "./../../lib/techmap/maps/iopad_tm.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/iopad_tm.vhd"
xfile add "./../../lib/techmap/maps/toutpad_tm.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/toutpad_tm.vhd"
xfile add "./../../lib/techmap/maps/memrwcol.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/memrwcol.vhd"
xfile add "./../../lib/techmap/maps/cdcbus.vhd" -lib_vhdl techmap
puts "./../../lib/techmap/maps/cdcbus.vhd"
lib_vhdl new eth
xfile add "./../../lib/eth/comp/ethcomp.vhd" -lib_vhdl eth
puts "./../../lib/eth/comp/ethcomp.vhd"
xfile add "./../../lib/eth/core/greth_pkg.vhd" -lib_vhdl eth
puts "./../../lib/eth/core/greth_pkg.vhd"
xfile add "./../../lib/eth/core/eth_rstgen.vhd" -lib_vhdl eth
puts "./../../lib/eth/core/eth_rstgen.vhd"
xfile add "./../../lib/eth/core/eth_edcl_ahb_mst.vhd" -lib_vhdl eth
puts "./../../lib/eth/core/eth_edcl_ahb_mst.vhd"
xfile add "./../../lib/eth/core/eth_ahb_mst.vhd" -lib_vhdl eth
puts "./../../lib/eth/core/eth_ahb_mst.vhd"
xfile add "./../../lib/eth/core/greth_tx.vhd" -lib_vhdl eth
puts "./../../lib/eth/core/greth_tx.vhd"
xfile add "./../../lib/eth/core/greth_rx.vhd" -lib_vhdl eth
puts "./../../lib/eth/core/greth_rx.vhd"
xfile add "./../../lib/eth/core/grethc.vhd" -lib_vhdl eth
puts "./../../lib/eth/core/grethc.vhd"
xfile add "./../../lib/eth/wrapper/greth_gen.vhd" -lib_vhdl eth
puts "./../../lib/eth/wrapper/greth_gen.vhd"
lib_vhdl new opencores
xfile add "./../../lib/opencores/can/cancomp.vhd" -lib_vhdl opencores
puts "./../../lib/opencores/can/cancomp.vhd"
xfile add "./../../lib/opencores/can/can_top.vhd" -lib_vhdl opencores
puts "./../../lib/opencores/can/can_top.vhd"
xfile add "./../../lib/opencores/i2c/i2c_master_bit_ctrl.vhd" -lib_vhdl opencores
puts "./../../lib/opencores/i2c/i2c_master_bit_ctrl.vhd"
xfile add "./../../lib/opencores/i2c/i2c_master_byte_ctrl.vhd" -lib_vhdl opencores
puts "./../../lib/opencores/i2c/i2c_master_byte_ctrl.vhd"
xfile add "./../../lib/opencores/i2c/i2coc.vhd" -lib_vhdl opencores
puts "./../../lib/opencores/i2c/i2coc.vhd"
lib_vhdl new gaisler
xfile add "./../../lib/gaisler/arith/arith.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/arith/arith.vhd"
xfile add "./../../lib/gaisler/arith/mul32.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/arith/mul32.vhd"
xfile add "./../../lib/gaisler/arith/div32.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/arith/div32.vhd"
xfile add "./../../lib/gaisler/memctrl/memctrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/memctrl/memctrl.vhd"
xfile add "./../../lib/gaisler/memctrl/sdctrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/memctrl/sdctrl.vhd"
xfile add "./../../lib/gaisler/memctrl/sdctrl64.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/memctrl/sdctrl64.vhd"
xfile add "./../../lib/gaisler/memctrl/sdmctrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/memctrl/sdmctrl.vhd"
xfile add "./../../lib/gaisler/memctrl/srctrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/memctrl/srctrl.vhd"
xfile add "./../../lib/gaisler/srmmu/mmuconfig.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmuconfig.vhd"
xfile add "./../../lib/gaisler/srmmu/mmuiface.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmuiface.vhd"
xfile add "./../../lib/gaisler/srmmu/libmmu.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/libmmu.vhd"
xfile add "./../../lib/gaisler/srmmu/mmutlbcam.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmutlbcam.vhd"
xfile add "./../../lib/gaisler/srmmu/mmulrue.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmulrue.vhd"
xfile add "./../../lib/gaisler/srmmu/mmulru.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmulru.vhd"
xfile add "./../../lib/gaisler/srmmu/mmutlb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmutlb.vhd"
xfile add "./../../lib/gaisler/srmmu/mmutw.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmutw.vhd"
xfile add "./../../lib/gaisler/srmmu/mmu.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/srmmu/mmu.vhd"
xfile add "./../../lib/gaisler/leon3/leon3.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3/leon3.vhd"
xfile add "./../../lib/gaisler/leon3/grfpushwx.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3/grfpushwx.vhd"
xfile add "./../../lib/gaisler/leon3v3/tbufmem.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/tbufmem.vhd"
xfile add "./../../lib/gaisler/leon3v3/tbufmem_2p.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/tbufmem_2p.vhd"
xfile add "./../../lib/gaisler/leon3v3/dsu3x.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/dsu3x.vhd"
xfile add "./../../lib/gaisler/leon3v3/dsu3.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/dsu3.vhd"
xfile add "./../../lib/gaisler/leon3v3/dsu3_mb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/dsu3_mb.vhd"
xfile add "./../../lib/gaisler/leon3v3/libfpu.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/libfpu.vhd"
xfile add "./../../lib/gaisler/leon3v3/libiu.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/libiu.vhd"
xfile add "./../../lib/gaisler/leon3v3/libcache.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/libcache.vhd"
xfile add "./../../lib/gaisler/leon3v3/libleon3.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/libleon3.vhd"
xfile add "./../../lib/gaisler/leon3v3/regfile_3p_l3.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/regfile_3p_l3.vhd"
xfile add "./../../lib/gaisler/leon3v3/mmu_acache.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/mmu_acache.vhd"
xfile add "./../../lib/gaisler/leon3v3/mmu_icache.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/mmu_icache.vhd"
xfile add "./../../lib/gaisler/leon3v3/mmu_dcache.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/mmu_dcache.vhd"
xfile add "./../../lib/gaisler/leon3v3/cachemem.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/cachemem.vhd"
xfile add "./../../lib/gaisler/leon3v3/mmu_cache.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/mmu_cache.vhd"
xfile add "./../../lib/gaisler/leon3v3/grfpwx.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/grfpwx.vhd"
xfile add "./../../lib/gaisler/leon3v3/grlfpwx.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/grlfpwx.vhd"
xfile add "./../../lib/gaisler/leon3v3/iu3.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/iu3.vhd"
xfile add "./../../lib/gaisler/leon3v3/proc3.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/proc3.vhd"
xfile add "./../../lib/gaisler/leon3v3/grfpwxsh.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/grfpwxsh.vhd"
xfile add "./../../lib/gaisler/leon3v3/leon3x.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/leon3x.vhd"
xfile add "./../../lib/gaisler/leon3v3/leon3cg.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/leon3cg.vhd"
xfile add "./../../lib/gaisler/leon3v3/leon3s.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/leon3s.vhd"
xfile add "./../../lib/gaisler/leon3v3/leon3sh.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/leon3sh.vhd"
xfile add "./../../lib/gaisler/leon3v3/l3stat.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/l3stat.vhd"
xfile add "./../../lib/gaisler/leon3v3/cmvalidbits.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon3v3/cmvalidbits.vhd"
xfile add "./../../lib/gaisler/leon4/leon4.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/leon4/leon4.vhd"
xfile add "./../../lib/gaisler/l2cache/pkg/l2cache.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/l2cache/pkg/l2cache.vhd"
xfile add "./../../lib/gaisler/can/can.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/can/can.vhd"
xfile add "./../../lib/gaisler/can/can_mod.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/can/can_mod.vhd"
xfile add "./../../lib/gaisler/can/can_oc.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/can/can_oc.vhd"
xfile add "./../../lib/gaisler/can/can_mc.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/can/can_mc.vhd"
xfile add "./../../lib/gaisler/can/canmux.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/can/canmux.vhd"
xfile add "./../../lib/gaisler/can/can_rd.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/can/can_rd.vhd"
xfile add "./../../lib/gaisler/axi/axi.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/axi.vhd"
xfile add "./../../lib/gaisler/axi/ahbm2axi.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/ahbm2axi.vhd"
xfile add "./../../lib/gaisler/axi/ahbm2axi3.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/ahbm2axi3.vhd"
xfile add "./../../lib/gaisler/axi/ahbm2axi4.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/ahbm2axi4.vhd"
xfile add "./../../lib/gaisler/axi/axinullslv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/axinullslv.vhd"
xfile add "./../../lib/gaisler/axi/ahb2axib.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/ahb2axib.vhd"
xfile add "./../../lib/gaisler/axi/ahb2axi3b.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/ahb2axi3b.vhd"
xfile add "./../../lib/gaisler/axi/ahb2axi4b.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/ahb2axi4b.vhd"
xfile add "./../../lib/gaisler/axi/ahb2axi_l.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/axi/ahb2axi_l.vhd"
xfile add "./../../lib/gaisler/misc/misc.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/misc.vhd"
xfile add "./../../lib/gaisler/misc/rstgen.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/rstgen.vhd"
xfile add "./../../lib/gaisler/misc/gptimer.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/gptimer.vhd"
xfile add "./../../lib/gaisler/misc/ahbram.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbram.vhd"
xfile add "./../../lib/gaisler/misc/ahbdpram.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbdpram.vhd"
xfile add "./../../lib/gaisler/misc/ahbtrace_mmb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbtrace_mmb.vhd"
xfile add "./../../lib/gaisler/misc/ahbtrace_mb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbtrace_mb.vhd"
xfile add "./../../lib/gaisler/misc/ahbtrace.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbtrace.vhd"
xfile add "./../../lib/gaisler/misc/grgpio.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/grgpio.vhd"
xfile add "./../../lib/gaisler/misc/ahbstat.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbstat.vhd"
xfile add "./../../lib/gaisler/misc/logan.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/logan.vhd"
xfile add "./../../lib/gaisler/misc/apbps2.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/apbps2.vhd"
xfile add "./../../lib/gaisler/misc/charrom_package.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/charrom_package.vhd"
xfile add "./../../lib/gaisler/misc/charrom.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/charrom.vhd"
xfile add "./../../lib/gaisler/misc/apbvga.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/apbvga.vhd"
xfile add "./../../lib/gaisler/misc/svgactrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/svgactrl.vhd"
xfile add "./../../lib/gaisler/misc/grsysmon.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/grsysmon.vhd"
xfile add "./../../lib/gaisler/misc/gracectrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/gracectrl.vhd"
xfile add "./../../lib/gaisler/misc/grgpreg.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/grgpreg.vhd"
xfile add "./../../lib/gaisler/misc/ahb_mst_iface.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahb_mst_iface.vhd"
xfile add "./../../lib/gaisler/misc/grgprbank.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/grgprbank.vhd"
xfile add "./../../lib/gaisler/misc/grversion.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/grversion.vhd"
xfile add "./../../lib/gaisler/misc/apb3cdc.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/apb3cdc.vhd"
xfile add "./../../lib/gaisler/misc/ahbsmux.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbsmux.vhd"
xfile add "./../../lib/gaisler/misc/ahbmmux.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/ahbmmux.vhd"
xfile add "./../../lib/gaisler/misc/grtachom.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/misc/grtachom.vhd"
xfile add "./../../lib/gaisler/net/net.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/net/net.vhd"
xfile add "./../../lib/gaisler/uart/uart.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/uart/uart.vhd"
xfile add "./../../lib/gaisler/uart/libdcom.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/uart/libdcom.vhd"
xfile add "./../../lib/gaisler/uart/apbuart.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/uart/apbuart.vhd"
xfile add "./../../lib/gaisler/uart/dcom.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/uart/dcom.vhd"
xfile add "./../../lib/gaisler/uart/dcom_uart.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/uart/dcom_uart.vhd"
xfile add "./../../lib/gaisler/uart/ahbuart.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/uart/ahbuart.vhd"
xfile add "./../../lib/gaisler/jtag/jtag.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/jtag.vhd"
xfile add "./../../lib/gaisler/jtag/libjtagcom.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/libjtagcom.vhd"
xfile add "./../../lib/gaisler/jtag/jtagcom.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/jtagcom.vhd"
xfile add "./../../lib/gaisler/jtag/bscanregs.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/bscanregs.vhd"
xfile add "./../../lib/gaisler/jtag/bscanregsbd.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/bscanregsbd.vhd"
xfile add "./../../lib/gaisler/jtag/jtagcom2.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/jtagcom2.vhd"
xfile add "./../../lib/gaisler/jtag/ahbjtag.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/ahbjtag.vhd"
xfile add "./../../lib/gaisler/jtag/ahbjtag_bsd.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/ahbjtag_bsd.vhd"
xfile add "./../../lib/gaisler/jtag/jtagcomrv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/jtagcomrv.vhd"
xfile add "./../../lib/gaisler/jtag/ahbjtagrv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/jtag/ahbjtagrv.vhd"
xfile add "./../../lib/gaisler/greth/ethernet_mac.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/ethernet_mac.vhd"
xfile add "./../../lib/gaisler/greth/greth.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/greth.vhd"
xfile add "./../../lib/gaisler/greth/greth_mb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/greth_mb.vhd"
xfile add "./../../lib/gaisler/greth/greth_gbit.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/greth_gbit.vhd"
xfile add "./../../lib/gaisler/greth/greths.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/greths.vhd"
xfile add "./../../lib/gaisler/greth/greth_gbit_mb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/greth_gbit_mb.vhd"
xfile add "./../../lib/gaisler/greth/greths_mb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/greths_mb.vhd"
xfile add "./../../lib/gaisler/greth/grethm.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/grethm.vhd"
xfile add "./../../lib/gaisler/greth/grethm_mb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/grethm_mb.vhd"
xfile add "./../../lib/gaisler/greth/adapters/rgmii.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/rgmii.vhd"
xfile add "./../../lib/gaisler/greth/adapters/rgmii_kc705.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/rgmii_kc705.vhd"
xfile add "./../../lib/gaisler/greth/adapters/rgmii_series7.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/rgmii_series7.vhd"
xfile add "./../../lib/gaisler/greth/adapters/rgmii_series6.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/rgmii_series6.vhd"
xfile add "./../../lib/gaisler/greth/adapters/comma_detect.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/comma_detect.vhd"
xfile add "./../../lib/gaisler/greth/adapters/elastic_buffer.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/elastic_buffer.vhd"
xfile add "./../../lib/gaisler/greth/adapters/gmii_to_mii.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/gmii_to_mii.vhd"
xfile add "./../../lib/gaisler/greth/adapters/word_aligner.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/greth/adapters/word_aligner.vhd"
xfile add "./../../lib/gaisler/i2c/i2c.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2c.vhd"
xfile add "./../../lib/gaisler/i2c/i2cmst.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2cmst.vhd"
xfile add "./../../lib/gaisler/i2c/i2cmst_gen.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2cmst_gen.vhd"
xfile add "./../../lib/gaisler/i2c/i2cslv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2cslv.vhd"
xfile add "./../../lib/gaisler/i2c/i2c2ahbx.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2c2ahbx.vhd"
xfile add "./../../lib/gaisler/i2c/i2c2ahb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2c2ahb.vhd"
xfile add "./../../lib/gaisler/i2c/i2c2ahb_apb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2c2ahb_apb.vhd"
xfile add "./../../lib/gaisler/i2c/i2c2ahb_gen.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2c2ahb_gen.vhd"
xfile add "./../../lib/gaisler/i2c/i2c2ahb_apb_gen.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/i2c/i2c2ahb_apb_gen.vhd"
xfile add "./../../lib/gaisler/spi/spi.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/spi/spi.vhd"
xfile add "./../../lib/gaisler/spi/spimctrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/spi/spimctrl.vhd"
xfile add "./../../lib/gaisler/spi/spictrlx.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/spi/spictrlx.vhd"
xfile add "./../../lib/gaisler/spi/spictrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/spi/spictrl.vhd"
xfile add "./../../lib/gaisler/spi/spi2ahbx.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/spi/spi2ahbx.vhd"
xfile add "./../../lib/gaisler/spi/spi2ahb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/spi/spi2ahb.vhd"
xfile add "./../../lib/gaisler/spi/spi2ahb_apb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/spi/spi2ahb_apb.vhd"
xfile add "./../../lib/gaisler/grdmac2/grdmac2_pkg.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/grdmac2_pkg.vhd"
xfile add "./../../lib/gaisler/grdmac2/grdmac2_apb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/grdmac2_apb.vhd"
xfile add "./../../lib/gaisler/grdmac2/mem2buf.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/mem2buf.vhd"
xfile add "./../../lib/gaisler/grdmac2/buf2mem.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/buf2mem.vhd"
xfile add "./../../lib/gaisler/grdmac2/grdmac2_ctrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/grdmac2_ctrl.vhd"
xfile add "./../../lib/gaisler/grdmac2/grdmac2.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/grdmac2.vhd"
xfile add "./../../lib/gaisler/grdmac2/grdmac2_ahb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/grdmac2_ahb.vhd"
xfile add "./../../lib/gaisler/grdmac2/grdmac2_acc.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/grdmac2_acc.vhd"
xfile add "./../../lib/gaisler/grdmac2/grdmac2_axi.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/grdmac2/grdmac2_axi.vhd"
xfile add "./../../lib/gaisler/subsys/subsys.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/subsys/subsys.vhd"
xfile add "./../../lib/gaisler/subsys/leon_dsu_stat_base.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/subsys/leon_dsu_stat_base.vhd"
xfile add "./../../lib/gaisler/plic/plic.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/plic/plic.vhd"
xfile add "./../../lib/gaisler/plic/grplic.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/plic/grplic.vhd"
xfile add "./../../lib/gaisler/plic/plic_encoder.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/plic/plic_encoder.vhd"
xfile add "./../../lib/gaisler/plic/plic_gateway.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/plic/plic_gateway.vhd"
xfile add "./../../lib/gaisler/plic/plic_target.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/plic/plic_target.vhd"
xfile add "./../../lib/gaisler/plic/grplic_ahb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/plic/grplic_ahb.vhd"
xfile add "./../../lib/gaisler/l2c_lite/l2c_lite.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/l2c_lite/l2c_lite.vhd"
xfile add "./../../lib/gaisler/l2c_lite/l2c_lite_mem.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/l2c_lite/l2c_lite_mem.vhd"
xfile add "./../../lib/gaisler/l2c_lite/l2c_lite_ctrl.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/l2c_lite/l2c_lite_ctrl.vhd"
xfile add "./../../lib/gaisler/l2c_lite/l2c_lite_ahb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/l2c_lite/l2c_lite_ahb.vhd"
xfile add "./../../lib/gaisler/l2c_lite/l2c_lite_axi.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/l2c_lite/l2c_lite_axi.vhd"
xfile add "./../../lib/gaisler/noelv/pkg_64/../pkg/noelv_cfg_64.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/pkg_64/../pkg/noelv_cfg_64.vhd"
xfile add "./../../lib/gaisler/noelv/pkg_64/../pkg/noelv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/pkg_64/../pkg/noelv.vhd"
xfile add "./../../lib/gaisler/noelv/clint/clint.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/clint/clint.vhd"
xfile add "./../../lib/gaisler/noelv/clint/clint_ahb.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/clint/clint_ahb.vhd"
xfile add "./../../lib/gaisler/noelv/core/noelvint.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/noelvint.vhd"
xfile add "./../../lib/gaisler/noelv/core/utilnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/utilnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/mmuconfig.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/mmuconfig.vhd"
xfile add "./../../lib/gaisler/noelv/core/bhtnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/bhtnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/btbnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/btbnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/btbdmnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/btbdmnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/rasnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/rasnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/tbufmemnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/tbufmemnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/cachememnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/cachememnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/mul64.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/mul64.vhd"
xfile add "./../../lib/gaisler/noelv/core/div64.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/div64.vhd"
xfile add "./../../lib/gaisler/noelv/core/regfile64sramnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/regfile64sramnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/regfile64dffnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/regfile64dffnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/progbuf.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/progbuf.vhd"
xfile add "./../../lib/gaisler/noelv/core/fputilnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/fputilnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/iunv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/iunv.vhd"
xfile add "./../../lib/gaisler/noelv/core/cpucorenv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/cpucorenv.vhd"
xfile add "./../../lib/gaisler/noelv/core/rvdmx.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/rvdmx.vhd"
xfile add "./../../lib/gaisler/noelv/core/rvdm.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/rvdm.vhd"
xfile add "./../../lib/gaisler/noelv/core/cctrlnv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/cctrlnv.vhd"
xfile add "./../../lib/gaisler/noelv/core/mulfp.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/mulfp.vhd"
xfile add "./../../lib/gaisler/noelv/core/nanofpunv.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/core/nanofpunv.vhd"
xfile add "./../../lib/gaisler/noelv/subsys/noelvcpu.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/subsys/noelvcpu.vhd"
xfile add "./../../lib/gaisler/noelv/subsys/dummy_pnp.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/subsys/dummy_pnp.vhd"
xfile add "./../../lib/gaisler/noelv/subsys/noelvsys.vhd" -lib_vhdl gaisler
puts "./../../lib/gaisler/noelv/subsys/noelvsys.vhd"
lib_vhdl new work
xfile add "./config.vhd" -lib_vhdl work
puts "./config.vhd"
xfile add "./cfg/config_local.vhd" -lib_vhdl work
puts "./cfg/config_local.vhd"
xfile add "./rtl/core/rev.vhd" -lib_vhdl work
puts "./rtl/core/rev.vhd"
xfile add "./rtl/core/cfgmap.vhd" -lib_vhdl work
puts "./rtl/core/cfgmap.vhd"
xfile add "./rtl/core/noelvcore.vhd" -lib_vhdl work
puts "./rtl/core/noelvcore.vhd"
xfile add "./rtl/ahbrom.vhd" -lib_vhdl work
puts "./rtl/ahbrom.vhd"
xfile add "./rtl/ahbrom64.vhd" -lib_vhdl work
puts "./rtl/ahbrom64.vhd"
xfile add "./rtl/ahbrom128.vhd" -lib_vhdl work
puts "./rtl/ahbrom128.vhd"
xfile add "./rtl/noelvmp.vhd" -lib_vhdl work
puts "./rtl/noelvmp.vhd"
project set top "rtl" "noelvmp"
project set "Bus Delimiter" ()
project set "FSM Encoding Algorithm" None
project set "Pack I/O Registers into IOBs" yes
project set "Verilog Macros" ""
project set "Other XST Command Line Options" "" -process "Synthesize - XST"
project set "Allow Unmatched LOC Constraints" true -process "Translate"
project set "Macro Search Path" "./../../netlists/xilinx/" -process "Translate"
project set "Pack I/O Registers/Latches into IOBs" {For Inputs and Outputs}
project set "Other MAP Command Line Options" "" -process Map
project set "Drive Done Pin High" true -process "Generate Programming File"
project set "Create ReadBack Data Files" true -process "Generate Programming File"
project set "Create Mask File" true -process "Generate Programming File"
project set "Run Design Rules Checker (DRC)" false -process "Generate Programming File"
project close
exit
