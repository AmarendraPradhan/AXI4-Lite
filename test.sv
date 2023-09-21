class test extends uvm_component;
	`uvm_component_utils(test)
	env env_h;
	sequence seq_h; 

		
//constructor
	function new(string name = "test", uvm_component parent);
    	super.new(name,parent);
    endfunction : new

//Build phase
    function void build_phase(uvm_phase phase);
    	//creating 'ENV' inside 'TEST '
    	env_h = env :: type_id :: create("env_h",this);
    endfunction : build_phase


    virtual function void end_of_elaboration_phase (uvm_phase phase);
    $display("\n Printing the UVM Topology :-\n");
    uvm_top.print_topology();
    endfunction : end_of_elaboration_phase


     virtual task run_phase(uvm_phase phase);
    //creating 'SEQ' inside test
    seq_h = sequence::type_id::create("seq_h");
    //UVM Objection
    phase.raise_objection(this);
    seq_h.start(env_h.ag_h.seqr_h);
    phase.drop_objection(this);
    endtask

endclass
