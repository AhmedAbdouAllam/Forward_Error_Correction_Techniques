%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [DecodedMessage] = decoderReptitionFive(EncodedMessage)

LengthOfEncodedMessage=length(EncodedMessage);
LengthOfDecodedMessage=(1/5)*LengthOfEncodedMessage;
DecodedMessage=zeros([1 LengthOfDecodedMessage]);
for i = 1:LengthOfDecodedMessage
   NumberOfOnes=0;
    for k=1:5
        if EncodedMessage(5*(i-1)+k)==1
            NumberOfOnes=NumberOfOnes+1;
        end
    end
    
    if(NumberOfOnes>2)
        DecodedMessage(i)=1;
    else
        DecodedMessage(i)=0;
    end
    
end

end

