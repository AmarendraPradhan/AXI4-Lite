class env extends uvm_env;
`uvm_component_utils(env)
 agent agent_h;
 scoreboard scb_h;




// constructor
 function new(string name = "env", uvm_component parent);
 	 super.new(name , parent);
 endfunction : new


 //build phase
 function void build_phase(uvm_phase phase);
 	agent_h = agent::type_id::create("agent_h",this);
 	scb_h = scoreboard::type_id::create("scb_h",this);
 endfunction : build_phase      

endclass 

