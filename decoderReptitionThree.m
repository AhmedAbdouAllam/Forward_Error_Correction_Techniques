%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [DecodedMessage] = decoderReptitionThree(EncodedMessage)

LengthOfEncodedMessage=length(EncodedMessage);
LengthOfDecodedMessage=(1/3)*LengthOfEncodedMessage;
DecodedMessage=zeros([1 LengthOfDecodedMessage]);
for i = 1:LengthOfDecodedMessage
   NumberOfOnes=0;
    for k=1:3
        if EncodedMessage(3*(i-1)+k)==1
            NumberOfOnes=NumberOfOnes+1;
        end
    end
    
    if(NumberOfOnes>1)
        DecodedMessage(i)=1;
    else
        DecodedMessage(i)=0;
    end
    
end

end

