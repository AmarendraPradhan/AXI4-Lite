class slave_seq_item extends uvm_sequence_item;
	`uvm_object_utils(slave_seq_item)

	parameter WIDTH = 32 ;

// address write channel
	rand logic   awvalid;
	rand logic  [WIDTH-1:0]awaddr;
		  logic	awready; 

// data write channel
		  logic	wready;
	rand logic  wvalid;
	rand logic  [(WIDTH/8)-1:0]wstrb;
	rand logic  [WIDTH-1:0]wdata;
	
// write response channel
		  logic [1:0]bresp;
		  logic bvalid;
	rand logic bready;

// read address channel
			logic  arready;
	 rand logic  [32:0]araddr;
	 rand logic  arvalid;

// read data channel
		  logic [WIDTH-1:0]rdata;
		  logic [1:0]rresp;
		  logic rvalid;
	rand logic rready;

 //Utility and Field macros,
 	`uvm_object_utils_begin(seq_item)
    `uvm_field_int(awvalid ,UVM_ALL_ON)
    `uvm_field_int(awaddr,UVM_ALL_ON)
    `uvm_field_int(awvalid,UVM_ALL_ON)
    `uvm_field_int(wstrb,UVM_ALL_ON)
    `uvm_field_int(wdata ,UVM_ALL_ON)
    `uvm_field_int(bready,UVM_ALL_ON)
    `uvm_field_int(araddr,UVM_ALL_ON)
    `uvm_field_int(arvalid,UVM_ALL_ON)
    `uvm_field_int(arready,UVM_ALL_ON)
  	`uvm_object_utils_end


constraint wr_rd_c { awvalid!=arvalid;};
	
constraint c_awaddr { awaddr inside 
{32'h00000000:32'hffffffff };}

constraint c_wdata { wdata inside 
{32'h00000000:32'hffffffff };}

constraint c_awaddr { araddr inside 
{32'h00000000:32'hffffffff };}

constraint c_wstrb { wstrb  inside 
{4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,
4'b0111,4'b1000,4'b1001,4'b1010,4'b1011,4'b1100,4'b1101,4'b1111}; }


// constructor
function new(string name = "seq_item");
	   	super.new(name);
endfunction

endclass : slave_seq_item
