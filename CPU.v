

module CPU(clock,MemData,MemOut,rd,wr,PC,IR,MBR,AC,MAR ,SR);

input clock;                   //<-- clock signal as input .
input signed [15:0]MemData;   //<-- represent the data read from the memo.

output reg signed [15:0]MemOut;      //<-- will hold the data taht we ewnat to write it in the memo.
output reg [10:0] PC,MAR;
output reg signed [15:0] IR,MBR,AC;    //<-- regsters to hold the IR , MBR ,AC
output reg wr,rd;                     //<-- write or read from memo signals.
output reg [3:0]SR;          //<-- lets say :-  0: Overflow flag, 1:Carry flag , 2: Negative flag , 3:Zero flag

reg [2:0] state ;           //<-- will track the state of the state machine and help to control the instruction execution process.
// its like constants:
parameter Load = 4'b0001 , Store = 4'b0010 , Add = 4'b0011,Sub = 4'b0100 ,Mul = 4'b0101 , Div = 4'b0110 , Branch = 4'b0111 , BRZ = 4'b1000;

initial begin
PC = 0;
state =0;
rd = 1 ;
wr=0 ;
end

always@(posedge clock)begin
	case (state)       //<-- the state here will be 0;
	0:begin           
rd = 1 ; wr =0 ;     //<-- set the read signal.
MAR<=PC;             //<-- the value of the prorgram counter(PC) will be copied to memo address(MAR)

state =1;          //<--  state is updated to 1.
  end 

// instruction fetch:
1: begin          //<-- now we are in the second state.
rd = 1 ;          //<-- set the read signal.
wr = 0 ;
IR<= MemData ;     //<-- the instruction at the memory location  is loaded into the Instruction Register.
PC<=PC+1;         //<-- increment the PC to point to the next instruction.
state=2;         //<--   state is updated to 2.
end 

// instructin decode:
2:begin 

if(IR[11] == 1)   //<-- to check if the modebit = 1  the IR is 1 thats mean the operand is a memo address
begin
MAR<=IR[10:0];     //<-- the openad in the current IR will be loaded to the MAR
end

state=3;         //<--   state is updated to 3.

end

// operand fetch 
3: begin 
state = 4;
if(IR[11] == 1)    //<-- to check if the modebit = 1  ,the IR is 1 thats mean the operand is a memo address
		 begin
   case (IR[15:12])
     // load the data from the memory to MBR :
	   Load : MBR <=MemData ;
	   Add  : MBR <= MemData;
	   Sub  : MBR <= MemData;
	   Mul  : MBR <= MemData;
	   Div  : MBR <= MemData;
	   Store: 
	   begin MBR <= AC;   //<-- in the STORE case: store the last value of the AC in MBR
	   rd = 0 ;
	   wr=1 ;
	   end   
	   Branch :        //<-- in the bransh case.
	   begin
		 PC <= MAR;   //<-- let the PC point to the new MAR in the branch case.
	   state <= 0;   //<-- reset to 0.
	   end
		 BRZ:
		 begin
		 if(SR[3] == 1'b1)   //<-- if the zeroFlag are active(SR[3] == 1'b1):
		 begin
		  PC <= MAR;       //<-- let the PC point to the new MAR in the branch case
	   state = 0;          //<-- reset to 0.
		 end
		 end
	   endcase 
	   end 
		 //*************
		 else     //<--  else the modeBit = 0  ,the IR is 1 thats mean the operand is a memo address
		 begin
		  case (IR[15:12])

       // same as above but now we are dealing with constant:
	   Load : MBR <=IR[10:0] ;
	   Add : MBR <=IR[10:0] ;
	   Sub : MBR <=IR[10:0] ;
	   Mul : MBR <=IR[10:0] ;
	   Div : MBR <=IR[10:0] ;
	   Store : begin MBR <= AC; rd = 0 ; wr=1; end   
	   Branch :
		 begin
		 PC <= MAR;
	   state <= 0;
	   end
		 BRZ:
		 begin
		 if(SR[3] == 1'b1)
		 begin
		  PC <= MAR;
	   state <= 0;
		 end
		 end
	   endcase 
	   end  
		 end
//******************************* 
 4:begin // execution
  if (IR[15:12]== 4'h1)begin
AC<=MBR;

state = 0;
end  
else if (IR[15:12]==4'h2)begin
MemOut<=MBR;
//rd <= 0 ; 
//wr <= 1 ;
state = 0;
end
else if(IR[15:12]==4'h3)begin
AC<=AC+MBR;
state=0;
end     
else if(IR[15:12]==4'h4)begin
AC<=AC-MBR;
state=0;
 end 
 else if(IR[15:12]==4'h5)begin
AC<= AC*MBR;
state=0;
 end 
 else if(IR[15:12]==4'h6)begin
AC<=AC/MBR;
state=0;
 end 
	end
	 endcase
	 end

	 endmodule 