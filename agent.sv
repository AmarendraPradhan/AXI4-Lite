class agent extends uvm_agent;
	`uvm_component_utils(agent);
     driver drv_h;
 	 monitor mon_h;
 	 sequencer seqr_h;


	//constructor
	function new(string name = "test", uvm_component parent);
    	super.new(name,parent);
    endfunction : new

    //Build phase
	 function void build_phase(uvm_phase phase);
    
     super.build_phase(phase);
     seqr_h = sequencer::type_id::create("seqr_h",this);
     drv_h = driver::type_id::create("drv_h",this);
     mon_h = monitor::type_id::create("mon_h",this);
     endfunction : build_phase 


     virtual function void connect_phase(uvm_phase phase);
     drv_h.seq_item_port.connect(seqr_h.seq_item_export);
     	
     endfunction : connect_phase

endclass : agent
