class slave_sequence extends uvm_sequence#(slave_seq_item);
	`uvm_sequence_utils(sequence)

    slave_seq_item salve_seq_item_h;


    //constructor
	function new(string name = "sequence");
		super.new(name);

	endfunction : new

	virtual task body();

	req = slave_seq_item::type_id::create("req");
	wait_for_grant();
	req.randomize();
	send_request(req);
	wait_for_item_done();

	endtask

endclass
