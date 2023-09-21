class slave_wr_seq extends uvm_sequence#(slave_seq_item);

	 `uvm_object_utils(slave_wr_seq)


	 //Constructor
  	function new(string name = "slave_wr_seq");
    super.new(name);
  	endfunction


  	virtual task body();
    `uvm_do_with(req,{req.awvalid == 1;})
  	endtask


  endclass