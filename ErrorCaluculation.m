%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
function [BER] = ErrorCaluculation(SentBits,RecivedBits)
%Here we see how many bits are wrong
OutOfOrderBits=0;
Shift=length(RecivedBits)-length(SentBits);

for i=1:length(SentBits)
    if(SentBits(i)~=RecivedBits(i+Shift))
        OutOfOrderBits=OutOfOrderBits+1;
    end
end
%So bit error is the ratio how many bits are wrong and total bits
BER=OutOfOrderBits/length(SentBits);
end

