`ifndef PERIPHERAL_UVM_AGENT
`define PERIPHERAL_UVM_AGENT

class peripheral_uvm_agent extends uvm_agent;
  // Declaration of UVC components such as.. driver, monitor, sequencer..etc
  peripheral_uvm_driver    driver;
  peripheral_uvm_sequencer sequencer;
  peripheral_uvm_monitor   monitor;

  // Declaration of component utils 
  `uvm_component_utils(peripheral_uvm_agent)

  // Method name : new 
  // Description : constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // Method name : build-phase 
  // Description : construct the components such as.. driver, monitor, sequencer..etc
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    driver    = peripheral_uvm_driver::type_id::create("driver", this);
    sequencer = peripheral_uvm_sequencer::type_id::create("sequencer", this);
    monitor   = peripheral_uvm_monitor::type_id::create("monitor", this);
  endfunction : build_phase

  // Method name : connect_phase 
  // Description : connect tlm ports ande exports (ex: analysis port/exports) 
  function void connect_phase(uvm_phase phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction : connect_phase

endclass : peripheral_uvm_agent

`endif
