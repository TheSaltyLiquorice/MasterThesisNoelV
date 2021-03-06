This design is tailored to the Xilinx Virtex-7 VC707 board

http://www.xilinx.com/vc707

Note: This design requires that the GRLIB_SIMULATOR variable is
correctly set. Please refer to the documentation in doc/grlib.pdf for
additional information.

Note: The Vivado flow and parts of this design are still
experimental. Currently the design configuration should be left as-is.

Note: You must have Vivado 2018.1 in your path for the make targets to work.

The XILINX_VIVADO variable must be exported for the mig_7series target
to work correctly: export XILINX_VIVADO

Design specifics
----------------

* Synthesis should be done using Vivado 2018.1 or newer. For newer versions
  the MIG and SGMII projects may need to be updated.

* This design has GRFPU enabled by default. If your release doesn't contain
  GRFPU, it has to be disabled in order to build the design.

* The DDR3 controller is implemented with Xilinx MIG 7-Series and 
  runs of the 200 MHz clock. The DDR3 memory runs at 400 MHz
  (DDR3-800).

* The AHB clock is generated by the MMCM module in the DDR3
  controller, and can be controlled via Vivado. When the 
  MIG DDR3 controller isn't present the AHB clock is generated
  from CLKGEN, and can be controlled via xconfig

* System reset is mapped to the CPU RESET button

* DSU break is mapped to GPIO east button

* LED 0 indicates processor in debug mode

* LED 1 indicates processor in error mode, execution halted

* LED 2 indicates DDR3 PHY initialization done (Only valid when MIG is present)

* LED 3 indicates internal PLL has locked (Only valid when MIG isn't present)

* 16-bit flash prom can be read at address 0. It can be programmed
  with GRMON version 2.0.30-74 or later.

* The application UART1 is connected to the USB/RS232 connector if 
  switch 5, located on the DIP Switch SW2 of the board, is set to OFF.
  
* The AHB UART can be enabled by setting switch 5 to ON.
  Since the board is equipped with one USB/RS232 connector, APB UART1 and
  AHB UART cannot be used at the same time.

* The JTAG DSU interface is enabled and accesible via the JTAG port.
  Start grmon with -xilusb to connect.

* Ethernet FMC support. (http://ethernetfmc.com/)
  Supports 1000BASE-T, 100BASE-TX, and 10BASE-T standards for RGMII interface
  The MDIO bus of each PHY is routed to the FMC connector separately
  Enable FMC Support via 'make xconfig' or set 'CFG_GRETH_FMC' in config.vhd

* Ethernet FMC Support is enabled via CFG_GRETH_FMC. For more information
  see http://ethernetfmc.com/. Example FPGA image and configuration with 
  FMC Ethernet support is supplied in sub-directory 'bitfiles/fmc'

Simulation and synthesis
------------------------

The design uses the Xilinx MIG memory interface with an AHB-2.0 or AXI4 
interface and Xilinx SGMII PHY Interface. The MIG or the SGMII PHY 
source code cannot be distributed due to the prohibitive Xilinx 
license, so the MIG and/or the SGMII must be re-generated with 
Vivado before simulation and synthesis can be done.

Xilinx MIG and SGMII interface will automatically be generated when 
Vivado is launched  

To simulate using XSIM and run systest.c on the Noel-V design using the memory 
controller from Xilinx use the make targets:

  make soft
  make vivado-launch

To simulate using Modelsim/Aldec and run systest.c on the Noel-V design using 
the memory controller from Xilinx use the make targets:

  make map_xilinx_7series_lib
  make sim
  make mig_7series
  make sgmii_7series
  make sim-launch

To simulate using the Aldec Riviera WS flow use the following make targets:

  make riviera_ws               # creates riviera workspace
  make map_xilinx_7series_lib   # compiles and maps xilinx sim libs
  make mig_7series              # generates MIG IP and adds to riviera project
  make sgmii_7series            # same for SGMII adapter
  make riviera                  # compile full project
  make riviera-launch           # launch simulation

To synthesize the design, do

  make vivado

and then use the programming tool:
  
  make vivado-prog-fpga

to program the FPGA.

After successfully programming the FPGA the user might have to press
the 'CPU RESET' button in order to successfully complete the
calibration process in the MIG. Led 1 and led 2 should be constant
green if the Calibration process has been successful.

If user tries to connect to the board and the MIG has not been
calibrated successfully 'grmon' will output: AMBA plug&play not found!

The MIG and SGMII IP can be disabled either by deselecting the memory
controller and Gaisler Ethernet interface in 'xconfig' or manually
editing the config.vhd file.  When no MIG and no SGMII block is
present in the system normal GRLIB flow can be used and no extra
compile steps are needed. Also when when no MIG is present it is
possible to control and set the system frequency via xconfig.  Note
that the system frequency can be modified via Vivado when the MIG is
present by modifying within specified limits for the MIG IP.

Compiling and launching modelsim when no memory controller and no
ethernet interface is present using Modelsim/Aldec simulator:

  make vsim
  make soft
  make vsim-launch

Simulation options
------------------

All options are set either by editing the testbench or specify/modify the generic 
default value when launching the simulator. For Modelsim use the option "-g" i.e.
to enable processor disassembly to console launch modelsim with the option: "-gdisas=1"

USE_MIG_INTERFACE_MODEL - Use MIG simulation model for faster simulation run time
(Option can now be controlled via 'make xconfig')

disas - Enable processor disassembly to console

DEBUG - Enable extra debug information when using Micron DDR3 models

FPGA configuration
------------------

The BPI flash can be programmed by issuing the command make ise-prog-prom.

The configuration mode setting for SW11 should be M[2:0] = 010 and the full
SW11 should be:

     SW11-1     off
     SW11-2     off
     SW11-3     off
     SW11-4     on
     SW11-5     off

Output from GRMON
-----------------

 grmon -xilusb -u

  GRMON debug monitor v3.2.9-10-g8284505 64-bit internal version
  
  Copyright (C) 2020 Cobham Gaisler - All rights reserved.
  For latest updates, go to http://www.gaisler.com/
  Comments or bug-reports to support@gaisler.com
  
  This internal version will expire on 14/12/2021

Parsing -xilusb
Parsing -u

Commands missing help:

JTAG chain (1): xc7vx485t 
  GRLIB build version: 4261
  Detected frequency:  99.0 MHz
  
  Component                            Vendor
  NOEL-V RISC-V Processor              Cobham Gaisler
  AHB Debug UART                       Cobham Gaisler
  JTAG Debug Link                      Cobham Gaisler
  GR Ethernet MAC                      Cobham Gaisler
  Xilinx MIG Controller                Cobham Gaisler
  Generic AHB ROM                      Cobham Gaisler
  AHB/APB Bridge                       Cobham Gaisler
  RISC-V CLINT                         Cobham Gaisler
  RISC-V PLIC                          Cobham Gaisler
  RISC-V Debug Module                  Cobham Gaisler
  AMBA Trace Buffer                    Cobham Gaisler
  General Purpose I/O port             Cobham Gaisler
  Modular Timer Unit                   Cobham Gaisler
  Generic UART                         Cobham Gaisler
  
  Use command 'info sys' to print a detailed report of attached cores

grmon3> info sys
  cpu0      Cobham Gaisler  NOEL-V RISC-V Processor    
            AHB Master 0
  ahbuart0  Cobham Gaisler  AHB Debug UART    
            AHB Master 2
            APB: fc000e00 - fc000f00
            Baudrate 115200, AHB frequency 99.00 MHz
  ahbjtag0  Cobham Gaisler  JTAG Debug Link    
            AHB Master 3
  greth0    Cobham Gaisler  GR Ethernet MAC    
            AHB Master 4
            APB: fc084000 - fc084100
            IRQ: 5
            edcl ip 192.168.0.237, buffer 16 kbyte
  mig0      Cobham Gaisler  Xilinx MIG Controller    
            AHB: 00000000 - 40000000
            APB: fc080000 - fc080100
            SDRAM: 1024 Mbyte
  ahbrom0   Cobham Gaisler  Generic AHB ROM    
            AHB: c0000000 - e0000000
            32-bit ROM: 512 MB @ 0xc0000000
  apbmst0   Cobham Gaisler  AHB/APB Bridge    
            AHB: fc000000 - fc100000
  clint0    Cobham Gaisler  RISC-V CLINT    
            AHB: e0000000 - e0100000
  plic0     Cobham Gaisler  RISC-V PLIC    
            AHB: f8000000 - fc000000
            4 contexts, 32 interrupt sources
  dm0       Cobham Gaisler  RISC-V Debug Module    
            AHB: fe000000 - ff000000
            hart0: DXLEN 64, MXLEN 64, SXLEN 64, UXLEN 64
                   ISA A D F I M,  Modes M S U
                   Stack pointer 0x3ffffff0
                   icache 4 * 4 kB, 32 B/line, rnd
                   dcache 4 * 4 kB, 32 B/line, rnd
                   3 triggers,
                   itrace 64 lines
  ahbtrace0 Cobham Gaisler  AMBA Trace Buffer    
            AHB: fff00000 - fff20000
            Trace buffer size: 128 lines
  gpio0     Cobham Gaisler  General Purpose I/O port    
            APB: fc083000 - fc083100
  gptimer0  Cobham Gaisler  Modular Timer Unit    
            APB: fc000000 - fc000100
            IRQ: 2
            16-bit scalar, 2 * 32-bit timers, divisor 99
  uart0     Cobham Gaisler  Generic UART    
            APB: fc001000 - fc001100
            IRQ: 1
            Baudrate 38431, FIFO debug mode available
  
grmon3> load hello.elf
                 0 .text             19.7kB /  19.7kB   [===============>] 100%
              4EC0 .rodata            192B              [===============>] 100%
              4F80 .init_array          8B              [===============>] 100%
              4F88 .fini_array          8B              [===============>] 100%
              4F90 .data              2.2kB /   2.2kB   [===============>] 100%
              5850 .sdata              80B              [===============>] 100%
              58A0 .eh_frame            4B              [===============>] 100%
  Total size: 22.16kB (1.15Mbit/s)
  Entry point 0x00000000
  Image hello.elf loaded
  
grmon3> verify hello.elf
                 0 .text             19.7kB /  19.7kB   [===============>] 100%
              4EC0 .rodata            192B              [===============>] 100%
              4F80 .init_array          8B              [===============>] 100%
              4F88 .fini_array          8B              [===============>] 100%
              4F90 .data              2.2kB /   2.2kB   [===============>] 100%
              5850 .sdata              80B              [===============>] 100%
              58A0 .eh_frame            4B              [===============>] 100%
  Total size: 22.16kB (97.69kbit/s)
  Entry point 0x00000000
  Image of hello.elf verified without errors
  
grmon3> run
hello, world

  Forced into debug mode
  0x00004c60: 00100073  ebreak  <_exit+0>
  
grmon3> q
  
Exiting GRMON

Output from GRMON with EDCL debug link
-------------------------------------------------------
[krishna@hwlin1 noelv-xilinx-vc707]$ /gsl/data/products/grmon3/grmon-internal/linux/bin64/grmon -u -eth 192.168.0.235

  GRMON debug monitor v3.2.9-10-g8284505 64-bit internal version
  
  Copyright (C) 2020 Cobham Gaisler - All rights reserved.
  For latest updates, go to http://www.gaisler.com/
  Comments or bug-reports to support@gaisler.com
  
  This internal version will expire on 14/12/2021

Parsing -u
Parsing -eth 192.168.0.235

Commands missing help:

 Ethernet startup...
  GRLIB build version: 4261
  Detected frequency:  100.0 MHz
  
  Component                            Vendor
  NOEL-V RISC-V Processor              Cobham Gaisler
  GR Ethernet MAC                      Cobham Gaisler
  AHB Debug UART                       Cobham Gaisler
  JTAG Debug Link                      Cobham Gaisler
  EDCL master interface                Cobham Gaisler
  Xilinx MIG Controller                Cobham Gaisler
  Generic AHB ROM                      Cobham Gaisler
  AHB/APB Bridge                       Cobham Gaisler
  RISC-V CLINT                         Cobham Gaisler
  RISC-V PLIC                          Cobham Gaisler
  RISC-V Debug Module                  Cobham Gaisler
  AMBA Trace Buffer                    Cobham Gaisler
  General Purpose I/O port             Cobham Gaisler
  Modular Timer Unit                   Cobham Gaisler
  Generic UART                         Cobham Gaisler
  
  Use command 'info sys' to print a detailed report of attached cores

grmon3> edcl
  Device index: greth0
  EDCL ip 192.168.0.235, buffer 16 kB
  
grmon3> info sys
  cpu0      Cobham Gaisler  NOEL-V RISC-V Processor    
            AHB Master 0
  greth0    Cobham Gaisler  GR Ethernet MAC    
            AHB Master 2
            APB: fc084000 - fc084100
            IRQ: 5
            edcl ip 192.168.0.235, buffer 16 kbyte
  ahbuart0  Cobham Gaisler  AHB Debug UART    
            AHB Master 3
            APB: fc000e00 - fc000f00
            Baudrate 115200, AHB frequency 100.00 MHz
  ahbjtag0  Cobham Gaisler  JTAG Debug Link    
            AHB Master 4
  edcl0     Cobham Gaisler  EDCL master interface    
            AHB Master 5
  mig0      Cobham Gaisler  Xilinx MIG Controller    
            AHB: 00000000 - 40000000
            APB: fc080000 - fc080100
            SDRAM: 1024 Mbyte
  ahbrom0   Cobham Gaisler  Generic AHB ROM    
            AHB: c0000000 - e0000000
            32-bit ROM: 512 MB @ 0xc0000000
  apbmst0   Cobham Gaisler  AHB/APB Bridge    
            AHB: fc000000 - fc100000
  clint0    Cobham Gaisler  RISC-V CLINT    
            AHB: e0000000 - e0100000
  plic0     Cobham Gaisler  RISC-V PLIC    
            AHB: f8000000 - fc000000
            4 contexts, 32 interrupt sources
  dm0       Cobham Gaisler  RISC-V Debug Module    
            AHB: fe000000 - ff000000
            hart0: DXLEN 64, MXLEN 64, SXLEN 64, UXLEN 64
                   ISA A D F I M,  Modes M S U
                   Stack pointer 0x3ffffff0
                   icache 4 * 4 kB, 32 B/line, rnd
                   dcache 4 * 4 kB, 32 B/line, rnd
                   3 triggers,
                   itrace 64 lines
  ahbtrace0 Cobham Gaisler  AMBA Trace Buffer    
            AHB: fff00000 - fff20000
            Trace buffer size: 128 lines
  gpio0     Cobham Gaisler  General Purpose I/O port    
            APB: fc083000 - fc083100
  gptimer0  Cobham Gaisler  Modular Timer Unit    
            APB: fc000000 - fc000100
            IRQ: 2
            16-bit scalar, 2 * 32-bit timers, divisor 100
  uart0     Cobham Gaisler  Generic UART    
            APB: fc001000 - fc001100
            IRQ: 1
            Baudrate 38343, FIFO debug mode available
  
grmon3> load /gsl/data/people/cederman/nv-Linux0                                                                                                                                                                                    0 .text             80.6kB /  80.6kB   [===============>] 100%
             15000 .rodata            4.3kB /   4.3kB   [===============>] 100%
             17000 .data              1.1kB /   1.1kB   [===============>] 100%
             17498 .htif               16B              [===============>] 100%
            200000 .payload          20.4MB /  20.4MB   [===============>] 100%
  Total size: 20.51MB (24.50Mbit/s)
  Entry point 0x00000000
  Image /gsl/data/people/cederman/nv-Linux0 loaded
  
grmon3> 
grmon3> verify /gsl/data/people/cederman/nv-Linux0
                 0 .text             80.6kB /  80.6kB   [===============>] 100%
             15000 .rodata            4.3kB /   4.3kB   [===============>] 100%
             17000 .data              1.1kB /   1.1kB   [===============>] 100%
             17498 .htif               16B              [===============>] 100%
            200000 .payload          20.4MB /  20.4MB   [===============>] 100%
  Total size: 20.51MB (23.28Mbit/s)
  Entry point 0x00000000
  Image of /gsl/data/people/cederman/nv-Linux0 verified without errors
  
grmon3> dtb /gsl/data/people/cederman/lock-test/noelv-xilinx-kcu105.dtb                                                                                                                                              DTB will be loaded to the stack
  
grmon3> 
grmon3> run

OpenSBI v0.8
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name       : noel-xilinx-kcu105
Platform Features   : timer,mfdeleg
Platform HART Count : 4
Boot HART ID        : 0
Boot HART ISA       : rv64imafdsu
BOOT HART Features  : pmp,scounteren,mcounteren
BOOT HART PMP Count : 16
Firmware Base       : 0x0
Firmware Size       : 140 KB
Runtime SBI Version : 0.2

MIDELEG : 0x0000000000000222
MEDELEG : 0x000000000000b109
[    0.000000] OF: fdt: Ignoring memory range 0x0 - 0x200000
[    0.000000] Linux version 5.7.19 (cederman@cederman.got.gaisler.com) (gcc version 9.3.0 (Buildroot 2020.08-6-gb7b5a7c2d6), GNU ld (GNU Binutils) 2.33.1) #4 SMP Mon Nov 2 14:19:13 CET 2020
[    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
[    0.000000] printk: bootconsole [sbi0] enabled
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000000200000-0x000000003fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000200000-0x000000003fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000200000-0x000000003fffffff]
[    0.000000] software IO TLB: mapped [mem 0x3b1fb000-0x3f1fb000] (64MB)
[    0.000000] SBI specification v0.2 detected
[    0.000000] SBI implementation ID=0x1 Version=0x8
[    0.000000] SBI v0.2 TIME extension detected
[    0.000000] SBI v0.2 IPI extension detected
[    0.000000] SBI v0.2 RFENCE extension detected
[    0.000000] SBI v0.2 HSM extension detected
[    0.000000] riscv: ISA extensions acim
[    0.000000] riscv: ELF capabilities acim
[    0.000000] percpu: Embedded 17 pages/cpu s31912 r8192 d29528 u69632
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258055
[    0.000000] Kernel command line: earlycon=sbi console=ttyGR0,115200
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 943204K/1046528K available (12725K kernel code, 3906K rwdata, 4096K rodata, 2123K init, 318K bss, 103324K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0xffffffcefee00000 - 0xffffffceff000000   (2048 kB)
[    0.000000]       pci io : 0xffffffceff000000 - 0xffffffcf00000000   (  16 MB)
[    0.000000]      vmemmap : 0xffffffcf00000000 - 0xffffffcfffffffff   (4095 MB)
[    0.000000]      vmalloc : 0xffffffd000000000 - 0xffffffdfffffffff   (65535 MB)
[    0.000000]       lowmem : 0xffffffe000000000 - 0xffffffe03fe00000   (1022 MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000] rcu: 	RCU debug extended QS entry/exit.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 0, nr_irqs: 0, preallocated irqs: 0
[    0.000000] plic: mapped 31 interrupts with 4 handlers for 16 contexts.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [0]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0xb8812736b, max_idle_ns: 440795202655 ns
[    0.000085] sched_clock: 64 bits at 50MHz, resolution 20ns, wraps every 4398046511100ns
[    0.013985] Console: colour dummy device 80x25
[    0.020854] Calibrating delay loop (skipped), value calculated using timer frequency.. 100.00 BogoMIPS (lpj=200000)
[    0.037283] pid_max: default: 32768 minimum: 301
[    0.047107] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.058194] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.098782] rcu: Hierarchical SRCU implementation.
[    0.117377] smp: Bringing up secondary CPUs ...
[    1.189624] CPU1: failed to come online
[    2.252606] CPU2: failed to come online
[    3.315517] CPU3: failed to come online
[    3.321511] smp: Brought up 1 node, 1 CPU
[    3.334145] devtmpfs: initialized
[    3.353548] random: get_random_u32 called from bucket_table_alloc.isra.0+0x74/0x1e4 with crng_init=0
[    3.372311] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    3.386944] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    3.404864] NET: Registered protocol family 16
[    3.674430] vgaarb: loaded
[    3.683511] SCSI subsystem initialized
[    3.698017] usbcore: registered new interface driver usbfs
[    3.706832] usbcore: registered new interface driver hub
[    3.715851] usbcore: registered new device driver usb
[    3.739385] clocksource: Switched to clocksource riscv_clocksource
[    3.917710] NET: Registered protocol family 2
[    3.932063] tcp_listen_portaddr_hash hash table entries: 512 (order: 2, 20480 bytes, linear)
[    3.944876] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    3.957694] TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    3.971085] TCP: Hash tables configured (established 8192 bind 8192)
[    3.982634] UDP hash table entries: 512 (order: 3, 49152 bytes, linear)
[    3.992797] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes, linear)
[    4.006159] NET: Registered protocol family 1
[    4.023829] RPC: Registered named UNIX socket transport module.
[    4.032500] RPC: Registered udp transport module.
[    4.039761] RPC: Registered tcp transport module.
[    4.047342] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    4.057799] PCI: CLS 0 bytes, default 64
[    5.825072] workingset: timestamp_bits=62 max_order=18 bucket_order=0
[    6.020532] NFS: Registering the id_resolver key type
[    6.028259] Key type id_resolver registered
[    6.034653] Key type id_legacy registered
[    6.041249] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    6.054075] 9p: Installing v9fs 9p2000 file system support
[    6.069084] NET: Registered protocol family 38
[    6.076060] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    6.088054] io scheduler mq-deadline registered
[    6.095571] io scheduler kyber registered
[    7.210055] Serial: GRLIB APBUART driver
[    7.217591] fc001000.uart: ttyGR0 at MMIO 0xfc001000 (irq = 2, base_baud = 6250000) is a GRLIB/APBUART
[    7.232670] printk: console [ttyGR0] enabled
[    7.232670] printk: console [ttyGR0] enabled
[    7.250703] printk: bootconsole [sbi0] disabled
[    7.250703] printk: bootconsole [sbi0] disabled
[    7.273705] grlib-apbuart at 0xfc001000, irq 2
[    7.294980] [drm] radeon kernel modesetting enabled.
[    7.472809] loop: module loaded
[    7.498149] libphy: Fixed MDIO Bus: probed
[    7.525545] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    7.541816] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    7.560299] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    7.578701] ehci-pci: EHCI PCI platform driver
[    7.593033] ehci-platform: EHCI generic platform driver
[    7.608429] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    7.625908] ohci-pci: OHCI PCI platform driver
[    7.639399] ohci-platform: OHCI generic platform driver
[    7.660394] usbcore: registered new interface driver uas
[    7.676180] usbcore: registered new interface driver usb-storage
[    7.696304] mousedev: PS/2 mouse device common for all mice
[    7.723108] usbcore: registered new interface driver usbhid
[    7.738591] usbhid: USB HID core driver
[    7.763322] NET: Registered protocol family 10
[    7.791728] Segment Routing with IPv6
[    7.803367] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    7.829234] NET: Registered protocol family 17
[    7.845110] 9pnet: Installing 9P2000 support
[    7.858042] Key type dns_resolver registered
[    7.905064] Freeing unused kernel memory: 2120K
[    7.919139] Run /init as init process
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving random seed: [   11.170827] random: dd: uninitialized urandom read (512 bytes read)
OK
Starting network: OK

Welcome to Buildroot
buildroot login: root
# ls -al
total 4
drwx------    2 root     root            60 Jan  1 00:00 .
drwxr-xr-x   17 root     root           400 Nov  2  2020 ..
-rw-------    1 root     root             7 Jan  1 00:00 .ash_history
# 
  
  Interrupted!
  0xffffffe00047c2e4: c40080e7  jalr    ra, 3136(ra)
  
grmon3> q

