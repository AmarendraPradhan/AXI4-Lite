module top
	reg clk;


always #5 clk = ~clk;

	intf intrf (clk);


	slave s0(.clk(clk)
	

//-------------------------------slave signal------------------------------------------

	// Address write channel
		   .awready(intf.awready);
		   .awvalid(intf.awvalid);
		   .awaddr(intf.awaddr);

		// Data write channel
		   .wready(intf.awready);
		   .wvalid(intf.wvalid);
		   .wstrb(intf.wstrb);
		   .wdata(intf.wdata);

		// Write response channel
		   .bresp(intf.bresp);
		   .bvalid(intf.bvalid);
		   .bready(intf.bready);

		// Read address channel
		   .arready(intf.arready);
		   .araddr(intf.araddr);
		   .arvalid(intf.arvalid);

		// read data channel
		   .rdata(intf.rdata);
		   .rresp(intf.rresp);
		   .rvalid(intf.rvalid);
		   .rready(intf.rready);

