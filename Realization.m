%Authors: Ahmed A.Allam,Marina Elgohary & Amr Mamdouh
%Date:27/12/2020
%FECSelect=0 None FECSelect=1 Rept 1/3 FECSelect=2 Rept 1/5
%FECSelect=3 Hamming 4/7 FECSelect= Hamming 11/15
function [BER] = Realization(SNR,ChannelSelect,FECSelect,Fair,No_of_sent_bits)

InputBits=round(rand(1,No_of_sent_bits));

if FECSelect==0 || ChannelSelect==0
    EncodedBits=InputBits;
    SNRx=SNR;
elseif FECSelect==1
    EncodedBits=EncoderReptitionThree(InputBits);
    SNRx=-4.7712+SNR;
elseif FECSelect==2
    EncodedBits=EncoderRepititionFive(InputBits);
    if Fair==1
        SNRx=-6.9897+SNR;
    else 
        SNRx=SNR;
    end
elseif FECSelect==3
    EncodedBits=HammingEncoderThreeBySeven(InputBits);
    if Fair==1
        SNRx=-2.4304+SNR;
    else 
        SNRx=SNR;
    end        
 elseif FECSelect==4
    EncodedBits=HammingEncoderElevenByFiften(InputBits);
    if Fair==1
        SNRx=-1.3470+SNR;
    else
        SNRx=SNR;
    end
end

SentMessege=Modulator(EncodedBits);
RecievedMessege=ChannelEffect(SentMessege,ChannelSelect,SNRx);
ReceivedStream=DeModulator(RecievedMessege);
if FECSelect==0||ChannelSelect==0
    RevievedBits=ReceivedStream;
elseif FECSelect==1
    RevievedBits=decoderReptitionThree(ReceivedStream);
elseif FECSelect==2
    RevievedBits=decoderReptitionFive(ReceivedStream);
elseif FECSelect==3
    RevievedBits=HammingDecoderFourBySeven(ReceivedStream);
 elseif FECSelect==4
    RevievedBits=HammingDecoderElevenByFiften(ReceivedStream);
end
BER=ErrorCaluculation(InputBits,RevievedBits);
end

