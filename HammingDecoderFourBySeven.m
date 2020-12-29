%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [DecodedMessage] = HammingDecoderFourBySeven(EncodedMessage)
lengthOfEncodedMessage=length(EncodedMessage);
LengthOfEncodedWords=lengthOfEncodedMessage/7;
lengthOfDecodedMessage=lengthOfEncodedMessage*(4/7);
DecodedMessage=zeros([1,lengthOfDecodedMessage]);

for i= 1:LengthOfEncodedWords
   DecodedMessage(4*(i-1)+1:4*(i-1)+4) =HammingSingleWordDecoderFourBySeven(EncodedMessage(7*(i-1)+1:7*(i-1)+7));
end

