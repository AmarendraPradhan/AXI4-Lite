class slave_monitor extends uvm_monitor;
	`uvm_component_utils(slave_monitor)

	// Virtual Interface
  virtual intf_if vif;

   uvm_analysis_port #(slave_seq_item) item_collected_port;

   slave_seq_item trans_collected;

   `uvm_component_utils(slave_monitor)

	// new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
  endfunction : new


	function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual slave_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  	endfunction: build_phase


  	 // run phase
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.MONITOR.clk);
      wait(vif.monitor_cb.awvalid || vif.monitor_cb.awready);
      //  trans_collected.addr = vif.monitor_cb.addr;
      if(vif.monitor_cb.awvalid) begin
        trans_collected.awvalid = vif.monitor_cb.awready;
        trans_collected.wdata = vif.monitor_cb.wdata;
        trans_collected.rd_en = 0;
        @(posedge vif.MONITOR.clk);
      end
      if(vif.monitor_cb.rd_en) begin
        trans_collected.rd_en = vif.monitor_cb.rd_en;
        trans_collected.wr_en = 0;
        @(posedge vif.MONITOR.clk);
        @(posedge vif.MONITOR.clk);
        trans_collected.rdata = vif.monitor_cb.rdata;
      end
      item_collected_port.write(trans_collected);
    end 
  endtask : run_phase

endclass : monitor		
