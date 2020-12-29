%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
function [DecodedMessage] = HammingSingleWordDecoderFourBySeven(EncodedMessage)

H=[1 0 0 0 1 1 1;
   0 1 0 1 0 1 1;
   0 0 1 1 1 0 1];
SyndromeTable=syndtable(H);
VHT = bi2de(rem(EncodedMessage*H',2),'left-msb'); % Convert to decimal.
e = SyndromeTable(1+VHT,:); 
CorrectedMessage=rem(e+EncodedMessage,2);
DecodedMessage=CorrectedMessage(4:7);

end

