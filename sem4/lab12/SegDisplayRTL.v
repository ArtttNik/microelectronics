module SegDisplayRTL(segments,digit);
output [6:0] segments;
input [3:0] digit;

reg [6:0] segments;



//comb_logic:
reg [6:0] segcomb_logic;
always @( digit )
   begin

   case(   digit )

      0 :
      begin
      segcomb_logic='h7E ;
      end

      1 :
      begin
      segcomb_logic='h30;
      end

      2 :
      begin
      segcomb_logic='h6D ;
      end

      3 :
      begin
      segcomb_logic='h79;
      end

      4 :
      begin
      segcomb_logic='h33;
      end

      5 :
      begin
      segcomb_logic='h5B ;
      end

      6 :
      begin
      segcomb_logic='h5F ;
      end

      7 :
      begin
      segcomb_logic='h70;
      end

      8 :
      begin
      segcomb_logic='h7F ;
      end

      9 :
      begin
      segcomb_logic='h7B ;
      end

      default:
      begin
      segcomb_logic='h4F ;
      end


   endcase


   segments  = (segcomb_logic);

   end

endmodule
