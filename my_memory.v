module my_memory(address, data_in,clk ,rd,wr, data_out);

input [10:0]address;    //<-- represent the memo address.
input [15:0]data_in;   //<-- the data that wll wriiten in the memo (from the CPU in this project).

input rd ,wr,clk ;         //<-- read and write signals.
output reg[15:0]data_out;   //<-- represent the data read from the memo.

reg [15:0]memory[0:2047];   //<-- memo storage will hold 2028 elements in it.

initial 
begin

//Code (instructions):
memory[0] = 16'h180A;
memory[1] = 16'h580B;
memory[2] = 16'h3005;
memory[3] = 16'h280C;

//Data:
memory[10] =16'h0009;
memory[11] = 16'hFFFC;
memory[12] = 16'h0000;
end

always@(posedge clk)
begin 
if(rd)  //<-- if the read signal is 1(high) then : 
begin
data_out <= memory[address];  //<-- the data at the given memory address is placed onto the data_out register. 
end
else if(wr)  //<--  else if the write control signal is 1(high) then:
begin
memory[address] <= data_in;   //<-- the input data (data_in) is written into the memory at the specified address.
end

end
endmodule 