%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [OutputStream] = Modulator(InputBitStream)
lengthOfInput=length(InputBitStream);
OutputStream=zeros([1 lengthOfInput]);
for i=1:lengthOfInput
   if InputBitStream(i)==1
       OutputStream(i)=1;
   else
        OutputStream(i)=-1;
   end
    
end


end

