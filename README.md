#README#

A datapath is a set of functional units that carry out data processing operations. Datapaths, along with a control unit, make up the central processing unit (CPU) of a computer system. A larger data path can also be created by joining more than one datapath together using multiplexers.

The datapath is the "brawn" of a processor, since it implements the fetch-decode-execute cycle. The general discipline for datapath design is to (1) determine the instruction classes and formats in the ISA, (2) design datapath components and interconnections for each instruction class or format, and (3) compose the datapath segments designed in Step 2) to yield a composite datapath.

Simple datapath components include memory (stores the current instruction), PC or program counter (stores the address of current instruction), and ALU (executes current instruction). Note that the register file is written to by the output of the ALU.

This project was part of a series to learn how to code in Hardware Description Languages such as VHDL and Verilog. It involves the creation of complex, integrated logic components and circuitry.

Here I demonstrate the implementation of a basic Datapath.