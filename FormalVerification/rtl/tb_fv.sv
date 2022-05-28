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
`define HALF_HIT -10
`define NO_HIT -1

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
	input bit [1:0] size,
	input bit [1:0] prv ,
	input bit mprv ,
	input bit[1:0] mpp ,
	input bit valid ,
	input bit ok
	);
	function int read_access_perm( 
		word64 pmpcfg0,
		word64 pmpcfg2,
		bit [1:0] acc, // access x/w/r
		int index // cfg index
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
		int index // cfg index
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
		int index // cfg index
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

    // returns the position of the first y (spec. notation)
	function int napot_range_size(pmpaddr_type pmpaddr); begin	
		for(int i = 0; i < `pmpaddrbits; i++) begin
			if(pmpaddr[i] == 0)
				return i+1;
		end
		return `pmpaddrbits;
	end
	endfunction
    
    // returns one if the access is aligned
	function int aligned_access(
			bit[1:0] size,
			bit [pmp_msb:0] address);
		begin

		case(size)
			3 : begin 
				if(address[2:0] == '0)
					return 1; 
			end
			2 : begin 
				if(address[1:0] == '0)
					return 1; 
			end
			1 : begin 
				if(address[0:0] == '0)
					return 1; 
			end
			default :
				return 1;
		endcase

		return -1;

		end
	endfunction


    // Enforce that NAPOT and TOR entries are valid addresses, 
    // the sum should be the same as the number of entries if 
    // all addresses are valid. 
	function int valid_pmpaddr(
			pmpaddr_vec_type pmpaddr,
			word64 pmpcfg0,
			word64 pmpcfg2); 
		begin 
		automatic int sum = 0;
			for(int i = 0; i < pmp_entries; i++) begin
				automatic bit[1:0] current_mode = read_address_mode(pmpcfg0, pmpcfg2, i);
				if( current_mode == `NAPOT && pmp_g > 1) begin
					if(pmpaddr[i][pmp_g-2:0] == '1)
						sum++;
				end else if(current_mode == `TOR && pmp_g > 0) begin
					if(pmpaddr[i][pmp_g-1:0] == '0)
						sum++;
				end else begin
					sum++;
				end
			end
			return sum;
		end
	endfunction
			
    // Function checks if we are within the range of a PMP region, 
    // if we are halfway within or if we miss entirely.
	function automatic int check_valid_address(
			pmpaddr_vec_type pmpaddr,
			bit[pmp_msb:0] address,
			word64 pmpcfg0,
			word64 pmpcfg2,
			bit [1:0] size
		);
		begin

		for(int i = 0; i < pmp_entries; i++) begin
			bit[1:0] a = read_address_mode(pmpcfg0, pmpcfg2, i);
			int index = 0; // index only used for NAPOT entries
			pmpaddr_type napot_pmpaddr;
			bit[pmp_msb:0] napot_address;

			if(a == `NAPOT) begin 
				index = napot_range_size(pmpaddr[i]);
				// index returns position of first y (specification notation)
				napot_pmpaddr = pmpaddr[i] >> index;
				napot_address = address    >> index;
				// if addresses match we have a hit
				if(napot_address[pmp_msb:2] == napot_pmpaddr[`pmpaddrbits-1:0]) begin
					return i;
				end
			end
			else if(a == `NA4) begin
				if(address[pmp_msb:2] == pmpaddr[i] && size < 3)
					return i;
				else if(address[pmp_msb:3] == pmpaddr[i][`pmpaddrbits-1:1] && size == 3)
					return `HALF_HIT; // Half hit, can't hit in subsequent entries
			end

			else if(a == `TOR) begin

			longint unsigned address_high = (address+2**(unsigned'(size))-1);
			bit[pmp_msb:2+pmp_g] top_of_range =  address_high[pmp_msb:2+pmp_g];
			bit[`pmpaddrbits-1:pmp_g] pmpaddr_high = pmpaddr[i][`pmpaddrbits-1:pmp_g];
			bit[`pmpaddrbits-1:pmp_g] address_trunc = address[pmp_msb:2+pmp_g];	

			if(i > 0) begin
				bit[`pmpaddrbits-1:pmp_g] pmpaddr_low = pmpaddr[i-1][`pmpaddrbits-1:pmp_g];
				if(address_trunc < pmpaddr_high && 
					 address_trunc >= pmpaddr_low && 
					 top_of_range < pmpaddr_high && 
					 top_of_range >= pmpaddr_low ) 
					return i; // Full hit at index i
				else if((address_trunc < pmpaddr_high &&
					 address_trunc >= pmpaddr_low) ^^ 
					 (top_of_range < pmpaddr_high && 
					 top_of_range >= pmpaddr_low ))
					return `HALF_HIT;

			end else begin // only to deal with the the first entry being TOR
				if (address_trunc < pmpaddr_high &&
					 address_trunc >= 0 &&
					 top_of_range < pmpaddr_high ) 
					return i;
				else if((address_trunc < pmpaddr_high &&
					 address_trunc >= 0) ^^ 
					 (top_of_range < pmpaddr_high && 
					 top_of_range >= 0 ))
					return `HALF_HIT;
			end
		end
	end
		return `NO_HIT;
	end
	endfunction
	
	// If PMP_G > 0 we should not see mode NA4 in the address matching fields	
	if(pmp_g > 0) begin
		for(genvar i = 0; i < pmp_entries/2 ; i++) begin
		address_mode : assume property(
				pmpcfg0[i*8+4:8*i+3] != `NA4 &&
				pmpcfg2[i*8+4:8*i+3] != `NA4
		);
		end
	end
    // implementation specific feature to be able to disable TOR mode
	if(pmp_no_tor > 0) begin
		for(genvar i = 0; i < pmp_entries/2 ; i++) begin
		no_tor_mode : assume property(
				pmpcfg0[i*8+4:8*i+3] != `TOR &&
				pmpcfg2[i*8+4:8*i+3] != `TOR
		);
		end
	end
	assume property( prv != 2'b10 ); // undefined privilege mode
	assume property( mpp != 2'b10 ); // undefined privilege mode


	for(genvar i = 0; i < pmp_entries; i++) begin	
	    // We never expect the carry position to be set from the outside,
	    // this assumption is from a newer version of the code where a carry 
	    // bit has been added to fix one of the bugs, in the new NOEL-V code 
	    // pmpaddr is therefore one bit longer.
		//address_msb_0 : assume property(pmpaddr[i][`pmpaddrbits] == 0); 
		
		// This assumption is to hide a NOEL-V bug, 
		// should be excluded once bugs have been fixed
		assume property( pmpaddr[i] > 0);
		if(i > 0)
		    // bug related assumption
			assume property(pmpaddr[i-1] != pmpaddr[i]); //eliminates null-range
		// address_max : assume property(pmpaddr[i][`pmpaddrbits-1:0] != '1); 
		// Bug related assumption
	end

	property grant_perm;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2, size)) ##0
			aligned_access(size, address) == 1 &&
			read_l_bit(pmpcfg0, pmpcfg2, index) == 0 &&
			index > `NO_HIT && // we must get a hit to get an okay
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries && 
			// this ensures that all of the pmpaddr are legal
			read_access_perm(pmpcfg0, pmpcfg2, acc, index) == 1 
			// for it to not fail, the access permission must be set, 
			// not required for M mode but for S & U
		) |=> ok);
	endproperty
	
	property m_always_grant;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2, size)) ##0
			prv == `M_MODE &&
			valid == 1 &&
			aligned_access(size, address) == 1 &&
			index != `HALF_HIT	&&	// look for an area that that is not a half-hit
			read_l_bit(pmpcfg0, pmpcfg2, index) < 1 && 
			// No l-bit can be allowed since permissions are not set.
			// 0 means no L bit, -1 means index == -1
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			mprv == 0
		) |=> ok );
	endproperty

	property s_u_never_grant;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2, size)) ##0
			prv != `M_MODE &&
			aligned_access(size, address) == 1 &&
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			index == `NO_HIT	&&	
			valid == 1
		) |=> !ok );
	
	endproperty

	// If in M mode and MPRV is set and MPP is (S or U)
	property mprv_set;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2, size)) ##0
			index == `NO_HIT &&
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			aligned_access(size, address) == 1 &&
			mprv == 1 &&
			mpp != `M_MODE && 
			valid == 1 &&
			acc != `PMP_ACCESS_X
		) |=> !ok ); 
	
	endproperty

	property mprv_ok_set;
		int index = -1;
		@(posedge clk300p) disable iff(!rstn)
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2, size)) ##0
			index > `NO_HIT &&
			aligned_access(size, address) == 1 &&
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
		(( (1, index = check_valid_address(pmpaddr, address, pmpcfg0, pmpcfg2, size)) ##0
			index > `NO_HIT &&
			valid == 1 &&
			valid_pmpaddr(pmpaddr, pmpcfg0, pmpcfg2) == pmp_entries &&
			aligned_access(size, address) == 1 &&
			read_l_bit(pmpcfg0, pmpcfg2, index) == 1 &&
			read_access_perm(pmpcfg0, pmpcfg2, acc, index) == 0			
		) |=> !ok ); 

	endproperty
	
	grant_check : assert property(grant_perm);
	mprv_mpp_check : assert property(mprv_set); 
	mprv_mpp_ok_check : assert property(mprv_ok_set); 
	m_access_check : assert property(m_always_grant);	
	s_u_access_check : assert property(s_u_never_grant);	
	lock_check : assert property(enforce_lock);
endmodule
