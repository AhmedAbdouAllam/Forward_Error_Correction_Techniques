%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [Encoded_Message] = EncoderReptitionThree(Message)


LengthOfMessage=length(Message);
Encoded_Message=zeros([1 3*LengthOfMessage]);

for i = 1:LengthOfMessage

  Encoded_Message(3*(i-1)+1)=Message(i);
  Encoded_Message(3*(i-1)+2)=Message(i);
  Encoded_Message(3*(i-1)+3)=Message(i);  
end


end

