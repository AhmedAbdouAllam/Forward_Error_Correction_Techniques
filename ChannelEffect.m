%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
%Note that: Choice=0 indicates AWGN Channel
%Note that: Choice=1 indicates AWGN with Rayleigh Fading Channel
function [RecievedBits] = ChannelEffect(TransmittedBits,Choice,SNR)

if Choice==0
    RecievedBits=awgn(TransmittedBits,SNR);
    
elseif Choice==1
    FaddedBits=TransmittedBits.*random('Rayleigh',1,1,length(TransmittedBits));
    RecievedBits=awgn(FaddedBits,SNR);    
end



end

