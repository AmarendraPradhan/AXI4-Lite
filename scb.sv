class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction 

	function void build_phase(uvm_phase phase);
    	//super.build_phase(phase);
	endfunction: build_phase

endclass : scoreboard
