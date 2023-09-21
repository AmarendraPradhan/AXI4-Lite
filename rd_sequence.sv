class slave_rd_seq extends uvm_sequence#(slave_seq_item);
  
  `uvm_object_utils(slave_rd_seq)
   
  //Constructor
  function new(string name = "slave_rd_seq");
    super.new(name);
  endfunction

  
  virtual task body();
    `uvm_do_with(req,{req.arvalid == 1;})
  endtask
  
endclass
