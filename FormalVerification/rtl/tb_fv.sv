`include "pmp_portmap.svh"
import pmp_pkg::*;
`define M_MODE 2'b11
`define S_MODE 2'b01
`define U_MODE 2'b00
`define NAPOT 2'b11
`define NA4 2'b10
`define TOR 2'b01
`define OFF 2'b00
`define XLEN 64
`define PMP_ACCESS_X 2'b00 
`define PMP_ACCESS_R 2'b01
`define PMP_ACCESS_W 2'b11



module pmp_assertions
	#(	
	parameter pmp_check = 1 ,  
    parameter pmp_no_tor = 0, 
    parameter pmp_entries = 16,
    parameter pmp_g = 10,
    parameter pmp_msb = 55)

	(
	input bit clk300p,
	input bit rstn  ,
	input pmpaddr_vec_type pmpaddr,
	input word64 pmpcfg0 ,
	input word64 pmpcfg2,
	input bit[pmp_msb:0] address,
	input bit [1:0] acc  ,
	input bit [1:0] prv ,
	input bit mprv ,
	input bit[1:0] mpp ,
	input bit valid ,
	input bit ok
	);
	function int read_access_perm( 
		word64 pmpcfg0,
		word64 pmpcfg2,
		bit [1:0] acc, //access x/w/r
		int index //cfg index
	);
	begin
		automatic int offset = -1;
		if(acc == `PMP_ACCESS_X)
			offset = 2;
		else if(acc == `PMP_ACCESS_W)
			offset = 1;
		else if(acc == `PMP_ACCESS_R)
			offset = 0;
		if(offset >= 0 && index >= 0) begin   
				if(index < 8)
					return int'(pmpcfg0[index*8+offset]);
				else if(index < pmp_entries)
					return int'(pmpcfg2[(index-8)*8+offset]);
			end else
				return -1;
		end	
		endfunction
		
		
	function int read_l_bit( 
		word64 pmpcfg0,
		word64 pmpcfg2,
		int index //cfg index
	);
	begin
		if(index >= 0 && index < 8)
			return int'(pmpcfg0[index*8+7]);
		else if(index >= 8 && index < pmp_entries)
			return int'(pmpcfg2[(index-8)*8+7]);
		else
			return -1;
	end
	endfunction
	
	function bit[1:0] read_address_mode( 
		word64 pmpcfg0,
		word64 pmpcfg2,
		int index //cfg index
	);
	begin
		if(index >= 0 && index < 8)
			return pmpcfg0[index*8+4 -:2];
		else if(index >= 8 && index < pmp_entries)
			return pmpcfg2[(index-8)*8+4 -:2];
		else
			return -1;
	end
	endfunction

	function int napot_range_size(pmpaddr_type pmpaddr); begin	
		for(int i = 0; i < `pmpaddrbits; i++) begin
			if(pmpaddr[i] == 0)
				return i+1;
		end
		return `pmpaddrbits;
	end
	endfunction

	function int valid_pmpaddr(
			pmpaddr_vec_type pmpaddr,
			word64 pmpcfg0,
			word64 pmpcfg2); 
		begin 
		automatic int sum = 0;
		if(pmp_g > 1) begin
			for(int i = 0; i < pmp_entries; i++) begin
				if(read_address_mode(pmpcfg0, pmpcfg2, i) == `NAPOT) begin
					if(pmpaddr[i][pmp_g-2:0] == '1)
						sum++;
				end else
					sum++;
			end
			return sum;
		end else
			return pmp_entries;
		end
	endfunction
			

	function int check_valid_address(
			pmpaddr_vec_type pmpaddr,
			bit[pmp_msb:0] address,
			word64 pmpcfg0,
			word64 pmpcfg2
		);
		begin

		for(int i = 0; i < pmp_entries; i++) begin
			automatic bit[1:0] a = read_address_mode(pmpcfg0, pmpcfg2, i); //new addition, better to have a function that can read each part of pmpcfg
			automatic int index = 0;
			automatic pmpaddr_type napot_pmpaddr;
			automatic bit[pmp_msb:0] napot_address;
			if(a == `NA4 || a == `NAPOT) begin 
				index = napot_range_size(pmpaddr[i]);//returns position of first y (specification notation)
				napot_pmpaddr = pmpaddr[i] >> index;
				napot_address = address    >> index;

				if(napot_address[pmp_msb:2] == napot_pmpaddr[`pmpaddrbits-1:0]) begin
					return i;
				end
			end
		else if(a == `TOR) begin //assumption is that we don't wrap around the address space on the last pmpaddr
			if(i > 0) begin
				if(address[pmp_msb:2+pmp_g] < pmpaddr[i][`pmpaddrbits-1:pmp_g] && address[pmp_msb:2+pmp_g] >= pmpaddr[i-1][`pmpaddrbits-1:pmp_g])
					return i;
			end else begin	
				if (address[pmp_msb:2+pmp_g] < pmpaddr[i][`pmpaddrbits-1:pmp_g] && address[pmp_msb:2+pmp_g] >= 0) 
					return i;
			end
		end
	end
		return -1;
	end
	endfunction
	//If PMP_G > 0 we should not see mode NA4 in the address matching fields	

	if(pmp_g > 0) begin
		for(genvar i = 0; i < `XLEN/8 ; i++) begin
		address_mode : assume property(
				pmpcfg0[i*8+4:8*i+3] != `NA4 &&
				pmpcfg2[i*8+4:8*i+3] != `NA4
		);
		end
	end

	if(pmp_no_tor > 0) begin
		for(genvar i = 0; i < `XLEN/8 ; i++) begin
		no_tor_mode : assume property(
				pmpcfg0[i*8+4:8*i+3] != `TOR &&
				pmpcfg2[i*8+4:8*i+3] != `TOR
		);
		end
	end


	for(genvar i = 0; i < pmp_entries; i++) begin	
		address_msb_0 : assume property(pmpaddr[i][`pmpaddrbits] == 0); //We never expect the carry position to be set from the outside
		address_max : assume property(pmpaddr[i][`pmpaddrbits-1:0] != '1); //probably a bug that causes us to use this assumption
	end

	property grant_perm;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2)) ##0
			index >= 0 && //we must get a hit to get an okay
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries && //this ensures that all of the pmpaddr are legal
			read_access_perm(pmpcfg0, pmpcfg2, acc, index) == 1 //for it to not fail, the access permission must be set, not required for M mode but for S & U
		) |=> ok);
	endproperty
	
	property m_always_grant;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2)) ##0
			prv == `M_MODE &&
			index == -1	&&	//look for an area that has not been set up, only m mode should have access here
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			mprv == 0
		) |=> ok );
	endproperty

	property s_u_never_grant;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2)) ##0
			prv != `M_MODE &&
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			index == -1	&&	
			valid == 1
		) |=> !ok );
	
	endproperty

	//If in M mode and MPRV is set and MPP is (S or U) ? check PMP, dont think the current property will do much else than what grant_perm already does
	property mprv_set;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2)) ##0
			index == -1 &&
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			mprv == 1 &&
			mpp != `M_MODE && 
			valid == 1 &&
			acc != `PMP_ACCESS_X
		) |=> !ok ); 
	
	endproperty

	property mprv_ok_set;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2)) ##0
			index >= 0 &&
			mprv == 1 &&
			mpp != `M_MODE && 
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			valid == 1 &&
			read_access_perm(pmpcfg0, pmpcfg2, acc, index) == 1 &&
			acc != `PMP_ACCESS_X
		) |=> ok ); 
	
	endproperty

	property enforce_lock;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2)) ##0
			index >= 0 &&
			valid == 1 &&
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			read_l_bit(pmpcfg0, pmpcfg2, index) == 1 &&
			read_access_perm(pmpcfg0, pmpcfg2, acc, index) == 0			
		) |=> !ok ); 

	endproperty
	
	grant_check : assert property(grant_perm) else $error("Gave okay despite fulfilling okay criteria");
	mprv_mpp_check : assert property(mprv_set) else $error("MPRV assertion failed"); 
	mprv_mpp_ok_check : assert property(mprv_ok_set) else $error("MPRV assertion failed"); 
	m_access_check : assert property(m_always_grant) else $error("Should have granted access");	
	s_u_access_check : assert property(s_u_never_grant) else $error("Should have granted access");	
	lock_check : assert property(enforce_lock) else $error("Lock bit not enforced");
endmodule
