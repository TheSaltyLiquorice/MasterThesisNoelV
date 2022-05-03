//`include "pmp_portmap.svh"
`define pmp_entries 16 
`define pmpaddrbits 54
import pmp_pkg::*;

module top;
	//globalconstant parameters
	parameter pmp_check = 1;  
	parameter pmp_entries = `pmp_entries; 
	parameter pmp_msb = 55;
    
	 bit clk300p;
	 bit rstn;
	 pmpaddr_vec_type pmpaddr;
	 word64 pmpcfg0;
	 word64 pmpcfg2;
	 bit[pmp_msb:0] address;
	 bit [1:0 ]acc;
	 bit [1:0] prv;
	 bit mprv;
	 bit[1:0] mpp;
	 bit valid;
	 bit ok;
	 pmp_wrapper#(	
		.pmp_check(pmp_check),  
		.pmp_no_tor(0) , 
		.pmp_entries(pmp_entries),
		.pmp_g(10),
		.pmp_msb(pmp_msb))
		dut_p_0
		(.*);
	bind pmp_wrapper pmp_assertions#(.pmp_g(pmp_g), .pmp_entries(pmp_entries), .pmp_no_tor(pmp_no_tor)) pmp_inst(.*);

endmodule		

