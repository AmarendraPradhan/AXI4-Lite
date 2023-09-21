 class driver extends uvm_driver#(seq_item);
 	`uvm_component_utils(driver)

 	virtual slave_if vif;
 
	function new(string name = "driver", uvm_component parent);
 	 super.new(name , parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual slave_if)::get(this, "", "vif", vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  	endfunction: build_phase 

  	task run_phase(uvm_phase phase);
     seq_item seq_item_h;

      // drive 
  virtual task drive();
    req.print();
      `DRIV_IF.awvalid <= 0;
      `DRIV_IF.arvalid <= 0;
      @(posedge vif.DRIVER.clk);
    //  `DRIV_IF.addr <= req.addr;
    if(req.awvalid) begin
        `DRIV_IF.awvalid <= req.awvalid;
        `DRIV_IF.wdata <= req.wdata;
      $display("\t awvalid = %0h \tWDATA = %0h",req.awvalid,trans.wdata);
        @(posedge vif.DRIVER.clk);
      end

       if(req.arvalid) begin
        `DRIV_IF.arvalid <= req.arvalid;
        @(posedge vif.DRIVER.clk);
        `DRIV_IF.arvalid <= 0;
        @(posedge vif.DRIVER.clk);
        req.rdata = `DRIV_IF.rdata;
        $display("\t arvalid = %0h \tRDATA = %0h",trans.addr,`DRIV_IF.rdata);
      end
      $display("-----------------------------------------");
  endtask : drive


 	endtask : run_phase

 endclass : driver
