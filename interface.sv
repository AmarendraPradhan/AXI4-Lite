interface slave_if #(parameter WIDTH = 32) (input clk , rst_n); 


	
		// Address write channel
		   logic  awready;
		   logic   awvalid;
		   logic  [2:0]awaddr;

		// Data write channel
		   logic  wready;
		   logic  wvalid;
		   logic  [(WIDTH/8)-1:0]wstrb;
		   logic  [WIDTH-1:0]wdata;

		// Write response channel
		   logic[1:0]bresp;
		   logic bvalid;
		   logic  bready;

		// Read address channel
		   logic arready;
		   logic  [2:0]araddr;
		   logic  arvalid;

		// read data channel
		   logic [WIDTH-1:0]rdata;
		   logic [1:0]rresp;
		   logic rvalid;
		   logic  rready;
		   
endinterface : slave_if