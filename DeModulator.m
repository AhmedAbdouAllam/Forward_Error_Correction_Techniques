%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [OutputBitStream] = DeModulator(InputStream)
lengthOfInput=length(InputStream);
OutputBitStream=zeros([1 lengthOfInput]);
for i=1:lengthOfInput
   if InputStream(i)<0
       OutputBitStream(i)=0;
   else
        OutputBitStream(i)=1;
   end
    
end


end

