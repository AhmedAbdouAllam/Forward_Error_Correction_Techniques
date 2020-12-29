%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [DecodedMessage] = HammingDecoderElevenByFiften(EncodedMessage)
lengthOfEncodedMessage=length(EncodedMessage);
LengthOfEncodedWords=lengthOfEncodedMessage/15;
lengthOfDecodedMessage=lengthOfEncodedMessage*(11/15);
DecodedMessage=zeros([1,floor(lengthOfDecodedMessage)]);

for i= 1:LengthOfEncodedWords
   DecodedMessage(11*(i-1)+1:11*(i-1)+11) =HammingSingleWordDecoderElevenByFiften(EncodedMessage(15*(i-1)+1:15*(i-1)+15));
end

