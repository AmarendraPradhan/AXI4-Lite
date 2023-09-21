`timescale 1ns / 1ps

module top #(
             parameter DATA_WIDTH = 32,
             parameter ADDRESS_WIDTH = 32)(

        input clk,    						        // Clock
		input rst_n,  						        // Asynchronous reset active low
		input wr_en,                                //write enable
		input rd_en,                                //read enable
		input   [ADDRESS_WIDTH-1:0]  awaddr_in, 	//write address
		input	[(DATA_WIDTH/8)-1:0]   wstrb_in,    //strobe
		input	[DATA_WIDTH-1:0]	wdata_in, 		//write data
		input	[ADDRESS_WIDTH-1:0]	araddr_in, 		//read address
		output  [DATA_WIDTH-1:0] rdata_out, 	    //read data
		output  [1:0] rresp_out,			        //read response
		output  [1:0] bresp_out				        //write response
	           );
	           
			        wire awready;				        //write address ready
		            wire awvalid;				        //write address valid 
		            wire [ADDRESS_WIDTH-1:0] awaddr;	//write address
                    wire wready;				        //write data ready
		            wire wvalid;				        //write data valid
		            wire [(DATA_WIDTH/8)-1:0] wstrb;	//strobe
		            wire [DATA_WIDTH-1:0] wdata;		//write data 
		            wire [1:0]bresp;			        //write response
		            wire bvalid;				        //write response valid
		            wire bready;				        //write response ready
		            wire arready;				        //read address ready
		            wire [ADDRESS_WIDTH-1:0] araddr;	//read address
		            wire arvalid;				        //read address valid
		            wire [ADDRESS_WIDTH-1:0] rdata;		//read data
		            wire rvalid;				        //read data valid
		            wire rready;				        //read data ready
		            wire [1:0]rresp;			        //read response
		            
    master DUT_master(
                    .clk(clk),				
		            .rst_n(rst_n),			
		            .awready(awready),		
		            .awvalid(awvalid),
		            .awaddr(awaddr),
                    .wready(wready),
		            .wvalid(wvalid),
		            .wstrb(wstrb),
		            .wdata(wdata),
		            .bresp(bresp),
		            .rresp(rresp),
		            .bvalid(bvalid),
		            .bready(bready),
		            .arready(arready),
		            .araddr(araddr),
		            .arvalid(arvalid),
		            .rdata(rdata),
		            .rvalid(rvalid),
		            .rready(rready),
			        .awaddr_in(awaddr_in),
			        .wstrb_in(wstrb_in),
			        .wdata_in(wdata_in),
			        .araddr_in(araddr_in),
			        .data_out(rdata_out),
			        .rresp_out(rresp_out),
			        .bresp_out(bresp_out),
			        .wr_en(wr_en),
			        .rd_en(rd_en)
			        );
			        
			        
	slave DUT_slave(
                    .clk(clk),
		            .rst_n(rst_n),
		            .awready(awready),
		            .awvalid(awvalid),
		            .awaddr(awaddr),
                    .wready(wready),
		            .wvalid(wvalid),
		            .wstrb(wstrb),
		            .wdata(wdata),
		            .bresp(bresp),
		            .bvalid(bvalid),
		            .bready(bready),
		            .arready(arready),
		            .araddr(araddr),
		            .arvalid(arvalid),
		            .rdata(rdata),
		            .rvalid(rvalid),
		            .rready(rready),
		            .rresp(rresp)
			        );
    
endmodule
